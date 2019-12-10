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

    let quizzModel = Quizz10Model()
    quizzModel.download()

    let imageStore = imageStore()

    let contentView = ContentView()
      .environmentObject(quizzModel)

    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
