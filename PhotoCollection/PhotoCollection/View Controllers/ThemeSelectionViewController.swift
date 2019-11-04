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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        // ThemeLabel
        let themeLabel = UILabel()
        themeLabel.translatesAutoresizingMaskIntoConstraints = false
        themeLabel.text = "Select a theme"
        view.addSubview(themeLabel)
        
        themeLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        themeLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -20).isActive = true

        // DarkThemeButton
        let darkThemeButton = UIButton()
        darkThemeButton.translatesAutoresizingMaskIntoConstraints = false
        darkThemeButton.setTitle("Dark", for: .normal)
        darkThemeButton.setTitleColor(.blue, for: .normal)
        view.addSubview(darkThemeButton)
        darkThemeButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        
        darkThemeButton.topAnchor.constraint(equalTo: themeLabel.bottomAnchor, constant: 10).isActive = true
        darkThemeButton.centerXAnchor.constraint(equalTo: themeLabel.centerXAnchor).isActive = true
        
        // BlueThemeButton
        let blueThemeButton = UIButton()
        blueThemeButton.translatesAutoresizingMaskIntoConstraints = false
        blueThemeButton.setTitle("Blue", for: .normal)
        blueThemeButton.setTitleColor(.blue, for: .normal)
        view.addSubview(blueThemeButton)
        blueThemeButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        
        blueThemeButton.topAnchor.constraint(equalTo: darkThemeButton.bottomAnchor, constant: 10).isActive = true
        blueThemeButton.centerXAnchor.constraint(equalTo: darkThemeButton.centerXAnchor).isActive = true
    }
}
