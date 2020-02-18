//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    
    // sets up subviews
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubViews()
    }
    
    // MARK: - PROPERTIES
    
    
    var themeHelper: ThemeHelper?
    
    // setup label
    let titleLabel: UILabel =  {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select the theme that you would like to use! "
        label.textAlignment = .center
        return label
    }()
        
    // setup dark button
    let darkButton: UIButton = {
        var button = UIButton()
        button.setTitle("Dark", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    // setup blue button
    let blueButton: UIButton = {
    var button = UIButton()
    button.setTitle("Blue", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
    }()
    
    // MARK: - METHODS
    @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    func setUpSubViews() {
     
    // Constrin the title Label
    view.addSubview(titleLabel)
    titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
    titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    
        
    // Constrain the dark button
    view.addSubview(darkButton)
    darkButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
    darkButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -20).isActive = true
    
    // Constrain the blue button
    view.addSubview(blueButton)
    blueButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
    blueButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 40).isActive = true
        }
    }
   

