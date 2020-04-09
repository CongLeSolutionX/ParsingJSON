//
//  Data.swift
//  ParsingJSON
//
//  Created by Cong Le on 2/12/20.
//  Copyright © 2020 CongLeSolutionX. All rights reserved.
//


import Foundation
struct AlbumResponse: Decodable{
    var albums: [PhotoInfo]?
}

struct PhotoInfo: Decodable{
    var id: Int?
    var albumId: Int?
    var title: String?
    var url: String?
    var thumbnailUrl: String?
    
}
