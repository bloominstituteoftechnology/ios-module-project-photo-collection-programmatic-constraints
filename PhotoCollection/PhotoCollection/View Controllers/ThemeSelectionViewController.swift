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
        super .viewDidLoad()
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
    
    private func setUpSubviews() {
        
        // LABEL
        let label = UILabel()
        label.text = "Select the theme you would like to use:"
        label.textAlignment = .center
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        // DARK BUTTON
        let darkButton = UIButton(type: .system)
        darkButton.setTitle("Dark", for: .normal)
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        darkButton.tintColor = UIColor.white
        darkButton.backgroundColor = .black
        darkButton.layer.cornerRadius = 5
        darkButton.layer.borderWidth = 2
        darkButton.contentEdgeInsets = .init(top: 10, left: 20, bottom: 10, right: 20)
        darkButton.layer.borderColor = UIColor.black.cgColor
        
        view.addSubview(darkButton)
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        
        darkButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8).isActive = true
        darkButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 120).isActive = true
        
        // BLUE BUTTON
        let blueButton = UIButton(type: .system)
        blueButton.setTitle("Blue", for: .normal)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        blueButton.backgroundColor = .blue
        blueButton.tintColor = UIColor.white
        blueButton.layer.cornerRadius = 5
        blueButton.layer.borderWidth = 2
        blueButton.contentEdgeInsets = .init(top: 10, left: 20, bottom: 10, right: 20)
        blueButton.layer.borderColor = UIColor.blue.cgColor
        
        view.addSubview(blueButton)
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        
        blueButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8).isActive = true
        blueButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -120).isActive = true
    }
}
