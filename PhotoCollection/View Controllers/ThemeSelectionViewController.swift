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
        setUpSubViews()
    }
    
    func setUpSubViews() {
    
        // Creating elements
        let label = UILabel()
        let darkButton = UIButton(type: .system)
        let blueButton = UIButton(type: .system)
        
        // Adding text
        label.text = "Select a theme"
        darkButton.setTitle("Dark", for: .normal)
        blueButton.setTitle("Blue", for: .normal)
        
        // Adding targets
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        
        // Turning off automatic resizing
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // Adding subviews
        view.addSubview(darkButton)
        view.addSubview(blueButton)
        view.addSubview(label)
        
        // Adding constraints
        
        // Dark button
        NSLayoutConstraint.activate([
            darkButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            darkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            darkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 8)
        ])
        
        // Blue Button
        NSLayoutConstraint.activate([
             blueButton.topAnchor.constraint(equalTo: darkButton.bottomAnchor, constant: 10),
             blueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
             blueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10)
         ])
        
        // Label
        NSLayoutConstraint.activate([
               label.topAnchor.constraint(equalTo: view.topAnchor, constant: 11),
               label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 11),
               label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 11)
           ])
        
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
}
