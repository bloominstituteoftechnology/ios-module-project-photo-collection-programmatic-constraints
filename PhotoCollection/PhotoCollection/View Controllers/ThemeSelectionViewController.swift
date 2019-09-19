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
        setupSubviews()
    }
    
    @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    
    
    private func setupSubviews () {
        
        // Create label
        let label = UILabel()
        
        // set label text
        label.text = "Select a theme:"
        
        // Enable it to be viewed
        label.translatesAutoresizingMaskIntoConstraints = false

        // Add label to view
        view.addSubview(label)
        
        // add leading anchor
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        
        // add top anchor
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        
        // add trailing anchor
        label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
        // create button
        let grayButton = UIButton(type: .system)
        
        // disable autoresizing
        grayButton.translatesAutoresizingMaskIntoConstraints = false
        
        // set title for page
        grayButton.setTitle("Gray Theme", for: .normal)
        
        // adding target
        
//        grayButton.addT
        
        // add target
        grayButton.addTarget(self, action: #selector(selectDarkTheme) , for: .touchUpInside)
        
        // add graybutton to subview
        view.addSubview(grayButton)
        
        // create top anchor
        grayButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        
        // create leading anchor (->)
        grayButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        
        // create trailing anchor (<-)
        grayButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -10).isActive = true
        
        // create blue button
        let blueButton = UIButton(type: .system)
        
        // disable autoresizing
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        
        // set title
        blueButton.setTitle("Blue Theme", for: .normal)
        
        // add target
        blueButton.addTarget(self, action: #selector(selectBlueTheme) , for: .touchUpInside)
        
        // add button to subview
        view.addSubview(blueButton)
        
        // create top anchor
        blueButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        
        // create leading anchor
        blueButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 10).isActive = true
        
        // create trailing anchor
        blueButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }
}
