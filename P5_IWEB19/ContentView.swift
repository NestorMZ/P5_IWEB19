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

    var body: some View {
        NavigationView {
            List {
                ForEach(quizzModel.quizzes){ item in
                    QuizzRow(quizzItem: item)
                    Text("Hello")
                }
            }
        
    .navigationBarTitle(Text("P5 UI Quizz"))
//        .navigationBarItems(trailing: Button(action: {
//            self.quizzModel.download()}, label: (Image)))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
