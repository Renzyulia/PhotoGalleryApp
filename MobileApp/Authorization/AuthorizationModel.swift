//
//  AuthorizationModel.swift
//  MobileApp
//
//  Created by Yulia Ignateva on 22.04.2022.
//

import UIKit

final class AuthorizationModel {
    weak var delegate: AuthorizationModelDelegate?
    
    func didTapLogin() {
        delegate?.openOAuthView()
    }
    
    func didAuthorizeError() {
        delegate?.showAuthorizeError()
    }
}
