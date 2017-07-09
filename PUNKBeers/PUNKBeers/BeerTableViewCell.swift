//
//  BeerTableViewCell.swift
//  PUNKBeers
//
//  Created by rnas on 08/07/17.
//  Copyright © 2017 rnas. All rights reserved.
//

import UIKit

class BeerTableViewCell: UITableViewCell {
    
    @IBOutlet var ivBeer: UIImageView!
    @IBOutlet var lbBeerName: UILabel!
    @IBOutlet var lbBeerOz: UILabel!
    
    func fill(beer : Beer) {
        lbBeerName.text = beer.name
        lbBeerOz.text = "Teor alcoólico: \(beer.abv!)"
        
        if (beer.image != nil) {
            
            ivBeer.image = beer.image
            
        } else {
            
            ivBeer.image = nil
            
            DispatchQueue.global().async {
                
                let data = NSData(contentsOf: beer.image_url!)
                let image = UIImage(data: data! as Data)

                beer.image = image
                
                DispatchQueue.main.async {
                    self.ivBeer.image = beer.image
                }
            }
        }
    }
}
