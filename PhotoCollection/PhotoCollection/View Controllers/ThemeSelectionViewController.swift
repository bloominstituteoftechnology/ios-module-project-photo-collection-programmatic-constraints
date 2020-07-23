//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    private var label = UILabel()
    private var darkButton = UIButton()
    private var blueButton = UIButton()
    
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
    }
    
    private func setUpSubviews() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Please select a theme:"
        view.addSubview(label)
        
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        darkButton.setTitle("Dark", for: .normal)
        darkButton.backgroundColor = .black
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        view.addSubview(darkButton)
        
        darkButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30).isActive = true
        darkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
        
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.setTitle("Blue", for: .normal)
        blueButton.backgroundColor = .blue
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        view.addSubview(blueButton)

        blueButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30).isActive = true
        blueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
        
    }
    
    @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }

}
