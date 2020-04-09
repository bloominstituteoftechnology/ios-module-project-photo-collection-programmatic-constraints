//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    let chooseThemeLabel = UILabel()
    let darkThemeButton = UIButton()
    let blueThemeButton = UIButton()
    
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
        
        chooseThemeLabel.translatesAutoresizingMaskIntoConstraints = false
        chooseThemeLabel.text = "Select a Theme:"
        view.addSubview(chooseThemeLabel)
        
        chooseThemeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        chooseThemeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        
        //dark theme button
        darkThemeButton.translatesAutoresizingMaskIntoConstraints = false
        darkThemeButton.setTitle("Dark Mode", for: .normal)
        darkThemeButton.backgroundColor = .darkGray
        darkThemeButton.tintColor = .white
        darkThemeButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        darkThemeButton.layer.cornerRadius = 5
        view.addSubview(darkThemeButton)
        
        darkThemeButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -20).isActive = true
        darkThemeButton.topAnchor.constraint(equalTo: chooseThemeLabel.bottomAnchor, constant: 30).isActive = true
        darkThemeButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        //blue theme button
        blueThemeButton.translatesAutoresizingMaskIntoConstraints = false
        blueThemeButton.setTitle("Blue Mode", for: .normal)
        blueThemeButton.backgroundColor = .systemBlue
        blueThemeButton.tintColor = .white
        blueThemeButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        blueThemeButton.layer.cornerRadius = 5
        view.addSubview(blueThemeButton)
        
        blueThemeButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 20).isActive = true
        blueThemeButton.topAnchor.constraint(equalTo: darkThemeButton.topAnchor).isActive = true
        blueThemeButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
}
