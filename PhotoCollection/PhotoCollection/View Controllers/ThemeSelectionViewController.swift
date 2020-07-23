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
        setUpSubViews()
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
        let photoCollectLabel = UILabel()
        let blueButton = UIButton()
        let blackButton = UIButton()
        
        photoCollectLabel.translatesAutoresizingMaskIntoConstraints = false
        photoCollectLabel.text = "photo collection"
        photoCollectLabel.font = UIFont(name: "system", size: 36)
        photoCollectLabel.textAlignment = .center
        view.addSubview(photoCollectLabel)
        
        photoCollectLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        photoCollectLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        photoCollectLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        
        let themeLabel = UILabel()
        themeLabel.translatesAutoresizingMaskIntoConstraints = false
        themeLabel.font = UIFont(name: "system", size: 44)
        themeLabel.text = "select your theme"
        themeLabel.textAlignment = .left
        view.addSubview(themeLabel)
        
        themeLabel.topAnchor.constraint(equalTo: photoCollectLabel.bottomAnchor, constant: 12).isActive = true
        themeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 48).isActive = true
        themeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -48).isActive = true
        
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.setTitle("blue", for: .normal)
        blueButton.setTitleColor(.gray, for: .normal)
        blueButton.backgroundColor = .blue
        blueButton.layer.cornerRadius = 16
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        
        blackButton.translatesAutoresizingMaskIntoConstraints = false
        blackButton.setTitle("dark", for: .normal)
        blackButton.setTitleColor(.white, for: .normal)
        blackButton.backgroundColor = .black
        blackButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        
        stackView.addArrangedSubview(blueButton)
        stackView.addArrangedSubview(blackButton)
        
        view.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: themeLabel.bottomAnchor, constant: 40).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
    }
    
    var themeHelper: ThemeHelper?
}
