//
//  Quizz10Model.swift
//  P5_IWEB19
//
//  Created by g950 DIT UPM on 10/12/2019.
//  Copyright © 2019 g950 DIT UPM. All rights reserved.
//

import Foundation

struct QuizzItem: Codable, Identifiable {
    let id: Int
    let question: String
    let answer: String
    let author: Author?
    let attachment: Attachment?
    let favourite: Bool
    let tips: [String]
    
    struct Author: Codable {
        let isAdmin: Bool?
        let username: String
        let photo: Attachment?
    }
    
    struct Attachment: Codable {
        let filename: String
        let mime: String
        let url: URL?
    }
}


class Quizz10Model {
    
    @Published var quizzes = [QuizzItem]()
    
    func download(){
        let surl = "https://quiz.dit.upm.es/api/quizzes/random10wa?token=5ef285733ffdf65b8049"
        
        guard let url = URL(string: surl) else {
            print("mal malo malisimo malo")
            return
        }
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                
                let decoder = JSONDecoder()
                let quizzes = try decoder.decode([QuizzItem].self, from: data)
                self.quizzes = quizzes
                
                DispatchQueue.main.async {
                    self.quizzes = quizzes
                    print("Termina de descarga")
                }
                
            } catch {
                DispatchQueue.main.async {
                    print("Algo malo ha pasado")
                }
            }
        }
    }
}
