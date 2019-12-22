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

    var body: some View {
        HStack {
            Image(uiImage: self.imageStore.image(url: self.quizzItem.attachment?.url))
                .resizable()
                .frame(width: 150, height: 150)
            .scaledToFill()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 5))
                .shadow(radius: 10)
                .padding(.trailing)

            VStack {
                Text(quizzItem.question)
                    .font(.body)
                Text(quizzItem.author!.username)
                    .font(.footnote)
            }

//            VStack(alignment: .leading){
//                Text("-")
////                HStack(alignment: .top){
////                    Image (quizzItem.favourite ?
////                        "coraLleno" : "coraVacio")
//                //}
//            }
        }
//        .background(Color.black)
    }
}

struct QuizzRow_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hey")
    }
}
