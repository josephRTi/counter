//
//  ContentView.swift
//  counter
//
//  Created by Егор Уваров on 06.03.2021.
//

import SwiftUI

class ViewController: UIViewController{
    
    private var label = UILabel()
    private var tapButton:UIButton = {
        let tapButton = UIButton()
        tapButton.backgroundColor = .systemBlue
        tapButton.setTitle("TAP", for: .normal)
        tapButton.translatesAutoresizingMaskIntoConstraints = false
        tapButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        tapButton.layer.cornerRadius = UIScreen.main.bounds.width * 0.3 / 2
        tapButton.layer.masksToBounds = true
        return tapButton
    }()
    private var resetButton = UIButton()
    private var loginButton = UIButton()
    private var counter = 0{
        didSet{
            label.text = counter.description
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        title = "Counter"
        
        view.addSubview(label)
        
        resetButton.setTitle("Reset", for: .normal)
        resetButton.setTitleColor(.systemBlue, for: .normal)
        resetButton.addTarget(self, action: #selector(resetCounter), for: .touchUpInside)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: resetButton)
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.systemBlue, for: .normal)
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: loginButton)
        
        label.text = counter.description
        label.font = UIFont.systemFont(ofSize: 50, weight:.medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tapButton)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.height * 0.3),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tapButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 150),
            tapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tapButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            tapButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
        ])
    
        
    }
    
    @objc func tapAction(){
        counter += 1
    }
    
    @objc func resetCounter(){
        counter = 0
    }

    @objc func loginAction(){
        navigationController?.pushViewController(SecondViewController(), animated: true)
    }

}

