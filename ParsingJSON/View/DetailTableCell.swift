//
//  DetailTableCell.swift
//  ParsingJSON
//
//  Created by Consultant on 2/13/20.
//  Copyright © 2020 Enhance IT. All rights reserved.
//

import UIKit

class DetailTableCell: UITableViewCell {

     static let identifier = "DetailTableCell"
    @IBOutlet weak var detailImage: UIImageView!
    
    // get the full screen image 
    var album: PhotoInfo!{
        didSet{
            guard let url = URL(string: album.url ?? "No URL string") else{return}
            url.downloadImage{ image in
                self.detailImage.image = image
                
            }
            
        }
    }
    
    
}
