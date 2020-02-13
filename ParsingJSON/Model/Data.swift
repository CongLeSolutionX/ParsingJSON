//
//  Data.swift
//  ParsingJSON
//
//  Created by Consultant on 2/11/20.
//  Copyright © 2020 Enhance IT. All rights reserved.
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
