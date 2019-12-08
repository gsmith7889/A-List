//
//  Celebrity.swift
//  CelebMedia
//
//  Created by Gabriella Smith on 11/16/19.
//  Copyright © 2019 Gabriella Smith. All rights reserved.
//


import Foundation
import UIKit

class Celebrity: Codable {
    var name: String
    var profile: String
    var photo: String
    
    init(name: String, profile: String, photo: String){
        self.name = name
        self.profile = profile
        self.photo = photo
            }
    
    
}
