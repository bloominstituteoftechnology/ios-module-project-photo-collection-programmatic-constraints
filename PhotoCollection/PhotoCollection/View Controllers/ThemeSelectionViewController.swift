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

    @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    private func setUpSubViews() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select Theme"
        label.textAlignment = .center
        view.addSubview(label)
        
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        let darkThemeButton = UIButton(type: .system)
        darkThemeButton.translatesAutoresizingMaskIntoConstraints = false
        darkThemeButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        darkThemeButton.setTitle("Dark", for: .normal)
        view.addSubview(darkThemeButton)
        
        darkThemeButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        darkThemeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60).isActive = true
        
        
        let blueThemeButton = UIButton(type: .system)
        blueThemeButton.translatesAutoresizingMaskIntoConstraints = false
        blueThemeButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        blueThemeButton.setTitle("Blue", for: .normal)
        view.addSubview(blueThemeButton)
        
        blueThemeButton.topAnchor.constraint(equalTo: darkThemeButton.topAnchor).isActive = true
        blueThemeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60).isActive = true
        
        
    }
    var themeHelper: ThemeHelper?
}
