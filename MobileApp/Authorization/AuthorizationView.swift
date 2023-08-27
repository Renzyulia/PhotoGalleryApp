//
//  AuthorizationView.swift
//  MobileApp
//
//  Created by Yulia Ignateva on 21.04.2022.
//

import UIKit

final class AuthorizationView: UIView {
    weak var delegate: AuthorizationViewDelegate?
    
    private let textLabel = UILabel()
    private let loginButton = LoginButton()
    
    init() {
        super.init(frame: .zero)
        configureTextLabel()
        configureLoginButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func configureTextLabel() {
        textLabel.text = "Mobile Up" + "\n" + "Gallery"
        textLabel.textColor = .black
        textLabel.textAlignment = .left
        textLabel.font = .systemFont(ofSize: 48, weight: .bold)
        textLabel.numberOfLines = 2
        
        addSubview(textLabel)
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 170),
            textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            textLabel.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor)
        ])
    }
    
    private func configureLoginButton() {
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        
        addSubview(loginButton)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -42),
            loginButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            loginButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16)
        ])
    }
    
    @objc private func didTapLogin() {
        delegate?.didTapLogin()
    }
}
