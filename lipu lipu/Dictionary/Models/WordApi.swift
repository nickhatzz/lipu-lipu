//
//  WordApi.swift
//  lipu lipu
//
//  Created by HPro2 on 3/7/25.
//

import Foundation

class apiCall {
    func getWords(completion:@escaping ([String: Word]) -> ()) {
        guard let url = URL(string: "https://api.linku.la/v1/words") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let words = try! JSONDecoder().decode([String: Word].self, from: data!)
            print(words)
            
            DispatchQueue.main.async {
                completion(words)
            }
        }
        .resume()
    }
}
