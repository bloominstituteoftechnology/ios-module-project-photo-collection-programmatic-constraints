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
    
        //MARK: - LABEL
    private func setUpSubviews() {
        let label = UILabel()
        label.text = "Pick a theme:"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 20).isActive = true
        
        //MARK: - BUTTONS
        let darkThemeButton = UIButton(type: .system)
        let lightThemeButton = UIButton(type: .system)
        
        darkThemeButton.setTitle("Dark Theme", for: .normal)
        lightThemeButton.setTitle("Light Theme", for: .normal)
        
        darkThemeButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        lightThemeButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        
        view.addSubview(darkThemeButton)
        view.addSubview(lightThemeButton)
        
        NSLayoutConstraint(item: darkThemeButton,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view.safeAreaLayoutGuide,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 70).isActive = true
        
        NSLayoutConstraint(item: darkThemeButton,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: label,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 60).isActive = true
        
        NSLayoutConstraint(item: lightThemeButton,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view.safeAreaLayoutGuide,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -70).isActive = true
        
        NSLayoutConstraint(item: lightThemeButton,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: darkThemeButton,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0).isActive = true
    }
}
