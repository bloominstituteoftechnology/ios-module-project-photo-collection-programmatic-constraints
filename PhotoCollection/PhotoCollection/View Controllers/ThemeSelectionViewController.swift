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
    
    var themeHelper: ThemeHelper?
    
    func setUpSubViews() {
        
        let themeLabel = UILabel()
        themeLabel.translatesAutoresizingMaskIntoConstraints = false
        themeLabel.text = "Set Theme"
        view.addSubview(themeLabel)
        
        themeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        themeLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0).isActive = true
        
        let selectDarkThemButton = UIButton(type: .system)
        selectDarkThemButton.translatesAutoresizingMaskIntoConstraints = false
        selectDarkThemButton.setTitle("Dark Theme", for: .normal)
        selectDarkThemButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        
        view.addSubview(selectDarkThemButton)
        
        let darkTopConstraint = selectDarkThemButton.topAnchor.constraint(equalTo: themeLabel.bottomAnchor, constant: 8)
        let darkLeadingConstraint = selectDarkThemButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        
        darkTopConstraint.isActive = true
        darkLeadingConstraint.isActive = true
        
        let selectLightThemeButton = UIButton(type: .system)
        selectLightThemeButton.translatesAutoresizingMaskIntoConstraints = false
        selectLightThemeButton.setTitle("Light Theme", for: .normal)
        selectLightThemeButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        
        view.addSubview(selectLightThemeButton)
        
        let lightTopConstraint = selectLightThemeButton.topAnchor.constraint(equalTo: themeLabel.bottomAnchor, constant: 8)
        let lightTrailingConstraint = selectLightThemeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 30)
        
        lightTopConstraint.isActive = true
        lightTrailingConstraint.isActive = true
    }
    
}
