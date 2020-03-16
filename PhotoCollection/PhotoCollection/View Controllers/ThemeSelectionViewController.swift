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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
    }
    
    private func setUpSubviews() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select the theme you would like to use:"
        label.textAlignment = .center
        view.addSubview(label)
        
        let darkButton = UIButton()
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        darkButton.setTitle("Dark", for: .normal)
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        view.addSubview(darkButton)
        
        let blueButton = UIButton()
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.setTitle("Blue", for: .normal)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        view.addSubview(blueButton)
        
        // MARK: - Constraints
        
        // label
        label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        
        // darkbutton
        darkButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        darkButton.leadingAnchor.constraint(equalTo: label.leadingAnchor, constant: 20).isActive = true
        darkButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        darkButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        // blueButton
        blueButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        blueButton.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: -20).isActive = true
        blueButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
