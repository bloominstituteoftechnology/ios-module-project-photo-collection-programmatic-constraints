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
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Select Theme"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 50.0)
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100.0).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
       
        
        
        let darkButton = UIButton(type: .system)
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        darkButton.setTitle("Dark", for: .normal)
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        view.addSubview(darkButton)
        darkButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100.0).isActive = true
        darkButton.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        darkButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 125.0).isActive = true
        
        
        let blueButton = UIButton(type: .system)
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.setTitle("Blue", for: .normal)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        view.addSubview(blueButton)
        blueButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100.0).isActive = true
        blueButton.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        blueButton.leadingAnchor.constraint(equalTo: darkButton.trailingAnchor, constant: 100.0).isActive = true
        
    }
}
