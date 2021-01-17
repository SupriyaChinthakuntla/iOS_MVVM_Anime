//
//  Anime.swift
//  FidelityPreScreen
//
//  Created by Priya Reddy on 1/14/21.
//

import Foundation
import SwiftUI

struct Anime: Codable {
    
    var url : String
    var image_url : String
    var title : String
    var synopsis: String
    var type: String
    // Handling null values for start_date and end_date
    var start_date: String?
    var end_date : String?
    
    
    init(url: String, imageUrl: String, title: String, synopsis: String, type: String, start_date: String, end_date: String) {
        self.url = url
        self.image_url = imageUrl
        self.title = title
        self.synopsis = synopsis
        self.type = type
        self.start_date = start_date
        self.end_date = end_date
    }
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
         
        self.url  = try container.decode(String.self, forKey: .url)
        self.image_url = try container.decode(String.self, forKey: .image_url)
        self.title = try container.decode(String.self, forKey: .title)
        self.synopsis = try container.decode(String.self, forKey: .synopsis)
        self.type = try container.decode(String.self, forKey: .type)
        
        // Handling null values for start_date and end_date

        if let startDate =  try container.decodeIfPresent(String.self, forKey: .start_date) {
                  self.start_date = startDate
              }else {
                  self.start_date = ""
              }
        
        if let endDate =  try container.decodeIfPresent(String.self, forKey: .end_date) {
                  self.end_date = endDate
              }else {
                  self.end_date = ""
              }

     }
    
}
