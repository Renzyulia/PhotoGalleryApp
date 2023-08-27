//
//  ImageManager.swift
//  MobileApp
//
//  Created by Yulia Ignateva on 24.04.2022.
//

import UIKit

final class ImageManager {
    static let shared = ImageManager()
    
    private var cashe = Cache.shared
    
    private init() {}
    
    func loadImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        if let image = cashe.value(forKey: url) {
            completion(image)
        } else {
            URLSession.shared.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    guard let data = data, error == nil else {
                        completion(nil)
                        return
                    }
                    self.cashe.insert(UIImage(data: data)!, forKey: url)
                    completion(self.cashe.value(forKey: url))
                }
            }.resume()
        }
    }
}
