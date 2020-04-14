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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUpSubviews()
    }
    
    // MARK: - Private methods
    
    private func setUpSubviews() {
        
        // Label
        
        let label = UILabel()
        label.text = "Choose a theme..."
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint(item: label,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view.safeAreaLayoutGuide,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        NSLayoutConstraint(item: label,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view.safeAreaLayoutGuide,
                           attribute: .top,
                           multiplier: 1,
                           constant: 20).isActive = true
        
        // Buttons
        
        let darkButton = UIButton(type: .system)
        let blueButton = UIButton(type: .system)
        
        darkButton.setTitle("Dark", for: .normal)
        blueButton.setTitle("Blue", for: .normal)
        
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(darkButton)
        view.addSubview(blueButton)
        
        NSLayoutConstraint(item: darkButton,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view.safeAreaLayoutGuide,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 70).isActive = true
        
        NSLayoutConstraint(item: darkButton,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: label,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 60).isActive = true
        
        NSLayoutConstraint(item: blueButton,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view.safeAreaLayoutGuide,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -70).isActive = true
        
        NSLayoutConstraint(item: blueButton,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: darkButton,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0).isActive = true
        
    }
}
