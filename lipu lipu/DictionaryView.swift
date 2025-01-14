//
//  DictionaryView.swift
//  lipu lipu
//
//  Created by HPro2 on 12/19/24.
//

import SwiftUI

struct DictionaryView: View {
    
    @State private var searchText = ""
    let words: [String] = try! String(contentsOfFile: Bundle.main.path(forResource: "words", ofType: "txt") ?? "", encoding: .ascii).components(separatedBy: "\n")
    let translations: [String] = try! String(contentsOfFile: Bundle.main.path(forResource: "translations", ofType: "txt") ?? "", encoding: .ascii).components(separatedBy: "\n")
//    @State private var words = [
//        Word(id: 1, name: "a", translations: "(interjection) ah, oh, ha, eh, um, oy; (particle) [placed after something for emphasis or emotion]", source: "pu"),
//        Word(id: 2, name: "akesi", translations: "reptile, amphibian, scaly creature, crawling creature", source: "pu"),
//        Word(id: 3, name: "ala", translations: "not, nothing, no; (particle) [negates a word or phrase]; (particle) [forms a yes-no question]; (number) zero", source: "pu"),
//        Word(id: 4, name: "alasa", translations: "hunt, forage, search, attempt; (preverb) try to", source: "pu"),
//        Word(id: 5, name: "ale", translations: "all, every, everything, entirety, universe; (number) one hundred", source: "pu"),
//        Word(id: 6, name: "anpa", translations: "bottom, underside; below, beneath; defeated, humble, lowly", source: "pu"),
//        Word(id: 7, name: "ante", translations: "different, altered; modify, change; other; difference", source: "pu"),
//        Word(id: 8, name: "anu", translations: "(particle) [separates multiple possibilities, replacing another particle], or", source: "pu"),
//        Word(id: 9, name: "awen", translations: "stay, remain, wait, pause; protect, keep safe; continue; (preverb) continue to", source: "pu"),
//        Word(id: 10, name: "e", translations: "(particle) [marks the start of a direct object]", source: "pu"),
//        Word(id: 11, name: "en", translations: "(particle) [separates multiple subjects]", source: "pu"),
//        Word(id: 12, name: "esun", translations: "trade, barter, exchange, swap, buy, sell; market, shop, fair, bazaar, place of business", source: "pu"),
//        Word(id: 13, name: "ijo", translations: "thing, object, entity, being, matter, phenomenon", source: "pu"),
//        Word(id: 14, name: "ike", translations: "negative quality, e.g. bad, unpleasant, harmful, unneeded", source:"pu"),
//        Word(id: 15, name: "ilo", translations: "tool, implement, machine, device", source: "pu"),
//        Word(id: 16, name: "insa", translations: "inside, center, between, middle, midpoint, internal", source: "pu"),
//        Word(id: 17, name: "jaki", translations: "disgusting, unclean, unsanitary, toxic, repulsive, rotten", source: "pu"),
//        Word(id: 18, name: "jan", translations: "human being, person, somebody", source: "pu"),
//        Word(id: 19, name: "jelo", translations: "yellow, amber, golden, lime yellow, yellowish orange", source: "pu"),
//        Word(id: 20, name: "jo", translations: "hold, carry, possess, contain, own", source: "pu"),
//        Word(id: 21, name: "kala", translations: "fish, marine animal, sea creature, swimming creature", source: "pu"),
//        Word(id: 22, name: "kalama", translations: "to produce sound; sound, e.g. sing, thunder, drum, clap, laugh, beep", source: "pu"),
//        Word(id: 23, name: "kama", translations: "arriving, coming, future, summoned; (preverb) to become, manage to, succeed in", source: "pu"),
//        Word(id: 24, name: "kasi", translations: "plant, vegetation; herb, leaf", source: "pu"),
//        Word(id: 25, name: "ken", translations: "can, may, ability, permission; possibility, maybe; allow, enable; (preverb) to be able to", source: "pu"),
//        Word(id: 26, name: "kepeken", translations: "(preposition) using, by means of", source: "pu"),
//        Word(id: 27, name: "kili", translations: "fruit, vegetable, mushroom", source: "pu"),
//        Word(id: 28, name: "kiwen", translations: "hard object e.g. metal, stone, wood", source: "pu"),
//        Word(id: 29, name: "ko", translations: "semi-solid, e.g. paste, powder, goo, sand, soil, clay; squishy, moldable; sticky", source: "pu"),
//        Word(id: 30, name: "kon", translations: "air, breath, wind; essence, spirit, soul, ghost; unseen agent", source: "pu"),
//        Word(id: 31, name: "kule", translations: "color, pigment; category, genre, flavor; colorful, diverse", source: "pu"),
//        Word(id: 32, name: "kulupu", translations: "group, community, society, company, nation, collection, team, crowd", source: "pu"),
//        Word(id: 33, name: "kute", translations: "ear, hearing organ; hear, listen, pay attention to, obey", source: "pu"),
//        Word(id: 34, name: "la", translations: "", source: "pu"),
//        Word(id: 35, name: "lape", translations: "", source: "pu"),
//        Word(id: 36, name: "laso", translations: "", source: "pu"),
//        Word(id: 37, name: "lawa", translations: "", source: "pu"),
//        Word(id: 38, name: "len", translations: "", source: "pu"),
//        Word(id: 39, name: "lete", translations: "", source: "pu"),
//        Word(id: 40, name: "li", translations: "", source: "pu"),
//        Word(id: 41, name: "lili", translations: "", source: "pu"),
//        Word(id: 42, name: "linja", translations: "", source: "pu"),
//        Word(id: 43, name: "lipu", translations: "", source: "pu"),
//        Word(id: 44, name: "loje", translations: "", source: "pu"),
//        Word(id: 45, name: "lon", translations: "", source: "pu"),
//        Word(id: 46, name: "luka", translations: "", source: "pu"),
//        Word(id: 47, name: "lukin", translations: "", source: "pu"),
//        Word(id: 48, name: "lupa", translations: "", source: "pu"),
//        Word(id: 49, name: "ma", translations: "", source: "pu"),
//        Word(id: 50, name: "mama", translations: "", source: "pu"),
//        Word(id: 51, name: "mani", translations: "", source: "pu"),
//        Word(id: 52, name: "mi", translations: "", source: "pu"),
//        Word(id: 53, name: "moku", translations: "", source: "pu"),
//        Word(id: 54, name: "moli", translations: "", source: "pu"),
//        Word(id: 55, name: "monsi", translations: "", source: "pu"),
//        Word(id: 56, name: "mu", translations: "", source: "pu"),
//        Word(id: 57, name: "mun", translations: "", source: "pu"),
//        Word(id: 58, name: "musi", translations: "", source: "pu"),
//        Word(id: 59, name: "mute", translations: "", source: "pu"),
//        Word(id: 60, name: "nanpa", translations: "", source: "pu"),
//        Word(id: 61, name: "nasa", translations: "", source: "pu"),
//        Word(id: 62, name: "nasin", translations: "", source: "pu"),
//        Word(id: 63, name: "nena", translations: "", source: "pu"),
//        Word(id: 64, name: "ni", translations: "", source: "pu"),
//        Word(id: 65, name: "nimi", translations: "", source: "pu"),
//        Word(id: 66, name: "noka", translations: "", source: "pu"),
//        Word(id: 67, name: "o", translations: "", source: "pu"),
//        Word(id: 68, name: "olin", translations: "", source: "pu"),
//        Word(id: 69, name: "ona", translations: "", source: "pu"),
//        Word(id: 70, name: "open", translations: "", source: "pu"),
//        Word(id: 71, name: "pakala", translations: "", source: "pu"),
//        Word(id: 72, name: "pali", translations: "", source: "pu"),
//        Word(id: 73, name: "palisa", translations: "", source: "pu"),
//        Word(id: 74, name: "pan", translations: "", source: "pu"),
//        Word(id: 75, name: "pana", translations: "", source: "pu"),
//        Word(id: 76, name: "pi", translations: "", source: "pu"),
//        Word(id: 77, name: "pilin", translations: "", source: "pu"),
//        Word(id: 78, name: "pimeja", translations: "", source: "pu"),
//        Word(id: 79, name: "pini", translations: "", source: "pu"),
//        Word(id: 80, name: "pipi", translations: "", source: "pu"),
//        Word(id: 81, name: "poka", translations: "", source: "pu"),
//        Word(id: 82, name: "poki", translations: "", source: "pu"),
//        Word(id: 83, name: "pona", translations: "", source: "pu"),
//        Word(id: 84, name: "pu", translations: "", source: "pu"),
//        Word(id: 85, name: "sama", translations: "", source: "pu"),
//        Word(id: 86, name: "seli", translations: "", source: "pu"),
//        Word(id: 87, name: "selo", translations: "", source: "pu"),
//        Word(id: 88, name: "seme", translations: "", source: "pu"),
//        Word(id: 89, name: "sewi", translations: "", source: "pu"),
//        Word(id: 90, name: "sijelo", translations: "", source: "pu"),
//        Word(id: 91, name: "sike", translations: "", source: "pu"),
//        Word(id: 92, name: "sin", translations: "", source: "pu"),
//        Word(id: 93, name: "sina", translations: "", source: "pu"),
//        Word(id: 94, name: "sinpin", translations: "", source: "pu"),
//        Word(id: 95, name: "sitelen", translations: "", source: "pu"),
//        Word(id: 96, name: "sona", translations: "", source: "pu"),
//        Word(id: 97, name: "soweli", translations: "", source: "pu"),
//        Word(id: 98, name: "suli", translations: "", source: "pu"),
//        Word(id: 99, name: "suno", translations: "", source: "pu"),
//        Word(id: 100, name: "supa", translations: "", source: "pu"),
//        Word(id: 101, name: "suwi", translations: "", source: "pu"),
//        Word(id: 102, name: "tan", translations: "", source: "pu"),
//        Word(id: 103, name: "taso", translations: "", source: "pu"),
//        Word(id: 101, name: "tawa", translations: "", source: "pu"),
//        Word(id: 102, name: "telo", translations: "", source: "pu"),
//        Word(id: 103, name: "tenpo", translations: "", source: "pu"),
//        Word(id: 104, name: "toki", translations: "", source: "pu"),
//        Word(id: 105, name: "tomo", translations: "", source: "pu"),
//        Word(id: 106, name: "tu", translations: "", source: "pu"),
//        Word(id: 107, name: "uta", translations: "", source: "pu"),
//        Word(id: 108, name: "utala", translations: "", source: "pu"),
//        Word(id: 109, name: "walo", translations: "", source: "pu"),
//        Word(id: 110, name: "wan", translations: "", source: "pu"),
//        Word(id: 111, name: "waso", translations: "", source: "pu"),
//        Word(id: 112, name: "wawa", translations: "", source: "pu"),
//        Word(id: 113, name: "weka", translations: "", source: "pu"),
//        Word(id: 114, name: "wile", translations: "", source: "pu"),
//        Word(id: 115, name: "kijetesantakalu", translations: "", source: "ku"),
//        Word(id: 116, name: "kin", translations: "", source: "ku"),
//        Word(id: 118, name: "kipisi", translations: "", source: "ku"),
//        Word(id: 119, name: "ku", translations: "", source: "ku"),
//        Word(id: 120, name: "leko", translations: "", source: "ku"),
//        Word(id: 121, name: "meli", translations: "", source: "pu"),
//        Word(id: 122, name: "mije", translations: "", source: "pu"),
//        Word(id: 123, name: "misikeke", translations: "", source: "ku"),
//        Word(id: 124, name: "monsuta", translations: "", source: "ku"),
//        Word(id: 125, name: "n", translations: "", source: "ku"),
//        Word(id: 126, name: "namako", translations: "", source: "ku"),
//        Word(id: 127, name: "soko", translations: "", source: "ku"),
//        Word(id: 128, name: "tonsi", translations: "", source: "ku"),
//    ]
        
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { word in
                    WordPreviewCellView(word: word, translations: "", source: "pu")
                }
            }
            .navigationTitle("Dictionary")
        }
        .searchable(text: $searchText)

    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return words
        } else {
            return words.filter {$0.contains(searchText)}
        }
    }
    
}

struct Word: Identifiable {
    let id: Int
    let name: String
    let translations: String
    let source: String // which toki pona book it's from: pu or ku
}

#Preview {
    DictionaryView()
}
