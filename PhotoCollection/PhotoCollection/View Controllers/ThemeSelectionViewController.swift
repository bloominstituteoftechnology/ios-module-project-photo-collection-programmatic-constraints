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
    
    private func setUpSubViews() {
        let titleLabel = UILabel()
        let themeLabel = UILabel()
        
        titleLabel.text = "PhotoCollection"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 34)
        
        themeLabel.text = "Select a theme"
        themeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        view.addSubview(themeLabel)
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        themeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        
        let darkButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        darkButton.setTitleColor(.black, for: .normal)
        darkButton.setTitle("Dark", for: .normal)
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        
        let blueButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        blueButton.setTitleColor(.black, for: .normal)
        blueButton.setTitle("Blue", for: .normal)
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        
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
                                          constant: 16)
        
        let labelTop = NSLayoutConstraint(item: themeLabel,
                                          attribute: .top,
                                          relatedBy: .equal,
                                          toItem: titleLabel,
                                          attribute: .bottom,
                                          multiplier: 1,
                                          constant: 16)
        
        let darkTop = NSLayoutConstraint(item: darkButton,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: themeLabel,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 16)
        
        let darkLeading = NSLayoutConstraint(item:darkButton,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view.safeAreaLayoutGuide,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 64)
        
        let blueTop = NSLayoutConstraint(item: blueButton,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: themeLabel,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 16)
        
        let blueTrailing = NSLayoutConstraint(item: blueButton,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view.safeAreaLayoutGuide,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -64)
        
        let darkBlueConstraint = NSLayoutConstraint(item: darkButton,
                           attribute: .trailing,
                           relatedBy: .greaterThanOrEqual,
                           toItem: blueButton,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 16)
        
        NSLayoutConstraint.activate([titleTop, labelTop, darkTop, darkLeading, blueTop, blueTrailing])
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
}
