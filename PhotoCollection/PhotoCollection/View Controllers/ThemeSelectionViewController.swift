//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    var themeHelper: ThemeHelper? {
        didSet {
            setUpSubviews()
        }
    }
    
    func setUpSubviews() {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Select the theme you would like to use:"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
        let blueButton = UIButton(type: .system)
        blueButton.setTitle("Blue", for: .normal)
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        view.addSubview(blueButton)

        blueButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        blueButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 170).isActive = true
        
        let darkButton = UIButton(type: .system)
        darkButton.setTitle("Dark", for: .normal)
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(darkButton)
        
        darkButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        darkButton.leadingAnchor.constraint(equalTo: blueButton.trailingAnchor, constant: 20).isActive = true
    }
}
