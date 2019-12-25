//
//  Puntos.swift
//  P5_IWEB19
//
//  Created by Nestor Martinez on 24/12/19.
//  Copyright © 2019 g950 DIT UPM. All rights reserved.
//

import SwiftUI

class Puntos: ObservableObject{
    
    @Published var puntos = Int()
    let defaults = UserDefaults.standard
    
    func numero(){
        self.puntos = defaults.integer(forKey: "puntos")
    }
}
