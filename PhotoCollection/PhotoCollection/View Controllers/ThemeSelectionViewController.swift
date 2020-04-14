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
        setUpSubViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    

    @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func setUpSubViews() {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Please select a theme"
        label.textAlignment = .center
        view.addSubview(label)
        
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        
        
        let darkButton = UIButton(type: .system)
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        darkButton.setTitle("Dark", for: .normal)
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        view.addSubview(darkButton)
        
        darkButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        darkButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -60).isActive = true
        
        
        let blueButton = UIButton(type: .system)
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.setTitle("Blue", for: .normal)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        view.addSubview(blueButton)
        
        blueButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        blueButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 60).isActive = true
        
    }
}
