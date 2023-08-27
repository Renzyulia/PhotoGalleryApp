//
//  OAuthModel.swift
//  MobileApp
//
//  Created by Yulia Ignateva on 22.04.2022.
//

import UIKit

enum Result {
    case success
    case error
}

final class OAuthModel {
    weak var delegate: OAuthModelDelegate?
    
    private let urlRequest = URL(string: "https://oauth.vk.com/authorize?client_id=51622196&display=page&redirect_uri=https://oauth.vk.com/blank.html&scope=4&response_type=token&v=5.131")
    
    // MARK: - Public methods
    
    func viewDidLoad() {
        delegate?.showPage(at: urlRequest!)
    }
    
    func didReceiveRedirectUrl(_ url: URL) {
        guard let decodedStringUrl = url.absoluteString.removingPercentEncoding else { return }
        if decodedStringUrl.range(of: "error=") != nil {
            if decodedStringUrl.range(of: "error_reason=user_denied") != nil {
                delegate?.dismiss()
            } else {
                delegate?.dismissWith(result: .error, token: nil)
            }
        } else {
            guard let prefixRange = decodedStringUrl.range(of: "#access_token=") else { return }
            let tokenFirstIndex = prefixRange.upperBound
            guard tokenFirstIndex < decodedStringUrl.endIndex else { return }
            let token = String(decodedStringUrl[tokenFirstIndex...])
            TokenManager.shared.save(token: token)
            delegate?.dismissWith(result: .success, token: token)
        }
    }
}
