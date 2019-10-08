//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?
    
    private var textLabel: UILabel?
    private var darkButton: UIButton?
    private var blueButton: UIButton?
    
    override func viewDidLoad() {
        setSubviews()
    }

    @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    
    
    private func setSubviews() {
        
        let selectThemeLabel = UILabel()
        let darkButton = UIButton()
        let blueButton = UIButton()
        
        view.addSubview(selectThemeLabel)
        view.addSubview(darkButton)
        view.addSubview(blueButton)
        
        selectThemeLabel.translatesAutoresizingMaskIntoConstraints = false
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        
        selectThemeLabel.text = "Select Theme"
        darkButton.titleLabel?.text = "Dark"
        blueButton.titleLabel?.text = "Blue"
        
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
        
            NSLayoutConstraint(item: selectThemeLabel,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: view.safeAreaLayoutGuide,
                               attribute: .top,
                               multiplier: 1,
                               constant: -20),
            
            NSLayoutConstraint(item: selectThemeLabel,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: view.safeAreaLayoutGuide,
                               attribute: .centerX,
                               multiplier: 1,
                               constant: 0),
            
            NSLayoutConstraint(item: darkButton,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: view.safeAreaLayoutGuide,
                               attribute: .leading,
                               multiplier: 1,
                               constant: 30),
            
            NSLayoutConstraint(item: blueButton,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: view.safeAreaLayoutGuide,
                               attribute: .trailing,
                               multiplier: 1,
                               constant: -30),
            
            NSLayoutConstraint(item: blueButton,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: darkButton,
                               attribute: .centerY,
                               multiplier: 1,
                               constant: 0),
            
            NSLayoutConstraint(item: darkButton,
                                       attribute: .top,
                                       relatedBy: .equal,
                                       toItem: selectThemeLabel,
                                       attribute: .bottom,
                                       multiplier: 1,
                                       constant: 20),
        ])
     
        self.textLabel = selectThemeLabel
        self.darkButton = darkButton
        self.blueButton = blueButton
    
        
    }
}
