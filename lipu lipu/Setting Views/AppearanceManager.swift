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
    @AppStorage("accent") var accentColorChoice: String = "laso loje pi ilo lipu lipu"
    
    let accentColors: [accentColor] = [
        accentColor(name: "laso loje pi ilo lipu lipu", color: .accent),
        accentColor(name: "loje", color: Color(red: 235/255, green: 75/255, blue: 63/255)),
        accentColor(name: "loje jelo", color: Color(red: 247/255, green: 156/255, blue: 64/255)),
        accentColor(name: "jelo", color: Color(red: 237/255, green: 219/255, blue: 81/255)),
        accentColor(name: "laso", color: Color(red: 63/255, green: 156/255, blue: 56/255)),
        accentColor(name: "laso (again)", color: Color(red: 78/255, green: 116/255, blue: 199/255)),
        accentColor(name: "loje walo", color: Color(red: 232/255, green: 121/255, blue: 165/255)),
        accentColor(name: "walo", color: Color.white),
    ]
        
    struct accentColor: Hashable {
        let name: String
        let color: Color
    }
    
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
    
    func getAccentColor() -> Color {
        for color in accentColors {
            if color.name == accentColorChoice {
                return color.color
            }
        }
        return accentColors[0].color
    }
}
