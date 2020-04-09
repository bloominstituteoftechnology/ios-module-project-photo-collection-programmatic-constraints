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
        let themeLabel = UILabel()
        let darkButton = UIButton(type: .roundedRect)
        let blueButton = UIButton(type: .roundedRect)
        
        themeLabel.text = "Choose Your Theme Preference"
        darkButton.setTitle("Dark Mode", for: .normal)
        darkButton.backgroundColor = .black
        darkButton.setTitleColor(.white, for: .normal)
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        blueButton.setTitle("Blue Mode", for: .normal)
        blueButton.backgroundColor = .blue
        blueButton.setTitleColor(.white, for: .normal)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        
        themeLabel.translatesAutoresizingMaskIntoConstraints = false
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(themeLabel)
        view.addSubview(darkButton)
        view.addSubview(blueButton)
        
        let themeLabelTopConstraint = themeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        let themeLabelLeadingConstraint = themeLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        let darkButtonTopConstraint = darkButton.topAnchor.constraint(equalTo: themeLabel.bottomAnchor, constant: 50).isActive = true
        let darkButtonLeadingConstraint = darkButton.centerXAnchor.constraint(equalTo: themeLabel.centerXAnchor).isActive = true
        
        let blueButtonTopConstraint = blueButton.topAnchor.constraint(equalTo: darkButton.bottomAnchor, constant: 25).isActive = true
        let blueButtonLeadingConstraint = blueButton.centerXAnchor.constraint(equalTo: darkButton.centerXAnchor).isActive = true
        
        
        
    }
}
