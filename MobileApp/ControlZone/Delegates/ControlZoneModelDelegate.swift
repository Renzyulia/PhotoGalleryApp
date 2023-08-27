//
//  RootModelDelegate.swift
//  MobileApp
//
//  Created by Yulia Ignateva on 23.04.2022.
//

import UIKit

protocol ControlZoneModelDelegate: AnyObject {
    func showAuthorization()
    func showUserProfile(token: String)
}
