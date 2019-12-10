//
//  Quizz10Model.swift
//  Practica 4 - Quizz
//
//  Created by g950 DIT UPM on 14/11/2019.
//  Copyright © 2019 g950 DIT UPM. All rights reserved.
//

import Foundation

struct QuizzItem: Codable {
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


class Quizz10Model: ObservableObject {

    var quizzes = [QuizzItem]()

    func download(completionHandler: @escaping () -> (), errorHandler: @escaping (String) -> ()){
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
                    completionHandler()
                }

            } catch {
                DispatchQueue.main.async {
                    errorHandler("Algo malo ha pasado")
                }
            }
        }
    }
}
