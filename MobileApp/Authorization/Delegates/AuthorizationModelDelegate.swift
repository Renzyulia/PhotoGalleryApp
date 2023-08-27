//
//  AuthorizationModelDelegate.swift
//  MobileApp
//
//  Created by Yulia Ignateva on 22.04.2022.
//

import UIKit

protocol AuthorizationModelDelegate: AnyObject {
    func openOAuthView()
    func showAuthorizeError()
}
