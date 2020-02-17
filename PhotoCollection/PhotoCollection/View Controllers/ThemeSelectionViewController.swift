//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

protocol ThemeSelectionViewControllerDelegate: class {
    func themeChanged()
}

class ThemeSelectionViewController: UIViewController {

    let insetValue: CGFloat = 20.0
    var delegate: ThemeSelectionViewControllerDelegate?
    
    @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        delegate?.themeChanged()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        delegate?.themeChanged()
        dismiss(animated: true, completion: nil)
    }
    
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
    }
    
    private func setUpSubviews() {
        
        // Select Theme Label
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select the theme you would like to use:"
        label.textAlignment = .center
        view.addSubview(label)
        
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: insetValue).isActive = true
        label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -insetValue).isActive = true
        
        // Dark Theme Button
        
        let darkThemeButton = UIButton(type: .system)
        darkThemeButton.translatesAutoresizingMaskIntoConstraints = false
        darkThemeButton.setTitle("Dark", for: .normal)
        darkThemeButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        view.addSubview(darkThemeButton)
        
        darkThemeButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        darkThemeButton.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: (view.frame.width / 3)).isActive = true
        
        // Blue Theme Button
        
        let blueThemeButton = UIButton(type: .system)
        blueThemeButton.translatesAutoresizingMaskIntoConstraints = false
        blueThemeButton.setTitle("Blue", for: .normal)
        blueThemeButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        view.addSubview(blueThemeButton)
        
        blueThemeButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        blueThemeButton.centerXAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.frame.width / 3)).isActive = true
    }
}
