//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

protocol ThemeChangeDelegate: AnyObject {
    func themeDidChange()
}

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?
    weak var delegate: ThemeChangeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSubviews()
    }
    
    private func setUpSubviews() {
        let label = UILabel()
        label.text = "Select theme:"
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
        
        let darkButton = UIButton(type: .system)
        darkButton.setTitle("Dark", for: .normal)
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        view.addSubview(darkButton)
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            darkButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            darkButton.trailingAnchor.constraint(equalTo: label.centerXAnchor, constant: -30),
        ])
        
        let blueButton = UIButton(type: .system)
        blueButton.setTitle("Blue", for: .normal)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        view.addSubview(blueButton)
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blueButton.topAnchor.constraint(equalTo: darkButton.topAnchor, constant: 0),
            blueButton.leadingAnchor.constraint(equalTo: label.centerXAnchor, constant: 30),
        ])
    }
    
    @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        delegate?.themeDidChange()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        delegate?.themeDidChange()
        dismiss(animated: true, completion: nil)
    }
}
