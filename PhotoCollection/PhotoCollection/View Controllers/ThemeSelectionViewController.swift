//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setSubViews()
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
    
    func setSubViews() {
        
        let photoCollectionLabel = UILabel()
        photoCollectionLabel.translatesAutoresizingMaskIntoConstraints = false
        photoCollectionLabel.text = "Photo Collection:"
        photoCollectionLabel.font = UIFont(name: "System Bold", size: 40)
        photoCollectionLabel.textAlignment = .center
        
        view.addSubview(photoCollectionLabel)
        
        photoCollectionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        photoCollectionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        photoCollectionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        
        let whichThemeLabel = UILabel()
        whichThemeLabel.translatesAutoresizingMaskIntoConstraints = false
        whichThemeLabel.font = UIFont(name: "System Bold", size: 50)
        whichThemeLabel.text = "Please select your desired theme."
        whichThemeLabel.textAlignment = .center
        
        view.addSubview(whichThemeLabel)
        
        whichThemeLabel.topAnchor.constraint(equalTo: photoCollectionLabel.bottomAnchor, constant: 10).isActive = true
        whichThemeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        whichThemeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        
        let darkButton = UIButton()
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        darkButton.backgroundColor = .black
        darkButton.setTitle("Dark", for: .normal)
        darkButton.setTitleColor(.white, for: .normal)
        darkButton.layer.cornerRadius = 15
        
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        
        
        let lightButton = UIButton()
        lightButton.translatesAutoresizingMaskIntoConstraints = false
        lightButton.setTitle("Light", for: .normal)
        lightButton.setTitleColor(.white, for: .normal)
        lightButton.backgroundColor = .black
        lightButton.layer.cornerRadius = 15
        
        lightButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        lightButton.widthAnchor.constraint(equalTo: darkButton.widthAnchor, multiplier: 1)
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        
        stackView.addArrangedSubview(darkButton)
        stackView.addArrangedSubview(lightButton)
        
        view.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: whichThemeLabel.bottomAnchor, constant: 40).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        
    }
}
