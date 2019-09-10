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
	
	func setUpSubViews() {
		
		// Label
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Please select a theme:"
		
		view.addSubview(label)
		
		label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
		label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
		label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
		
		// Dark Button
		
		let turnDarkButton = UIButton(type: .system)
		turnDarkButton.translatesAutoresizingMaskIntoConstraints = false
		turnDarkButton.setTitle("Dark Theme", for: .normal)
		turnDarkButton.addTarget(self, action: #selector(selectDarkTheme) , for: .touchUpInside)
		
		view.addSubview(turnDarkButton)
		
		turnDarkButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16).isActive = true
		turnDarkButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
		turnDarkButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -8).isActive = true
		
		// Blue Button
		
		let turnBlueButton = UIButton(type: .system)
		turnBlueButton.translatesAutoresizingMaskIntoConstraints = false
		turnBlueButton.setTitle("Blue Theme", for: .normal)
		turnBlueButton.addTarget(self, action: #selector(selectBlueTheme) , for: .touchUpInside)
		
		view.addSubview(turnBlueButton)
		
		turnBlueButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16).isActive = true
		turnBlueButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 8).isActive = true
		turnBlueButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
	}
	
}
