//
//  GridViewCell.swift
//  ParsingJSON
//
//  Created by Consultant on 2/12/20.
//  Copyright © 2020 Enhance IT. All rights reserved.
//

import UIKit

class GridViewCell: UICollectionViewCell {
     // Collection view cells are reused and should be dequeued using a cell identifier.
     static let identifier = "GridViewCell"
    
    @IBOutlet weak var gridImage: UIImageView!
    
   // @IBOutlet weak var gridTitleLabel: UILabel!
    @IBOutlet weak var gridAblumIDLabel: UILabel!
    
    @IBOutlet weak var gridIDLabel: UILabel!
    
    var album: PhotoInfo!{
        didSet{
            //gridTitleLabel.text = album.title
            
            gridAblumIDLabel.text = album.albumId?.toString()
            gridIDLabel.text = album.id?.toString()
            
            // download small img
            guard let smallUrl = URL(string: album.thumbnailUrl ?? "No smallImgURl") else {return }
            smallUrl.downloadImage{[weak self] gotSmallImg in
                self?.gridImage.image = gotSmallImg
         
                
            }
        }
    }
    
    
}
