//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
    
    }
    
    
    func setUpViews() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select a theme to use"
        label.textAlignment = .center
        self.view.addSubview(label)
        
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        label.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        let leftButton:UIButton = UIButton()
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.backgroundColor = .darkGray
        leftButton.layer.cornerRadius = 5
        leftButton.setTitle("Dark", for: .normal)
        leftButton.addTarget(self, action:#selector(selectDarkTheme), for: .touchUpInside)
        self.view.addSubview(leftButton)
        
        leftButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -60).isActive = true
        leftButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50).isActive = true
        leftButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        leftButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        let rightButton:UIButton = UIButton()
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.backgroundColor = .systemBlue
        rightButton.layer.cornerRadius = 5
        rightButton.setTitle("Blue", for: .normal)
        rightButton.addTarget(self, action:#selector(selectBlueTheme), for: .touchUpInside)
        self.view.addSubview(rightButton)
        
        rightButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 60).isActive = true
        rightButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50).isActive = true
        rightButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        rightButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
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
