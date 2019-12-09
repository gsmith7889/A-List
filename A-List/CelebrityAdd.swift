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
    var profile: String
    var profileI: UIImage
    var photo: String
    var image: UIImage
    var urls: [String]
    


    init(name: String, profile: String, profileI: UIImage, photo: String, image: UIImage, urls: [String]){
        self.name = name
        self.profile = profile
        self.profileI = profileI
        self.photo = photo
        self.image = image
        self.urls = urls

    }
    
//    init(name: String, profile: String, photo: String, urls: [String]){
//        self.name = name
//        self.profile = profile
//        self.photo = photo
//        self.urls = urls
//    }
}
