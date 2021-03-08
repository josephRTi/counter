//
//  SecondViewController.swift
//  counter
//
//  Created by Егор Уваров on 06.03.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    private var loginTextField: UITextField = {
        let textField = UITextField()
        textField.tag = 9
        textField.placeholder = "Your login"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 15
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.tag = 10
        textField.placeholder = "Your password"
        textField.backgroundColor = .white
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 15
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private var authButton:UIButton = {
        var authButton = UIButton()
        authButton.layer.cornerRadius = 15
        authButton.translatesAutoresizingMaskIntoConstraints = false
        return authButton
    }()
    
    private var login: String? = ""
    private var password: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Login"
        
        view.backgroundColor = .orange
        loginTextField.delegate = self
        passwordTextField.delegate = self
        authButton.addTarget(self, action: #selector(authAction), for: .touchUpInside)
        authButton.setTitle("Login", for: .normal)
        authButton.backgroundColor = .systemBlue
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(authButton)
        
        NSLayoutConstraint.activate([
            loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            loginTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            loginTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.height * 0.15),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            passwordTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 30),
            authButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            authButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            authButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            authButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
        ])
    }
    
    @objc func authAction(){

        let alert = UIAlertController(title: "SAVED", message: "Thank u for ur data", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension SecondViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        view.endEditing(true)
        if textField.tag == 9 {
            login = textField.text
        }
        
        if textField.tag == 10 {
            password = textField.text
        }
    }
}
