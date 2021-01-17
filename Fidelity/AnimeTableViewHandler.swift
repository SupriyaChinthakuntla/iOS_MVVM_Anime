//
//  AnimeTableViewHandler.swift
//  FidelityPreScreen
//
//  Created by Priya Reddy on 1/14/21.
//

import UIKit

class AnimeTableViewHandler: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    weak var tableView: UITableView!
    var animeArray = [Anime]()
    //MVVM pattern
    var animeAPIHandler = AnimeAPIHandler()
       
    
   public func doInitialSetup() {
        animeAPIHandler.getAnimeDetails(url: "https://api.jikan.moe/v3/search/anime?q=naruto") { (animeArray, success, error) in
            DispatchQueue.main.async {
                self.animeArray = animeArray
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animeCell") as? AnimeTableViewCell
        
        if let url = URL(string: animeArray[indexPath.row].image_url)  {
            cell?.animeImage.load(url: url )
        }
        
        cell?.titleLbl.text = animeArray[indexPath.row].title
        
        cell?.synposisLbl.text = animeArray[indexPath.row].synopsis
        cell?.startDateLbl.text = (animeArray[indexPath.row].start_date ?? "") + (animeArray[indexPath.row].end_date ?? "")

        return cell ?? UITableViewCell()
        
    }
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
