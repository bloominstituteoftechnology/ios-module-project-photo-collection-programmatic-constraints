//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    func setupSubviews() {
        let label = UILabel()
        let darkButton = UIButton(type: .system)
        let blueButton = UIButton(type: .system)
        view.addSubview(label)
        view.addSubview(darkButton)
        view.addSubview(blueButton)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "What theme would you like to use"
        label.textAlignment = .center
        
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        darkButton.setTitle("Dark Theme", for: .normal)
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.setTitle("Blue Theme", for: .normal)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        
        darkButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8).isActive = true
        darkButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -50).isActive = true
        
        blueButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8).isActive = true
        blueButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 50).isActive = true
        
    }
    
    @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
}
