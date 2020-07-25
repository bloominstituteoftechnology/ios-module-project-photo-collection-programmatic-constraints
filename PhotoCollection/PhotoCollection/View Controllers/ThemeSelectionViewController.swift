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
        setUpSubviews()
        setTheme()
    }

    @objc func selectDarkTheme() {
        guard let themeHelper = themeHelper else {return}
        themeHelper.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectBlueTheme() {
        guard let themeHelper = themeHelper else {return}
        themeHelper.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    private func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        
        var backgroundColor: UIColor!
        
        switch themePreference {
        case "Dark":
            backgroundColor = .lightGray
        case "Blue":
            backgroundColor = UIColor(red: 61/255, green: 172/255, blue: 247/255, alpha: 1)
        default:
            break
        }
        
        view.backgroundColor = backgroundColor
    }
    
    
    
    
    func setUpSubviews() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select Theme"
        label.textAlignment = .center
        view.addSubview(label)
        
        //Label Constraints
        let labelTopConstraint = label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40)
        let labelLeadingConstraint = label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        let labelTrailingConstraint = label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        let labelHeight = label.heightAnchor.constraint(equalToConstant: 20)
        
        let buttonOne = UIButton(type: .system)
        buttonOne.setTitle("Dark", for: .normal)
        buttonOne.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonOne)
        
        //ButtonOne Constraints
        let buttonOneTopConstraint = buttonOne.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20)
        let buttonOneLeadingConstraint = buttonOne.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 140)
        let buttonOneWidth = buttonOne.widthAnchor.constraint(equalToConstant: 50)
        let buttonOneHeight = buttonOne.heightAnchor.constraint(equalToConstant: 20)
        
        let buttonTwo = UIButton(type: .system)
        buttonTwo.setTitle("Blue", for: .normal)
        buttonTwo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonTwo)
        
        //Button Two Constraints
        let buttonTwoTopConstraint = buttonTwo.topAnchor.constraint(equalTo: buttonOne.topAnchor, constant: 0)
        let buttonTwoLeadingConstraint = buttonTwo.leadingAnchor.constraint(equalTo: buttonOne.leadingAnchor, constant: 50)
        let buttonTwoWidth = buttonTwo.widthAnchor.constraint(equalToConstant: 50)
        let buttonTwoHeight = buttonTwo.heightAnchor.constraint(equalToConstant: 20)
        
        
        buttonOne.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        buttonTwo.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        
        NSLayoutConstraint.activate([labelHeight, labelTopConstraint, labelLeadingConstraint, labelTrailingConstraint, buttonOneWidth, buttonOneHeight, buttonOneTopConstraint, buttonOneLeadingConstraint, buttonTwoWidth, buttonTwoHeight, buttonTwoTopConstraint, buttonTwoLeadingConstraint])
        
        
        
    }
}
