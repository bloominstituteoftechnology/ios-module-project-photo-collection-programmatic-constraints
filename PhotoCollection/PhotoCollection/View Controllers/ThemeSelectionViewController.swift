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
    
    private func setUpSubviews() {
        
        let label = UILabel()
        label.text = "Please select a theme"
        label.textAlignment = .center
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        let darkButton = UIButton()
        darkButton.setTitle("Dark", for: .normal)
        darkButton.setTitleColor(.blue, for: .normal)
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        view.addSubview(darkButton)
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        
        darkButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        darkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100).isActive = true
        darkButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        darkButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        let blueButton = UIButton()
        blueButton.setTitle("Blue", for: .normal)
        blueButton.setTitleColor(.blue, for: .normal)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        view.addSubview(blueButton)
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        
        blueButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        blueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100).isActive = true
        blueButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        blueButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
}
