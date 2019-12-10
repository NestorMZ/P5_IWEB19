//
//  imageStore.swift
//  P5_IWEB19
//
//  Created by g950 DIT UPM on 10/12/2019.
//  Copyright © 2019 g950 DIT UPM. All rights reserved.
//

import SwiftUI

class ImageStore: ObservableObject {
    
    @Published var imageCache = [URL:UIImage]()

    let defaultImage = UIImage(named: "none")!
    
    func image(url: URL?) -> UIImage {
        
        guard let url = url else {
            return defaultImage
        }
        
        if let img = imageCache[url] {
            return img
        }
        
        self.imageCache[url] = defaultImage
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url),
                let img = UIImage(data: data) {
            
                print(url)
            
                DispatchQueue.main.async {
                    self.imageCache[url] = img
                }
            }
        }
        
        return defaultImage
    }
}
