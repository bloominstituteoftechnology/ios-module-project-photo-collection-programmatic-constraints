//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
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
    
    var themeHelper: ThemeHelper?
    
    private func setUpSubviews() {
        let lblSelectATheme = UILabel()
        let stack = UIStackView()
        let btnDark = UIButton(type: .system)
        let btnBlue = UIButton(type: .system)
        
        lblSelectATheme.text = "Please select a theme"
        lblSelectATheme.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        btnDark.setTitle("Dark", for: .normal)
        btnDark.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        btnDark.translatesAutoresizingMaskIntoConstraints = false
        btnBlue.setTitle("Blue", for: .normal)
        btnBlue.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        btnBlue.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lblSelectATheme)
        view.addSubview(stack)
        stack.addArrangedSubview(btnDark)
        stack.addArrangedSubview(btnBlue)
        
        let constraints = [lblSelectATheme.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                           lblSelectATheme.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
                           stack.centerXAnchor.constraint(equalTo: lblSelectATheme.centerXAnchor),
                           stack.topAnchor.constraint(equalTo: lblSelectATheme.bottomAnchor, constant: 20),
                           stack.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
        ]
        
        NSLayoutConstraint.activate(constraints)

    }
}
