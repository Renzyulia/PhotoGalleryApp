//
//  UIImageView+loadImage.swift
//  MobileApp
//
//  Created by Yulia Ignateva on 24.04.2022.
//

import UIKit

extension UIImageView {
    func loadImage(with url: URL) {
        ImageManager.shared.loadImage(url: url) { [weak self] image in
            self?.image = image
        }
    }
}
