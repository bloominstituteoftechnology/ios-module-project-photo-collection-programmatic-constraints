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
    
    func setUpSubViews() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Which theme would you like to use?"
        label.textAlignment = .center
        view.addSubview(label)
        
        // y
        let labelYConstraint = label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        
        // x
        let labelLeadingConstraint = label.centerXAnchor.constraint(equalTo:view.safeAreaLayoutGuide.centerXAnchor, constant: 20)
        
        let darkButton = UIButton(type: .system)
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        darkButton.setTitle("Dark", for: .normal)
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        view.addSubview(darkButton)
        
        // y
        darkButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30).isActive = true
        
        // x
        darkButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 30).isActive = true
        
        let blueButton = UIButton(type: .system)
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.setTitle("Blue", for: .normal)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        
        view.addSubview(blueButton)
        
        // y
        let blueButtonCenterYConstraint = blueButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30)
        
        // x
        let blueButtonLeadingConstraint = blueButton.centerYAnchor.constraint(equalTo: darkButton.centerYAnchor)
        
        
        NSLayoutConstraint.activate([labelYConstraint, labelLeadingConstraint, blueButtonCenterYConstraint, blueButtonLeadingConstraint])
        
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
}
