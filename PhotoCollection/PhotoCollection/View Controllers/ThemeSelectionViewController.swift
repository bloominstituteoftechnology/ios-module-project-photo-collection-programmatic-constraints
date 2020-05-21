//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

protocol ThemeDelegate: class {
    func didChangeTheme()
}

class ThemeSelectionViewController: UIViewController {
    
    weak var delegate: ThemeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSubviews()
    }

    @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        delegate?.didChangeTheme()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        delegate?.didChangeTheme()
        dismiss(animated: true, completion: nil)
    }
    
    var themeHelper: ThemeHelper?
    
    func setUpSubviews() {
        let selectThemeLabel = UILabel()
        
        selectThemeLabel.translatesAutoresizingMaskIntoConstraints = false
        selectThemeLabel.textAlignment = .center
        selectThemeLabel.text = "Select the theme you would like to use:"
        
        view.addSubview(selectThemeLabel)
        
        selectThemeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        selectThemeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        let darkButton = UIButton(type: .system)
        
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        darkButton.setTitle("Dark", for: .normal)
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        
        let blueButton = UIButton(type: .system)
        
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.setTitle("Blue", for: .normal)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        
        let buttonStack = UIStackView(arrangedSubviews: [darkButton, blueButton])
        
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.axis = .horizontal
        buttonStack.distribution = .fillEqually
        buttonStack.alignment = .fill
        buttonStack.spacing = 30
        
        view.addSubview(buttonStack)
        
        buttonStack.heightAnchor.constraint(equalToConstant: 30).isActive = true
        buttonStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        buttonStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        buttonStack.topAnchor.constraint(equalTo: selectThemeLabel.bottomAnchor, constant: 30).isActive = true
    }
}
