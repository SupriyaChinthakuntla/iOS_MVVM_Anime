//
//  AnimeAPIHandler.swift
//  FidelityPreScreen
//
//  Created by Priya Reddy on 1/14/21.
//

import UIKit

class AnimeAPIHandler: NSObject {
    
    func getAnimeDetails(url: String, completionHandler :@escaping (_ animeArray: [Anime], _ success: String?, _ error: NSError?) -> Void) {
        
        guard let _url = URL(string: "https://api.jikan.moe/v3/search/anime?q=naruto") else {
            return
        }
        let urlRequest = URLRequest(url: _url)
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            
            // JSON Parsing with JSON Serialization
            /*   do {
             let jsonResult = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
             
             let jsonLoans = jsonResult?["results"] as! [AnyObject]
             
             var animeArray = [Anime]()
             for json in jsonLoans {
             
             let imageUrl = json["image_url"] as? String
             let url = json["url"] as? String
             let title = json["title"] as? String
             let synopsis = json["synopsis"] as? String
             let start_date = json["start_date"] as? String
             let end_date = json["end_date"] as? String
             let type = json["type"] as? String
             
             let id = json["mal_id"] as? Int
             
             
             let anime = Anime(url: url ?? "", imageUrl: imageUrl ?? "", title: title ?? "", synopsis: synopsis ?? "", type: type ?? "", start_date: start_date ?? "", end_date: end_date ?? "", id: id ?? 0)
             
             animeArray.append(anime)
             
             }
             
             completionHandler(animeArray, "Success", error as NSError?)
             
             } catch {
             print(error)
             } */
            
            // JSON Parsing with JSONDecoder
            
            let animeArray = [Anime]()
            do {
                // Initializes a Response object from the JSON data at the top.
                
                let results = try? JSONDecoder().decode(AnimeResults.self, from: data!)
                completionHandler(results?.results ?? animeArray, "Success", error as NSError?)
                
            }
        }.resume()
        
    }
}
