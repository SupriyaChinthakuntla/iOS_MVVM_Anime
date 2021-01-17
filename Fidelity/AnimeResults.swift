//
//  AnimeResults.swift
//  Fidelity
//
//  Created by Priya Reddy on 1/17/21.
//

import Foundation

struct AnimeResults: Codable {
    
    var results : [Anime]
    var request_hash : String
    
    init(results: [Anime], request_hash: String) {
        self.results = results
        self.request_hash = request_hash
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.request_hash = try container.decode(String.self, forKey: .request_hash)
        self.results  = try container.decode([Anime].self, forKey: .results)
    }
}
