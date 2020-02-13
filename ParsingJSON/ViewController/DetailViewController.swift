//
//  DetailViewController.swift
//  ParsingJSON
//
//  Created by Consultant on 2/13/20.
//  Copyright © 2020 Enhance IT. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var detailTableView: UITableView!
   
    var currentAlbum: PhotoInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // viewModel.detailViewDelegate = self as! delegate 
       // detailTableView.dataSource = self as UITableViewDataSource
      print("heoo from detail view controller")
    }
    
    
    

}

