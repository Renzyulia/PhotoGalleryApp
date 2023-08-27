//
//  PhotoGalleryDataSourceDelegate.swift
//  MobileApp
//
//  Created by Yulia Ignateva on 15.06.2022.
//

import UIKit

protocol PhotoGalleryDataSourceDelegate: AnyObject {
    func didSelectItem(_: Int)
}
