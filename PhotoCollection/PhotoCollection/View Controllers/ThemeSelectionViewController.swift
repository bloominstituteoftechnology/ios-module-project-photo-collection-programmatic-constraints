//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
    }

    @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    var themeHelper: ThemeHelper?
    
    
    func setUpSubviews() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Choose a theme"
        view.addSubview(label)
        
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Dark", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        view.addSubview(button)
        
        button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        button.leadingAnchor.constraint(equalTo: label.leadingAnchor, constant: 20).isActive = true
        
        let button2 = UIButton()
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.setTitle("Blue", for: .normal)
        button2.backgroundColor = .systemBlue
        button2.layer.cornerRadius = 5
        button2.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        view.addSubview(button2)
        
        button2.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        button2.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: -20).isActive = true
    }
}
