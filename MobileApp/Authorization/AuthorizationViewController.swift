//
//  AuthorizationViewController.swift
//  MobileApp
//
//  Created by Yulia Ignateva on 21.04.2022.
//

import UIKit

final class AuthorizationViewController: UIViewController, AuthorizationViewDelegate, AuthorizationModelDelegate, OAuthViewControllerDelagate {
    weak var delegate: AuthorizationViewControllerDelegate?
    
    private var authorizationView: AuthorizationView? = nil
    private var authorizationModel: AuthorizationModel? = nil
    private var oauthViewController: OAuthViewController? = nil
    
    // MARK: - Public methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let authorizationView = AuthorizationView()
        self.authorizationView = authorizationView
        authorizationView.delegate = self
        
        let authorizationModel = AuthorizationModel()
        self.authorizationModel = authorizationModel
        authorizationModel.delegate = self
        
        view.addSubview(authorizationView)
        
        authorizationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            authorizationView.topAnchor.constraint(equalTo: view.topAnchor),
            authorizationView.leftAnchor.constraint(equalTo: view.leftAnchor),
            authorizationView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            authorizationView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    func didTapLogin() {
        authorizationModel?.didTapLogin()
    }
    
    func openOAuthView() {
        let oauthViewController = OAuthViewController()
        self.oauthViewController = oauthViewController
        oauthViewController.delegate = self
        
        self.embed(oauthViewController)
    }
    
    func userDidAuthorizeSuccessfully(withToken token: String) {
        oauthViewController?.remove()
        delegate?.userDidAuthorizeSuccessfully(withToken: token)
    }
    
    func didAuthorizeError() {
        oauthViewController?.remove()
        authorizationModel?.didAuthorizeError()
    }
    
    func showAuthorizeError() {
        let alert = UIAlertController(title: nil, message: "Ошибка авторизации", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    func userDidCancel() {
        oauthViewController?.remove()
    }
}
