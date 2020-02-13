//
//  ListViewCell.swift
//  ParsingJSON
//
//  Created by Consultant on 2/11/20.
//  Copyright © 2020 Enhance IT. All rights reserved.
//

import UIKit

class ListViewCell: UITableViewCell {
 // Table view cells are reused and should be dequeued using a cell identifier.
    static let identifier = "ListViewCell"
    
    @IBOutlet weak var listImage: UIImageView!
    
    @IBOutlet weak var listTitleLabel: UILabel!
    
    @IBOutlet weak var listAlbumId: UILabel!
    
    @IBOutlet weak var listIdLabel: UILabel!
    
    var album: PhotoInfo!{
        didSet{
            listTitleLabel.text = album.title
            listAlbumId.text = album.albumId?.toString()
            listAlbumId.text = album.id?.toString()
            
            // download small img
            guard let smallUrl = URL(string: album.thumbnailUrl ?? "No smallImgURl") else {return }
            smallUrl.downloadImage{[weak self] gotSmallImg in
                self?.listImage.image = gotSmallImg
            }
        }
    }
    
    
}
extension Int {
    func toString() -> String {
        return String(self)
    }
}
