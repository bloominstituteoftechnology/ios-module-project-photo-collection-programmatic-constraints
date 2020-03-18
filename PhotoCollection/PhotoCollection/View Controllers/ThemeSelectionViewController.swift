//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    private var setThemeLabel = UILabel()
    private var darkThemeButton = UIButton()
    private var burntSiennaButton = UIButton()
    
    override func viewDidLoad() {
        setUpSubViews()
    }

   @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
   @objc func selectSiennaTheme() {
        themeHelper?.setThemePreferenceToSienna()
        dismiss(animated: true, completion: nil)
    }
    
    var themeHelper: ThemeHelper?
    
    func setUpSubViews() {
        setThemeLabel.translatesAutoresizingMaskIntoConstraints = false
        setThemeLabel.text = "Select a theme:"
        setThemeLabel.textColor = .black
        setThemeLabel.textAlignment = .center
        
        view.addSubview(setThemeLabel)
        
        setThemeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        setThemeLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        setThemeLabel.heightAnchor.constraint(equalToConstant: 150).isActive = true
        setThemeLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true

        
        darkThemeButton.translatesAutoresizingMaskIntoConstraints = false
        darkThemeButton.setTitle("Dark", for: .normal)
        darkThemeButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        darkThemeButton.setTitleColor(.black , for: .normal)
        darkThemeButton.setTitleColor(.lightGray, for: .selected)
        view.addSubview(darkThemeButton)
        
        darkThemeButton.topAnchor.constraint(equalTo: setThemeLabel.topAnchor, constant: 175).isActive = true
        darkThemeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        

        burntSiennaButton.translatesAutoresizingMaskIntoConstraints = false
        burntSiennaButton.setTitle("Sienna", for: .normal)
        burntSiennaButton.addTarget(self, action: #selector(selectSiennaTheme), for: .touchUpInside)
        burntSiennaButton.setTitleColor(UIColor(red: 237, green: 114, blue: 88, alpha: 1), for: .normal)
        burntSiennaButton.setTitleColor(.lightGray, for: .selected)
        view.addSubview(burntSiennaButton)
        
        burntSiennaButton.topAnchor.constraint(equalTo: setThemeLabel.topAnchor, constant: 175).isActive = true
        burntSiennaButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        
    }
}
