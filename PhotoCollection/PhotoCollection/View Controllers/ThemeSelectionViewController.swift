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
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    func setUpSubViews() {
        let label = UILabel()
        self.view.addSubview(label)
        label.text = "Select a theme"
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let labelTopConstraint = NSLayoutConstraint(item: label,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self.view.safeAreaLayoutGuide,
                           attribute: .top,
                           multiplier: 1,
                           constant: 20)
        
        let labelXConstraint = NSLayoutConstraint(item: label,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: self.view.safeAreaLayoutGuide,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0)
        
        NSLayoutConstraint.activate([labelTopConstraint, labelXConstraint])
        
        let darkThemeButton = UIButton()
        darkThemeButton.setTitle("Dark", for: .normal)
        darkThemeButton.setTitleColor(.darkGray, for: .normal)
        darkThemeButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)
        self.view.addSubview(darkThemeButton)
        darkThemeButton.translatesAutoresizingMaskIntoConstraints = false
        
        let darkTopConstraint = NSLayoutConstraint(item: darkThemeButton,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: label,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 50)
        
        let darkLeadingConstraint = NSLayoutConstraint(item: darkThemeButton,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self.view.safeAreaLayoutGuide,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 35)
        
        NSLayoutConstraint.activate([darkTopConstraint, darkLeadingConstraint])
        
        let blueThemeButton = UIButton()
        blueThemeButton.setTitle("Blue", for: .normal)
        blueThemeButton.setTitleColor(UIColor(red: 14.0/255.0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1.0), for: .normal)
        blueThemeButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        self.view.addSubview(blueThemeButton)
        blueThemeButton.translatesAutoresizingMaskIntoConstraints = false
        
        let blueYConstraint = NSLayoutConstraint(item: blueThemeButton,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: darkThemeButton,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0)
        
        let blueTrailingConstraint = NSLayoutConstraint(item: blueThemeButton,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self.view.safeAreaLayoutGuide,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -35)
        
        NSLayoutConstraint.activate([blueYConstraint, blueTrailingConstraint])
    }
    
    var themeHelper: ThemeHelper?
}
