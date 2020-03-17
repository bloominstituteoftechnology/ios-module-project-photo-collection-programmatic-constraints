//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import SwiftUI

class ThemeSelectionViewController: UIViewController {
    
    // MARK: - Properties
    
    var themeHelper: ThemeHelper?
    
    
    // MARK: - Private
    
    @UseAutoLayout private var themeSelectionLabel = UILabel()
    @UseAutoLayout private var themeSelector = UISegmentedControl(items: ["Dark", "Blue"])
    
    private func setUpSubviews() {
        themeSelectionLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        themeSelectionLabel.textColor = .white
        themeSelectionLabel.text = "Select a Theme"
        
        themeSelector.backgroundColor = .lightGray
        themeSelector.selectedSegmentIndex = themeHelper?.themePreference == "Dark" ? 0 : 1
        themeSelector.addTarget(self, action: #selector(themeSelected(_:)), for: .valueChanged)
        
        let stackView = UIStackView(arrangedSubviews: [themeSelectionLabel, themeSelector])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    
    // MARK: - Action Handlers
    
    @objc private func themeSelected(_ sender: UISegmentedControl) {
        guard let themeHelper = themeHelper else { return }
        
        if sender.selectedSegmentIndex == 0 {
            themeHelper.setThemePreferenceToDark()
        } else {
            themeHelper.setThemePreferenceToBlue()
        }
        
        view.setTheme(with: themeHelper)
    }
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        
        if let themeHelper = themeHelper {
            view.setTheme(with: themeHelper)
        }
    }
}


// MARK: - SwiftUI Preview

struct ThemeSelectionWrapper: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<ThemeSelectionWrapper>) -> UIView {
        return ThemeSelectionViewController().view
    }
    
    func updateUIView(_ uiView: ThemeSelectionWrapper.UIViewType, context: UIViewRepresentableContext<ThemeSelectionWrapper>) {
    }
}

struct ThemeSelectionWrapper_Previews: PreviewProvider {
    static var previews: some View {
        ThemeSelectionWrapper().background(Color(white: 0.1)).edgesIgnoringSafeArea(.all)
    }
}
