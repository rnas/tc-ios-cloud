//
//  BeerViewController.swift
//  PUNKBeers
//
//  Created by rnas on 08/07/17.
//  Copyright © 2017 rnas. All rights reserved.
//

import UIKit

class BeerViewController: UIViewController {

    public var beer : Beer!
    
    @IBOutlet var beerTitle: UILabel!
    @IBOutlet var beerCatch: UILabel!
    @IBOutlet var beerDescription: UILabel!
    @IBOutlet var beerTeor: UILabel!
    @IBOutlet var beerAmargor: UILabel!
    @IBOutlet var beerImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem?.title = ""

        beerTitle.text = beer.name
        beerCatch.text = beer.tagline
        beerDescription.text = beer.desc
        beerTeor.text = "\(beer.abv!)"
        beerAmargor.text = "\(beer.ibu!)"
        
        if (beer.image != nil) {
            
            beerImage.image = beer.image
            
        } else {
            
            DispatchQueue.global().async {
                
                let data = NSData(contentsOf: self.beer.image_url!)
                let image = UIImage(data: data! as Data)
                
                self.beer.image = image
                
                DispatchQueue.main.async {
                    self.beerImage.image = self.beer.image
                }
            }
        }
    }
}
