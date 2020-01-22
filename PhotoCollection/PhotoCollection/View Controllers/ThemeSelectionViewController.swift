//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    //private var titleLabel: UILabel!
    private var subTitleLabel: UILabel!
    private var darkButton: UIButton!
    private var blueButton: UIButton!
    
    override func viewDidLoad() {
        setUpViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //updateViews()
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
    
    private func setUpViews() {
        
//        let titleLabel = UILabel()
//        titleLabel.textAlignment = .center
//        titleLabel.text = "Photo Collection"
//
//        view.addSubview(titleLabel)
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        let titleTopConstraint = NSLayoutConstraint(item: titleLabel,
//                                                    attribute: .top,
//                                                    relatedBy: .equal,
//                                                    toItem: view.safeAreaLayoutGuide,
//                                                    attribute: .top,
//                                                    multiplier: 1,
//                                                    constant: -20)
//
//        let titleCenterYConstraint = NSLayoutConstraint(item: titleLabel,
//                                                    attribute: .centerY,
//                                                    relatedBy: .equal,
//                                                    toItem: view.safeAreaLayoutGuide,
//                                                    attribute: .centerY,
//                                                    multiplier: 1,
//                                                    constant: 0)
//
//        self.titleLabel = titleLabel
        
        let subTitleLabel = UILabel()
        subTitleLabel.textAlignment = .center
        subTitleLabel.text = "Select the theme you would like to use:"
        view.addSubview(subTitleLabel)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let subTitleTopConstraint = NSLayoutConstraint(item: subTitleLabel,
                                                       attribute: .top,
                                                       relatedBy: .equal,
                                                       toItem: view.safeAreaLayoutGuide,
                                                       attribute: .top,
                                                       multiplier: 1,
                                                       constant: 20)
            
        let subTitleCenterYConstraint = NSLayoutConstraint(item: subTitleLabel,
                                                           attribute: .centerX,
                                                           relatedBy: .equal,
                                                           toItem: view.safeAreaLayoutGuide,
                                                           attribute: .centerX,
                                                           multiplier: 1,
                                                           constant: 0)
        
        self.subTitleLabel = subTitleLabel
        
        // Set up the way the UI element should look
        let darkButton = UIButton(type: .system)
        darkButton.setTitle("Dark", for: .normal)
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        // Add as subview and turn off autoresizing mask
        view.addSubview(darkButton)
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        // Constrain the element
        let darkTopConstraint = NSLayoutConstraint(item: darkButton,
                                                   attribute: .top,
                                                   relatedBy: .equal,
                                                   toItem: subTitleLabel,
                                                   attribute: .bottom,
                                                   multiplier: 1,
                                                   constant: 42)
        
        let darkLeadingConstraint = NSLayoutConstraint(item: darkButton,
                                                       attribute: .leading,
                                                       relatedBy: .equal ,
                                                       toItem: view.safeAreaLayoutGuide,
                                                       attribute: .leading,
                                                       multiplier: 1,
                                                       constant: 100)
        
        self.darkButton = darkButton
        
        let blueButton = UIButton(type: .system)
        blueButton.setTitle("Blue", for: .normal)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
              
        view.addSubview(blueButton)
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        
        let blueTopConstraint = NSLayoutConstraint(item: blueButton,
                                                   attribute: .top,
                                                   relatedBy: .equal,
                                                   toItem: subTitleLabel,
                                                   attribute: .bottom,
                                                   multiplier: 1,
                                                   constant: 42)
        
        let blueTrailingConstraint = NSLayoutConstraint(item: blueButton,
                                                        attribute: .trailing,
                                                        relatedBy: .equal ,
                                                        toItem: view.safeAreaLayoutGuide,
                                                        attribute: .trailing,
                                                        multiplier: 1,
                                                        constant: -100)
        
        self.blueButton = blueButton
        
        NSLayoutConstraint.activate([darkTopConstraint, darkLeadingConstraint, blueTopConstraint, blueTrailingConstraint, subTitleTopConstraint, subTitleCenterYConstraint ])
    }
}
