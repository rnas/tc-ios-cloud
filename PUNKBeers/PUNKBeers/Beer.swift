//
//  Beer.swift
//  PUNKBeers
//
//  Created by rnas on 08/07/17.
//  Copyright © 2017 rnas. All rights reserved.
//

import UIKit

class Beer: NSObject {

    var image_url : URL!
    var name : String!
    var tagline : String!
    var abv : Double!
    var ibu : Double!
    var desc: String!
    var image : UIImage?
    
    init(name : String, image_url : URL, tagline : String, abv : Double, ibu : Double, desc : String) {
        
        self.name = name
        self.image_url = image_url
        self.tagline = tagline
        self.abv = abv
        self.ibu = ibu
        self.desc = desc
        
    }
}
