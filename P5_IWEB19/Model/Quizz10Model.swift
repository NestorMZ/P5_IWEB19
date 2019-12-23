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
    var favourite: Bool
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


class Quizz10Model : ObservableObject{
    
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
                
                DispatchQueue.main.async {
                    self.quizzes = quizzes
                    print("Termina de descarga : \(quizzes.count)")
                }
                
            } catch {
                DispatchQueue.main.async {
                    print("Algo malo ha pasado")
                }
            }
        }
    }
    
    func addToFavorite(_ quizzItem: QuizzItem){
        guard let indexRow = quizzes.firstIndex(where: {$0.id == quizzItem.id})
            else {
            print("ERROR[1]: index error")
            return
        }
        
        let surl = "https://quiz.dit.upm.es/api/users/tokenOwner/favourites/\(quizzItem.id)?token=5ef285733ffdf65b8049"
        
        guard let url = URL(string: surl) else {
            print("ERROR[2]: error with the url \(surl)")
            return
        }
        
        let config = URLSessionConfiguration.default // Crear una session
        let session = URLSession(configuration: config) // URL del sitio de subida

        // La petición HTTP:
        var request = URLRequest(url: url)
        if quizzItem.favourite==true {
            request.httpMethod = "DELETE"
            
        }
        else {
            request.httpMethod = "PUT"
        }
        
        let task = session.dataTask(with: request) {
            (data: Data?, res: URLResponse?, error: Error?) in
            
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            let code = (res as! HTTPURLResponse).statusCode
            if code != 200 {
                print(HTTPURLResponse.localizedString(forStatusCode: code))
                return
            }
        }
        task.resume() // Arrancar la tarea
    }
}
