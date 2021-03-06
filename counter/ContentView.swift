//
//  ContentView.swift
//  counter
//
//  Created by Егор Уваров on 06.03.2021.
//

import SwiftUI

class ViewController: UIViewController{
    
    private var label = UILabel()
    private var tapButton = UIButton()
    private var resetButton = UIButton()
    private var counter = 0{
        didSet{
            label.text = counter.description
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        title = "Counter"
        
        view.addSubview(tapButton)
        view.addSubview(label)
        
        resetButton.setTitle("Reset", for: .normal)
        resetButton.setTitleColor(.systemBlue, for: .normal)
        resetButton.addTarget(self, action: #selector(resetCounter), for: .touchUpInside)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: resetButton)
        
        label.text = counter.description
        label.font = UIFont.systemFont(ofSize: 30, weight:.medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        tapButton.backgroundColor = .blue
        tapButton.setTitle("TAP", for: .normal)
        tapButton.translatesAutoresizingMaskIntoConstraints = false
        tapButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tapButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            tapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func tapAction(){
        counter += 1
    }
    
    @objc func resetCounter(){
        counter = 0
    }

}

