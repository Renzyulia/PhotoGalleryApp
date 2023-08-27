//
//  OAuthViewControllerDelegate.swift
//  MobileApp
//
//  Created by Yulia Ignateva on 22.04.2022.
//

import UIKit

protocol OAuthViewControllerDelagate: AnyObject {
    func userDidAuthorizeSuccessfully(withToken: String)
    func didAuthorizeError()
    func userDidCancel()
}
