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
    
    private func setUpSubviews() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select a theme"
        self.view.addSubview(label)
        
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        let darkButton = UIButton()
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        darkButton.setTitle("Dark", for: .normal)
        darkButton.backgroundColor = .darkGray
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        self.view.addSubview(darkButton)
        
        darkButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -50).isActive = true
        darkButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100).isActive = true
        darkButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        darkButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        let blueButton = UIButton()
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.setTitle("Blue", for: .normal)
        blueButton.backgroundColor = .blue
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        self.view.addSubview(blueButton)
        
        blueButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 50).isActive = true
        blueButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100).isActive = true
        blueButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        blueButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
    }
    
}
