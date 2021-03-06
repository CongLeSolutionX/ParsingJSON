//
//  downloadImg.swift
//  ParsingJSON
//
//  Created by Cong Le on 2/12/20.
//  Copyright © 2020 CongLeSolutionX. All rights reserved.
//

import UIKit

typealias ImageHandler = (UIImage?) -> Void
extension URL{
    func downloadImage(completion: @escaping ImageHandler){
        URLSession.shared.dataTask(with: self){dat,_,_ in
            if let data = dat {
                let img = UIImage(data: data)
                DispatchQueue.main.async {
                     completion(img)
                }
                
            }
        }.resume()
    }
}
