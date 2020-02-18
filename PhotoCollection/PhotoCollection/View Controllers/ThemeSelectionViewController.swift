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
    
    var themeHelper: ThemeHelper?
    
    func setUpSubViews() {
        
        // Label
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select Theme"
        label.textAlignment = .center
        view.addSubview(label)
        
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        // Dark Theme Button
        let darkThemeButton = UIButton(type: .system)
        darkThemeButton.translatesAutoresizingMaskIntoConstraints = false
        darkThemeButton.setTitle("Dark", for: .normal)
        darkThemeButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        
        // Blue Theme Button
        let blueThemeButton = UIButton(type: .system)
        blueThemeButton.translatesAutoresizingMaskIntoConstraints = false
        blueThemeButton.setTitle("Blue", for: .normal)
        blueThemeButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        
        // StackView
        let buttonStackView = UIStackView()
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .equalSpacing
        buttonStackView.addArrangedSubview(darkThemeButton)
        buttonStackView.addArrangedSubview(blueThemeButton)
        view.addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        buttonStackView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        buttonStackView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
