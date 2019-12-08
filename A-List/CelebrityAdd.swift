//
//  CelebrityAdd.swift
//  A-List
//
//  Created by Amy Ouyang on 12/8/19.
//  Copyright © 2019 Gabriella Smith. All rights reserved.
//
import Foundation
import UIKit

class CelebrityAdd  {
var name: String
    var profile: UIImage
    var image: UIImage
    var url: [String]
    
    init(name: String, profile: UIImage, image: UIImage, url: [String]){
        self.name = name
        self.profile = profile
        self.image = image
        self.url = url
        
    }
}
