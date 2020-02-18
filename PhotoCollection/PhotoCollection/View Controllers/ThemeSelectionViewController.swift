//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
//
//    var label: UILabel?
//    var darkButton: UIButton?
//    var blueButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    var themeHelper: ThemeHelper?
  
    private func setUpSubViews(){
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Please select a theme mode:"
        label.textAlignment = .center
        view.addSubview(label)
        let labelTopConstraint = NSLayoutConstraint(item: label,
                                                    attribute: .top,
                                                    relatedBy: .equal,
                                                    toItem: view.safeAreaLayoutGuide,
                                                    attribute: .top,
                                                    multiplier: 1,
                                                    constant: 50)
        let labelLeadingConstraint = NSLayoutConstraint(item: label,
                                                        attribute: .leading,
                                                        relatedBy: .equal,
                                                        toItem: view.safeAreaLayoutGuide,
                                                        attribute: .leading,
                                                        multiplier: 1,
                                                        constant: 10)
        let labelTrailingConstraint = NSLayoutConstraint(item: label,
                                                         attribute: .trailing,
                                                         relatedBy: .equal,
                                                         toItem: view.safeAreaLayoutGuide,
                                                         attribute: .trailing,
                                                         multiplier: 1,
                                                         constant: 10)
        let labelHeightConstraint = NSLayoutConstraint(item: label,
                                                       attribute: .height,
                                                       relatedBy: .equal,
                                                       toItem: label,
                                                       attribute: .height,
                                                       multiplier: 1,
                                                       constant: 50)
        NSLayoutConstraint.activate([labelTopConstraint, labelLeadingConstraint, labelTrailingConstraint, labelHeightConstraint])
//        self.label = label
        
        let darkButton = UIButton(type: .system)
        darkButton.setTitle("Dark", for: .normal)
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        view.addSubview(darkButton)
        let darkButtonTopConstraint = NSLayoutConstraint(item: darkButton,
                                                         attribute: .top,
                                                         relatedBy: .equal,
                                                         toItem: label,
                                                         attribute: .bottom,
                                                         multiplier: 1,
                                                         constant: 20)
        let darkButtonLeadingConstraint = NSLayoutConstraint(item: darkButton,
                                                            attribute: .leading,
                                                            relatedBy: .equal,
                                                            toItem: view.safeAreaLayoutGuide,
                                                            attribute: .leading,
                                                            multiplier: 1,
                                                            constant: 24)
//        let darkButtonHeight = NSLayoutConstraint(item: darkButton,
//                                                  attribute: .height,
//                                                  relatedBy: .equal,
//                                                  toItem: nil,
//                                                  attribute: .notAnAttribute,
//                                                  multiplier: 1,
//                                                  constant: 50)
        let darkButtonWidth = NSLayoutConstraint(item: darkButton,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: darkButton,
                                                 attribute: .height,
                                                 multiplier: 2,
                                                 constant: 0)
        darkButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        NSLayoutConstraint.activate([darkButtonWidth, darkButtonTopConstraint, darkButtonLeadingConstraint])
//        self.darkButton = darkButton
        
        let blueButton = UIButton(type: .system)
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.setTitle("Blue", for: .normal)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        view.addSubview(blueButton)
        let blueButtonTopConstraint = NSLayoutConstraint(item: blueButton,
                                                         attribute: .top,
                                                         relatedBy: .equal,
                                                         toItem: label,
                                                         attribute: .bottom,
                                                         multiplier: 1,
                                                         constant: 20)
        let blueButtonTrailingConstraint = NSLayoutConstraint(item: blueButton,
                                                            attribute: .trailing,
                                                            relatedBy: .equal,
                                                            toItem: view.safeAreaLayoutGuide,
                                                            attribute: .trailing,
                                                            multiplier: 1,
                                                            constant: -24)
        let blueButtonHeight = NSLayoutConstraint(item: blueButton,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: blueButton,
                                                  attribute: .height,
                                                  multiplier: 1,
                                                  constant: 50)
        let blueButtonWidth = NSLayoutConstraint(item: blueButton,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: blueButton,
                                                 attribute: .height,
                                                 multiplier: 2,
                                                 constant: 0)
        NSLayoutConstraint.activate([blueButtonWidth, blueButtonHeight, blueButtonTopConstraint, blueButtonTrailingConstraint])
//        self.blueButton = blueButton
    }
    
}
