//
//  PhotoGalleryModelDelegate.swift
//  MobileApp
//
//  Created by Yulia Ignateva on 23.04.2022.
//

import UIKit

protocol PhotoGalleryModelDelegate: AnyObject {
    func showPhotoGalleryView(photos: [URL])
    func showPhoto(item: Int, photoUrl: [URL])
    func showLoadingError()
    func dismiss() 
}
