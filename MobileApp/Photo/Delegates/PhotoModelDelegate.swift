//
//  PhotoModelDelegate.swift
//  MobileApp
//
//  Created by Yulia Ignateva on 25.04.2022.
//

import UIKit

protocol PhotoModelDelegate: AnyObject {
    func showPhotoView(_: URL, byDate: String, item: Int)
    func showLoadingPhotoError()
    func showShareMenu()
    func showSuccessfulSaving()
    func showSavingError()
}
