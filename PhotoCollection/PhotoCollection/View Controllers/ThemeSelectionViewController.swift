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
    var titleLabel: UILabel!
    var subTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
    }
    
    @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    private func setUpSubviews() {
        configureTitleLabel()
        configureSubtitleLabel()
        configureButtons()
    }
    
    private func configureTitleLabel() {
        let titleLabel = UILabel()
        titleLabel.text = "Photo Collection"
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        self.titleLabel = titleLabel
    }
    
    private func configureSubtitleLabel() {
        let label = UILabel()
        label.text = "Select a theme you would like to use"
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        self.subTitleLabel = label
    }
    
    private func configureButtons() {
        let darkButton = UIButton(type: .system)
        let bluebutton = UIButton(type: .system)
        darkButton.setTitle("Dark", for: .normal)
        bluebutton.setTitle("Blue", for: .normal)
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        bluebutton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        view.addSubview(darkButton)
        view.addSubview(bluebutton)
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        bluebutton.translatesAutoresizingMaskIntoConstraints = false
        darkButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -20).isActive = true
        bluebutton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 20).isActive = true
        darkButton.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 40).isActive = true
        bluebutton.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 40).isActive = true
    }
    
}
