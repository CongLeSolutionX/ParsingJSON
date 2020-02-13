//
//  DownloadService.swift
//  ParsingJSON
//
//  Created by Consultant on 2/12/20.
//  Copyright © 2020 Enhance IT. All rights reserved.
//

import UIKit
typealias AlbumHandler = ([PhotoInfo]) -> Void

// make a singleton

let downloadServiceShared = DownloadService.shared

typealias DataHandler = ([PhotoInfo]) -> Void

final class DownloadService {
    static let shared = DownloadService()
    private init() {}
    
    func downloadJSONData (completion: @escaping AlbumHandler ){
        let urlString = "https://jsonplaceholder.typicode.com/photos"
        guard let url = URL(string: urlString) else {return } // safely unwrap
        
        
        // fetching the data from API
        URLSession.shared.dataTask(with: url) { (dat, _, err) in
            if let error = err{
                print(error.localizedDescription)
                completion([])
                return
            }
            
            if let data = dat {
                var response: [PhotoInfo] = []
                do{
                    response  = try JSONDecoder().decode([PhotoInfo].self, from: data)
                    print(response.count)
                } catch {
                    print("Error decoding json")
                    completion([])
                    return
                }
                completion(response)
                return
            }
        }.resume() // to fire the URLSession off
    }
    
    
    
}




