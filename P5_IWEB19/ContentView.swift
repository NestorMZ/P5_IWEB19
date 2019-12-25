//
//  ContentView.swift
//  P5_IWEB19
//
//  Created by g950 DIT UPM on 29/11/2019.
//  Copyright © 2019 g950 DIT UPM. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var quizzModel: Quizz10Model
    private let defaults = UserDefaults.standard
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(quizzModel.quizzes){ item in
                        NavigationLink(destination: QuizzDetail(quizzItem: item)) {
                            QuizzRow(quizzItem: item)
                        }
                    }
                }
                .navigationBarTitle(Text("P5 QuizzUI"))
                .navigationBarItems(trailing: Button(action: {
                    self.quizzModel.download()}) { Image(systemName: "arrow.clockwise") })
            }
            VStack(alignment: .trailing){
                Spacer()
                HStack{
                    Spacer()
                    Text("\(quizzModel.goodAnswers.count)")
                        .padding(.horizontal)
                        .background(Color(red: 0.20, green: 0.25, blue: 1))
                        .font(.body)
                        .foregroundColor(Color.white)
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
