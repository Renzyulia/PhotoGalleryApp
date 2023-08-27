//
//  RootModel.swift
//  MobileApp
//
//  Created by Yulia Ignateva on 23.04.2022.
//

import UIKit

final class ControlZoneModel {
    weak var delegate: ControlZoneModelDelegate?
    
    // MARK: - Public methods
    
    func viewDidLoad() {
        if let token = TokenManager.shared.getToken() {
            delegate?.showUserProfile(token: token)
        } else {
            delegate?.showAuthorization()
        }
    }
    
    func userDidAuthorizeSuccessfully(withToken token: String) {
        delegate?.showUserProfile(token: token)
    }
    
    func didTapExit() {
        delegate?.showAuthorization()
    }
}
