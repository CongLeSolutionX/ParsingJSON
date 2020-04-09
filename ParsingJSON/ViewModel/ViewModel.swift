//
//  ViewModel.swift
//  ParsingJSON
//
//  Created by Cong Le on 2/12/20.
//  Copyright © 2020 CongLeSolutionX. All rights reserved.
//


import Foundation
protocol delegate: class{
    func updatingViewModel()
}
class ViewModel{
    weak var listViewDelegate: delegate?
    weak var gridViewDelegate: delegate?
  
    
    var albums: [PhotoInfo] = [] {
           didSet{
            listViewDelegate?.updatingViewModel()
            gridViewDelegate?.updatingViewModel()
           }
       }
    
    init(){
        downloadServiceShared.downloadJSONData{ [weak self] results in
                self?.albums = results
        }
    }
    
    func getAlbums() -> [PhotoInfo]{
        return albums
    }
    
    
}
