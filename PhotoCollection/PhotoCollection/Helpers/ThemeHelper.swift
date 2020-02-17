//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeHelper {
    
    private let themePreferenceKey = "themePreference"
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    init() {
        guard themePreference == nil else { return }
        setThemePreferenceToDark()
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.set("Blue", forKey: themePreferenceKey)
    }
}
