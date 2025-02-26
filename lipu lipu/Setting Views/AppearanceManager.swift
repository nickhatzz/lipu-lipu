//
//  AppearanceManager.swift
//  lipu lipu
//
//  Created by Nick on 2/26/25.
//

import SwiftUI

class AppearanceManager: ObservableObject {
    static let shared = AppearanceManager()
    @AppStorage("appearance") var appearanceChoice: String = "system"
    
    func getAppearanceChoice() -> ColorScheme? {
        switch appearanceChoice {
        case "light":
            return .light
        case "dark":
            return .dark
        default:
            return nil
        }
    }
}
