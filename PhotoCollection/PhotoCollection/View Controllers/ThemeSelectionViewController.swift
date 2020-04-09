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
        view.addSubview(label)
        
        let darkButton = UIButton()
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        darkButton.setTitle("Dark", for: .normal)
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        view.addSubview(darkButton)
        
        let blueButton = UIButton()
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.setTitle("Blue", for: .normal)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        view.addSubview(blueButton)
        
        NSLayoutConstraint(item: label,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: label.safeAreaLayoutGuide,
                           attribute: .top,
                           multiplier: 1,
                           constant: 25).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: label.safeAreaLayoutGuide,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 50).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: label.safeAreaLayoutGuide,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -50).isActive = true
        
        NSLayoutConstraint(item: darkButton,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: label.safeAreaLayoutGuide,
                           attribute: .top,
                           multiplier: 1,
                           constant: 100).isActive = true
        NSLayoutConstraint(item: darkButton,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: label.safeAreaLayoutGuide,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 25).isActive = true
        NSLayoutConstraint(item: darkButton,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: label.safeAreaLayoutGuide,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -75).isActive = true
        
        NSLayoutConstraint(item: blueButton,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: label.safeAreaLayoutGuide,
                           attribute: .top,
                           multiplier: 1,
                           constant: 100).isActive = true
        NSLayoutConstraint(item: blueButton,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: label.safeAreaLayoutGuide,
                           attribute: .top,
                           multiplier: 1,
                           constant: 75).isActive = true
        NSLayoutConstraint(item: blueButton,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: label.safeAreaLayoutGuide,
                           attribute: .top,
                           multiplier: 1,
                           constant: -25).isActive = true
        
    }
    
}
