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
        setUpSubViews()
    }
    
    private func setUpSubViews() {
        let themeLabel = UILabel()
        themeLabel.text = "Select a theme"
        
        let darkButton = UIButton()
        darkButton.setTitle("Dark", for: .normal)
        
        let blueButton = UIButton()
        blueButton.setTitle("Blue", for: .normal)
        
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        
        view.addSubview(darkButton)
        view.addSubview(blueButton)
        
        NSLayoutConstraint(item: darkButton,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view.safeAreaLayoutGuide,
                           attribute: .top,
                           multiplier: 1,
                           constant: 64).isActive = true
        
        NSLayoutConstraint(item:darkButton,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view.safeAreaLayoutGuide,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 16).isActive = true
        
        NSLayoutConstraint(item: blueButton,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view.safeAreaLayoutGuide,
                           attribute: .top,
                           multiplier: 1,
                           constant: 64).isActive = true
        
        NSLayoutConstraint(item: blueButton,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view.safeAreaLayoutGuide,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: 16).isActive = true
        
        NSLayoutConstraint(item: darkButton,
                           attribute: .trailing,
                           relatedBy: .greaterThanOrEqual,
                           toItem: blueButton,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 16).isActive = true
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
