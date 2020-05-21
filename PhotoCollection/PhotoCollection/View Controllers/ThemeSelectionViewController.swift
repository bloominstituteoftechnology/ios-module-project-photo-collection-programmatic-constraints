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
    var titleLabel: UILabel!
    var subTitleLabel: UILabel!
    
    override func  viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        
    }
    
    
    private func setUpSubviews() {
        // title label constraints
        let titleLabel = UILabel()
        titleLabel.text = "Photo Collection"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        titleLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        
        // subtitle label constraints
        let subtitleLabel = UILabel()
        subtitleLabel.text = "Select the theme you would like to use:"
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subtitleLabel)
        
        subtitleLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        
        
        // button constraints
        
        let blueButton = UIButton(type: .system)
        let darkButton = UIButton(type: .system)
        blueButton.setTitle("Blue", for: .normal)
        darkButton.setTitle("Dark", for:  .normal)
        
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blueButton)
        view.addSubview(darkButton)
        
        blueButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 25).isActive = true
        blueButton.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 50).isActive = true
        darkButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -25).isActive = true
        darkButton.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 50).isActive = true
    }
    
}
