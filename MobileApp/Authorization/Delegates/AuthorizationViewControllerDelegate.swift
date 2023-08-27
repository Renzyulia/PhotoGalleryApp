//
//  AuthorizationViewControllerDelegate.swift
//  MobileApp
//
//  Created by Yulia Ignateva on 23.04.2022.
//

import UIKit

protocol AuthorizationViewControllerDelegate: AnyObject {
    func userDidAuthorizeSuccessfully(withToken: String)
}
