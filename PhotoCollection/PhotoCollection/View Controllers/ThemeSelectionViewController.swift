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
        super.viewDidLoad()
        setUpViews()
    }
    
    var label = UILabel()
    var dark = UIButton(type: .system)
    var blue = UIButton(type: .system)
    
    func setUpViews() {
        view.addSubview(label)
        view.addSubview(dark)
        view.addSubview(blue)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Select a Theme"
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        dark.translatesAutoresizingMaskIntoConstraints = false
        dark.setTitle("Dark", for: .normal)
        dark.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        dark.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 80).isActive = true
        dark.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        
        blue.translatesAutoresizingMaskIntoConstraints = false
        blue.setTitle("Blue", for: .normal)
        blue.topAnchor.constraint(equalTo: dark.topAnchor).isActive = true
        blue.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80).isActive = true
        blue.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        
        self.title = "Theme"
        
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
