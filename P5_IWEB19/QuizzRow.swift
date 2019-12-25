//
//  QuizzRow.swift
//  P5_IWEB19
//
//  Created by Nestor Martinez on 22/12/19.
//  Copyright © 2019 g950 DIT UPM. All rights reserved.
//

import SwiftUI

struct QuizzRow: View {
    
    var quizzItem : QuizzItem
    @EnvironmentObject var imageStore: ImageStore
    @EnvironmentObject var quizzModel: Quizz10Model
    
    var body: some View {
        HStack {
            Image(uiImage: self.imageStore.image(url: self.quizzItem.attachment?.url))
                .resizable()
                .frame(width: 150, height: 150)
                .scaledToFill()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 3))
                .shadow(radius: 10)
                .padding(.trailing)
            
            
            VStack {
                Text(quizzItem.question)
                    .font(.body)
                    .lineLimit(3)
                
                HStack {
                    Button(action: {
                        self.quizzModel.addToFavorite(self.quizzItem)
                        if let indexRow = self.quizzModel.quizzes.firstIndex(where: {$0.id == self.quizzItem.id}) {
                            self.quizzModel.quizzes[indexRow].favourite = !(self.quizzItem.favourite)
                        }
                    }) {
                        Image (quizzItem.favourite ?
                            "coraLleno" : "coraVacio")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .scaledToFill()}
                        .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    VStack(alignment: .trailing){
                        Text(quizzItem.author!.username)
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                        
                        Image(uiImage: self.imageStore.image(url: self.quizzItem.author?.photo?.url))
                            .resizable()
                            .frame(width: 20, height: 20)
                            .scaledToFill()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray,lineWidth: 1))
                    }}
            }
            
        }
    }
}
