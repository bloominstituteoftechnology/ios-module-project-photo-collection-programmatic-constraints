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
        //        view.backgroundColor = .white
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
        let themeLabel = UILabel()
        let blueThemeButton = UIButton(type: .system)
        let darkThemeButton = UIButton(type: .system)
        
        themeLabel.text = "Select Your Theme Below"
        themeLabel.textAlignment = .center
        
        view.addSubview(themeLabel)
      
        view.addSubview(blueThemeButton)
        
        view.addSubview(darkThemeButton)
        
        themeLabel.translatesAutoresizingMaskIntoConstraints = false
        themeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120).isActive = true
        themeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 4).isActive = true
        themeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -4).isActive = true
        
        darkThemeButton.translatesAutoresizingMaskIntoConstraints = false
        darkThemeButton.setTitle("Dark Theme", for: .normal)
        darkThemeButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
    
        darkThemeButton.topAnchor.constraint(equalTo: themeLabel.safeAreaLayoutGuide.bottomAnchor, constant: 40).isActive = true
        darkThemeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
//        darkThemeButton.trailingAnchor.constraint(equalTo: blueThemeButton.safeAreaLayoutGuide.leadingAnchor, constant: -10).isActive = true
        
        blueThemeButton.translatesAutoresizingMaskIntoConstraints = false
        blueThemeButton.setTitle("Blue Theme", for: .normal)
        blueThemeButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        
        blueThemeButton.topAnchor.constraint(equalTo: themeLabel.safeAreaLayoutGuide.bottomAnchor, constant: 40).isActive = true
//        blueThemeButton.leadingAnchor.constraint(greaterThanOrEqualTo: darkThemeButton.trailingAnchor, constant: 40).isActive = true
        blueThemeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        
        
    }
}
