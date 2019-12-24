//
//  QuizzDetail.swift
//  P5_IWEB19
//
//  Created by Alberto Martinez on 22/12/19.
//  Copyright © 2019 g950 DIT UPM. All rights reserved.
//

import SwiftUI

struct QuizzDetail: View {
    
    private let defaults = UserDefaults.standard
    
    @EnvironmentObject var imageStore: ImageStore
    @EnvironmentObject var quizzModel: Quizz10Model
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State var answer: String = ""
    @State var trueAnswer = false
    
    var quizzItem: QuizzItem
    
    var body: some View {
        var puntos = defaults.integer(forKey: "puntos")
        
        return GeometryReader { geometry in
            VStack {
                VStack {
                    Image(uiImage: self.imageStore.image(url: self.quizzItem.attachment?.url))
                        .resizable()
                        .frame(width: geometry.size.width, height: 300)
                        .scaledToFill()
                        .shadow(radius: 10)
                    
                    Text("\(self.quizzItem.question)")
                        .font(.title)
                    
                    TextField("¿una idea?", text: self.$answer)
                        .multilineTextAlignment(.center)
                        .overlay(Rectangle().stroke(Color.gray))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                   
                    Button(action: {
                            self.trueAnswer = true
                    }) {Text("Comprobar")}
                        .alert(isPresented: self.$trueAnswer) {
                             if self.answer.lowercased() == self.quizzItem.answer.lowercased() {
                                puntos = puntos+1
                                self.defaults.set(puntos, forKey: "puntos")
                                
                                return Alert(title: Text("Buena repuesta"), message: Text("Bravo, tiene la buena repuesta."))}
                             else {
                                return Alert(title: Text("Mala repuesta"), message: Text("Lo siento pero no es la buena repuesta. Era \(self.quizzItem.answer)."))}
                            
                    }
                        
                }
                
                Spacer()
                HStack {
                    HStack {
                        Text(self.quizzItem.author!.username)
                        .padding(.bottom)
                
                        Image(uiImage: self.imageStore.image(url: self.quizzItem.author!.photo?.url))
                            .resizable()
                            .frame(width: 40, height: 40)
                            .scaledToFill()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color(red: 0.20, green: 0.25, blue: 1), lineWidth: 3))
                            .padding(.bottom)
                    }
                    
                    Text("\(puntos)")
                }
            }
        .edgesIgnoringSafeArea(.all)
        .navigationBarItems(trailing: Button(action: {
            self.quizzModel.addToFavorite(self.quizzItem)
            if let indexRow = self.quizzModel.quizzes.firstIndex(where: {$0.id == self.quizzItem.id}) {
                self.quizzModel.quizzes[indexRow].favourite = !(self.quizzItem.favourite)
            }
        }) {
            Image (self.quizzItem.favourite ?
                "coraLleno" : "coraVacio")
                .resizable()
                .frame(width: 30, height: 30)
                .scaledToFill()}
            .buttonStyle(PlainButtonStyle()))
//            .background(Color(red: 0.20, green: 0.25, blue: 1))
            
        }
    }
}
