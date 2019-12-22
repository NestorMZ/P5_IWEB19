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
    var quizzItem: QuizzItem
    
    var body: some View {
        
        VStack {
            Spacer()
            VStack {
                Image(uiImage: self.imageStore.image(url: self.quizzItem.attachment?.url))
                    .resizable()
                    .scaledToFill()
                    .frame(height: CGFloat(300.0))
                    .edgesIgnoringSafeArea(.all)
                    .padding(.bottom)
                    .clipShape(Rectangle())
                    .overlay(Rectangle().stroke(Color.black, lineWidth: 5))
                    .shadow(radius: 10)
                
                Text("\(quizzItem.question)")
                
            }
            
            Spacer()
            HStack {
                Text(quizzItem.author!.username)
                .padding(.bottom)
        
                Image(uiImage: self.imageStore.image(url: self.quizzItem.author!.photo?.url))
                    .resizable()
                    .frame(width: 40, height: 40)
                    .scaledToFill()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.blue, lineWidth: 5))
                    .padding(.bottom)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.init(red: 55, green: 79, blue: 255))
    }
}
