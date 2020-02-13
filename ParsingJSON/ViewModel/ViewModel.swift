//
//  ViewModel.swift
//  ParsingJSON
//
//  Created by Consultant on 2/11/20.
//  Copyright © 2020 Enhance IT. All rights reserved.
//

import Foundation
protocol delegate: class{
    func updatingViewModel()
}
class ViewModel{
    weak var listViewDelegate: delegate?
    weak var gridViewDelegate: delegate?
  
    //var currentAlbum: PhotoInfo! 
    
    
    var albums: [PhotoInfo] = [] {
           didSet{
            listViewDelegate?.updatingViewModel()
            gridViewDelegate?.updatingViewModel()
           }
       }
    init(){
        downloadServiceShared.downloadJSONData{[weak self] results in
           
                self?.albums = results
            
        }
    }
    
    func getAlbums() -> [PhotoInfo]{
        return albums
    }
    
    
}
