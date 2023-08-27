//
//  OAuthModelDelegate.swift
//  MobileApp
//
//  Created by Yulia Ignateva on 22.04.2022.
//

import UIKit

protocol OAuthModelDelegate: AnyObject {
    func showPage(at: URL)
    func dismissWith(result: Result, token: String?)
    func dismiss()
}
