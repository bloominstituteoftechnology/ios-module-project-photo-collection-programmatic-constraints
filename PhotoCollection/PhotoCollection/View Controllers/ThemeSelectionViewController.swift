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
        setUpSubViews()
    }
    
    @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    func setUpSubViews() {
        let label = UILabel()
        let blueButton = UIButton()
        let blackButton = UIButton()
        
        view.addSubview(label)
        view.addSubview(blueButton)
        view.addSubview(blackButton)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "select the theme to use"
        label.textAlignment = .center
        
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.setTitle("blue", for: .normal)
        blueButton.setTitleColor(.blue, for: .normal)
        blueButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        
        blackButton.translatesAutoresizingMaskIntoConstraints = false
        blackButton.setTitle("dark", for: .normal)
        blackButton.setTitleColor(.black, for: .normal)
        blackButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        
        let labelLeadingConstriant = label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8)
        let labelTrailingConstriant = label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8)
        let labelTopConstraint = label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        
        let blackButtonCenterXConstriant = blackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 40)
        let blackButtonTopConstraint = blackButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 12)
        
        let blueButtonCenterXConstraint = blueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 40)
        let blueButtonTopConstraint = blueButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 12)
        
        NSLayoutConstraint.activate([labelLeadingConstriant,
                                    labelTrailingConstriant,
                                    labelTopConstraint,
                                    blackButtonCenterXConstriant,
                                    blackButtonTopConstraint,
                                    blueButtonCenterXConstraint,
                                    blueButtonTopConstraint])
    }
    
    var themeHelper: ThemeHelper?
}
