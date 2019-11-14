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
        setUpSubviews()
    }
    
    private func setUpSubviews() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select the theme you would like to use:"
        label.textAlignment = .center
        
        view.addSubview(label)
        
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        let darkThemeButton = UIButton(type: .system)
        darkThemeButton.translatesAutoresizingMaskIntoConstraints = false
        darkThemeButton.setTitle("Dark", for: .normal)
        darkThemeButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        
        view.addSubview(darkThemeButton)
        
        darkThemeButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        darkThemeButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -50).isActive = true
        
        let blueThemeButton = UIButton(type: .system)
        blueThemeButton.translatesAutoresizingMaskIntoConstraints = false
        blueThemeButton.setTitle("Blue", for: .normal)
        blueThemeButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        
        view.addSubview(blueThemeButton)
        
        blueThemeButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        blueThemeButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 50).isActive = true
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
