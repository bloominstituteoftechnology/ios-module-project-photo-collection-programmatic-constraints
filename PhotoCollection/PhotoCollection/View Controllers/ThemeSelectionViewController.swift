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
    
    override func viewWillAppear(_ animated: Bool) {
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
    
    private func setUpSubviews() {
        let promptLabel = UILabel()
        promptLabel.textAlignment = .center
        promptLabel.text = "Select a theme"
        promptLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(promptLabel)
        
        NSLayoutConstraint.activate([
            promptLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            promptLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            promptLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
        
        let darkButton = UIButton(type: .system)
        darkButton.setTitle("Dark", for: .normal)
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(darkButton)
        
        NSLayoutConstraint.activate([
            darkButton.topAnchor.constraint(equalTo: promptLabel.bottomAnchor, constant: 20),
            darkButton.centerXAnchor.constraint(equalTo: promptLabel.centerXAnchor, constant: 0)
        ])
        
        let blueButton = UIButton(type: .system)
        blueButton.setTitle("Blue", for: .normal)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blueButton)
        
        NSLayoutConstraint.activate([
            blueButton.topAnchor.constraint(equalTo: darkButton.bottomAnchor, constant: 20),
            blueButton.centerXAnchor.constraint(equalTo: darkButton.centerXAnchor, constant: 0)
        ])
    }
}
