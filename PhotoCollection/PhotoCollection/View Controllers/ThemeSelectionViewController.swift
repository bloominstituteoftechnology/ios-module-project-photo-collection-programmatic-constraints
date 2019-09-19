//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    private let stackView = UIStackView()
    private let titleLabel = UILabel()
    private let label = UILabel()
    private let blueButton = UIButton()
    private let darkButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        
    }

    @objc
    func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @objc
    func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
    var themeHelper: ThemeHelper?
    
    private func setUpSubviews() {
        // vertical stackview
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.axis = .vertical
        self.stackView.spacing = 10.0
        self.view.addSubview(self.stackView)
        
        NSLayoutConstraint.activate([
            self.stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200.0)
            ])
        
        self.titleLabel.text = "Photo Collection"
        self.titleLabel.font = UIFont.systemFont(ofSize: 32.0, weight: .bold)
        self.titleLabel.textAlignment = .center
        self.stackView.addArrangedSubview(titleLabel)
        
        self.label.text = "Which color theme do you want to use?"
        self.stackView.addArrangedSubview(label)

        
        let innerStackView = UIStackView()
        innerStackView.axis = .horizontal
        innerStackView.spacing = 10.0
        innerStackView.distribution = .fillEqually
        
        self.blueButton.setTitle("Blue", for: .normal)
        self.darkButton.setTitle("Dark", for: .normal)
        self.blueButton.setTitleColor(.blue, for: .normal)
        self.darkButton.setTitleColor(.blue, for: .normal)
        self.blueButton.addTarget(self, action: #selector(selectBlueTheme), for: .primaryActionTriggered)
        self.darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .primaryActionTriggered)
        innerStackView.addArrangedSubview(blueButton)
        innerStackView.addArrangedSubview(darkButton)
        self.stackView.addArrangedSubview(innerStackView)
    }
}
