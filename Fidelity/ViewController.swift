//
//  ViewController.swift
//  Fidelity
//
//  Created by Priya Reddy on 1/16/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    //MVVM pattern
    var _animeTableHandler: AnimeTableViewHandler!
    
    var animeTableHandler : AnimeTableViewHandler {
        get {
            if _animeTableHandler != nil {
               return _animeTableHandler
            }
            
            let handler = AnimeTableViewHandler()
            handler.tableView = self.tableView

            _animeTableHandler = handler
            return handler
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = animeTableHandler
        tableView.delegate = animeTableHandler
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animeTableHandler.doInitialSetup()
    }
}

