//
//  QuizzDetail.swift
//  P5_IWEB19
//
//  Created by Alberto Martinez on 22/12/19.
//  Copyright © 2019 g950 DIT UPM. All rights reserved.
//

import SwiftUI

struct QuizzDetail: View {
    
    @EnvironmentObject var imageStore: ImageStore
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State var answer: String = ""
    @State var trueAnswer = false
    @State var falseAnswer = false
    var quizzItem: QuizzItem
    
    var body: some View {
        
        GeometryReader { geometry in
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
                   
                    Button(action: {
                            self.trueAnswer = true
                    }) {Text("Comprobar")}
                        .alert(isPresented: self.$trueAnswer) {
                             if self.answer.lowercased() == self.quizzItem.answer.lowercased() {
                                return Alert(title: Text("Buena repuesta"), message: Text("Bravo, tiene la buena repuesta."))}
                             else {
                                return Alert(title: Text("Mala repuesta"), message: Text("Lo siento pero no es la buena repuesta. Era \(self.quizzItem.answer)."))}
                            
                    }
                        
                }
                
                Spacer()
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
            }
        .edgesIgnoringSafeArea(.all)
//            .background(Color(red: 0.20, green: 0.25, blue: 1))
            
        }
    }
}
