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
    
    func setUpSubviews() {
        let selectThemeLabel = UILabel()
        
        selectThemeLabel.translatesAutoresizingMaskIntoConstraints = false
        selectThemeLabel.textAlignment = .center
        selectThemeLabel.text = "Select the theme you would like to use:"
        
        view.addSubview(selectThemeLabel)
        
        selectThemeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        selectThemeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        let darkButton = UIButton()
        
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        darkButton.setTitle("Dark", for: .normal)
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        
        view.addSubview(darkButton)
        
        darkButton.topAnchor.constraint(equalTo: selectThemeLabel.bottomAnchor, constant: 20).isActive = true
        darkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        
        let blueButton = UIButton()
        
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.setTitle("Blue", for: .normal)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        
        view.addSubview(blueButton)
        
        blueButton.topAnchor.constraint(equalTo: selectThemeLabel.bottomAnchor, constant: 20).isActive = true
        blueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
    }
}
