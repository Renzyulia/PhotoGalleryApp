//
//  LoginButton.swift
//  MobileApp
//
//  Created by Yulia Ignateva on 26.04.2022.
//

import UIKit

final class LoginButton: UIControl {
    private let label = UILabel()
    
    init() {
        super.init(frame: .zero)
        configureLoginButton()
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func configureLoginButton() {
        backgroundColor = .black
        layer.masksToBounds = true
        layer.cornerRadius = 13
    }
    
    private func configureLabel() {
        label.text = "Вход через VK"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -17),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
