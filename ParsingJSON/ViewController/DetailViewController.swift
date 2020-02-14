//
//  DetailViewController.swift
//  ParsingJSON
//
//  Created by Consultant on 2/13/20.
//  Copyright © 2020 Enhance IT. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    

    @IBOutlet weak var detailImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
    
    var currentAlbum: PhotoInfo!{
        didSet {
            // download small img
                      guard let smallUrl = URL(string: currentAlbum.url ?? "No Big Image") else {return }
                      smallUrl.downloadImage{[weak self] gotBigImg in
                          self?.detailImage.image = gotBigImg
                   
        }
    }
}

}
