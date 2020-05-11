//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    let headerLbl = UILabel()
    let descriptionLbl = UILabel()
    let darkBtn = UIButton(type: .system)
    let blueBtn = UIButton(type: .system)
    
    override func viewDidLoad() {
        
        self.setUpSubviews()
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
    
    private func setUpSubviews() {
    setUpLabels()
    setupButtons()
}

  private func setUpLabels() {
        
        headerLbl.textAlignment = .center
        headerLbl.textColor = .black
        headerLbl.text = "PhotoCollection"
        headerLbl.font =  UIFont.boldSystemFont(ofSize: 30.0)
        headerLbl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(headerLbl)
        
        headerLbl.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        headerLbl.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 12).isActive = true
        headerLbl.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -12).isActive = true
        headerLbl.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        descriptionLbl.textAlignment = .center
        descriptionLbl.textColor = .black
        descriptionLbl.text = "Select the theme you would like to use."
        descriptionLbl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(descriptionLbl)
        
        descriptionLbl.topAnchor.constraint(equalTo: headerLbl.bottomAnchor, constant: 16).isActive = true
        descriptionLbl.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 12).isActive = true
        descriptionLbl.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -12).isActive = true
        descriptionLbl.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    private func setupButtons() {
        darkBtn.translatesAutoresizingMaskIntoConstraints = false
        darkBtn.setTitle("Dark", for: .normal)
        darkBtn.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        self.view.addSubview(darkBtn)
        
        let buttonsWidth = (UIScreen.main.bounds.width / 2) - 50
        darkBtn.topAnchor.constraint(equalTo: descriptionLbl.bottomAnchor, constant: 30).isActive = true
        darkBtn.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 25).isActive = true
        darkBtn.widthAnchor.constraint(equalToConstant: buttonsWidth).isActive = true
        darkBtn.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        blueBtn.translatesAutoresizingMaskIntoConstraints = false
        blueBtn.setTitle("Blue", for: .normal)
        blueBtn.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        self.view.addSubview(blueBtn)
        
        blueBtn.topAnchor.constraint(equalTo: descriptionLbl.bottomAnchor, constant: 30).isActive = true
        blueBtn.leadingAnchor.constraint(equalTo: darkBtn.trailingAnchor, constant: 25).isActive = true
        blueBtn.widthAnchor.constraint(equalToConstant: buttonsWidth).isActive = true
        blueBtn.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
}

