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
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.title = "Photo Collection"
        navigationController?.isNavigationBarHidden = false
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
    
    private func setUpSubViews() {
        let titleLabel = UILabel()
        let themeLabel = UILabel()
        
        titleLabel.text = "PhotoCollection"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        themeLabel.text = "Select A Theme"
        themeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(themeLabel)
        themeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let darkButton = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 50))
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        darkButton.setTitle("Dark", for: .normal)
        darkButton.setTitleColor(.black, for: .normal)
        
        let blueButton = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 50))
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.setTitle("Blue", for: .normal)
        blueButton.setTitleColor(.black, for: .normal)
        
        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        view.addSubview(darkButton)
        view.addSubview(blueButton)
        
        let titleTop = NSLayoutConstraint(item: titleLabel,
                                          attribute: .top,
                                          relatedBy: .equal,
                                          toItem: view.safeAreaLayoutGuide,
                                          attribute: .top,
                                          multiplier: 1,
                                          constant: 20)
        
        
        let labelTop = NSLayoutConstraint(item: themeLabel,
                                          attribute: .top,
                                          relatedBy: .equal,
                                          toItem: titleLabel,
                                          attribute: .bottom,
                                          multiplier: 1,
                                          constant: 20)
        
        
        let darkTop = NSLayoutConstraint(item: darkButton,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: themeLabel,
                                         attribute: .bottom,
                                         multiplier: 1,
                                         constant: 20)
        
        
        let darkLeading = NSLayoutConstraint(item: darkButton,
                                             attribute: .leading,
                                             relatedBy: .equal,
                                             toItem: view.safeAreaLayoutGuide,
                                             attribute: .leading,
                                             multiplier: 1,
                                             constant: 50)
        
        let blueTop = NSLayoutConstraint(item: blueButton,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: themeLabel,
                                         attribute: .bottom,
                                         multiplier: 1,
                                         constant: 20)
        
        let blueTrailing = NSLayoutConstraint(item: blueButton,
                                              attribute: .trailing,
                                              relatedBy: .equal,
                                              toItem: view.safeAreaLayoutGuide,
                                              attribute: .trailing,
                                              multiplier: 1,
                                              constant: -50)
        
        let darkBlueConstraints = NSLayoutConstraint(item: darkButton,
                                                     attribute: .trailing,
                                                     relatedBy: .greaterThanOrEqual,
                                                     toItem: blueButton,
                                                     attribute: .leading,
                                                     multiplier: 1,
                                                     constant: 20)
            
        NSLayoutConstraint.activate([titleTop, labelTop, darkTop, darkLeading, blueTop, blueTrailing, darkBlueConstraints])
        
    }
}
