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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    func setupSubviews() {
        let label = UILabel()
        let blueButton = UIButton()
        let blackButton = UIButton()
        view.addSubview(label)
        view.addSubview(blueButton)
        view.addSubview(blackButton)
        //setup label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Select the theme you would like to use:"
        label.textAlignment = .center
        //setup blueButton
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.setTitle("Blue", for: .normal)
        blueButton.setTitleColor(.blue, for: .normal)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        //setup blackButton
        blackButton.translatesAutoresizingMaskIntoConstraints = false
        blackButton.setTitle("Dark", for: .normal)
        blackButton.setTitleColor(.black, for: .normal)
        blackButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        
        
        let labelLeadingConstant = label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8)
        let labelTrailingConstant = label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8)
        let labelTopConstraint = label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        
        let blackButtonCenterXConstant = blackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -40)
        let blackButtonTopConstraint = blackButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 12)
        
        let blueButtonCenterXConstraint = blueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 40)
        let blueButtonTopConstraint = blueButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 12)
        
        NSLayoutConstraint.activate([
            labelLeadingConstant,
            labelTrailingConstant,
            labelTopConstraint,
            blackButtonCenterXConstant,
            blackButtonTopConstraint,
            blueButtonCenterXConstraint,
            blueButtonTopConstraint
        ])
    }
    
}
