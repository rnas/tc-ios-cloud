//
//  BeerAPI.swift
//  PUNKBeers
//
//  Created by rnas on 08/07/17.
//  Copyright © 2017 rnas. All rights reserved.
//

import UIKit

class BeerAPI: NSObject {
    
    let baseEndpoint : String = "https://api.punkapi.com/v2"
    
    func getBeersList(page : Int, success : @escaping ([Beer]) -> Void, error : @escaping (_ error : String) -> Void) -> Void {
    
        let urlRequest = URL(string: "\(baseEndpoint)/beers")
    
        URLSession.shared.dataTask(with: urlRequest!) { (data : Data?, response : URLResponse?, errors :Error?) in
            
            if (errors != nil || nil == data){
                error("")
                return
            }
            
            do {
            
                let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [[String:AnyObject]]
                
                
                var response : [Beer] = []
                
                for i in 0...(json.count-1) {
                    
                    response.append(
                        Beer(
                            name: json[i]["name"]! as! String,
                            image_url: URL(string: json[i]["image_url"]! as! String)!,
                            tagline: json[i]["tagline"]! as! String,
                            abv: json[i]["abv"] as? Double ?? 0.0,
                            ibu: json[i]["ibu"] as? Double ?? 0.0,
                            desc: json[i]["description"]! as! String
                        )
                    )
                }
                
                success(response)
                
                
            } catch {
//                error("")
            }
            
        }.resume()
        
        
    }
    
    
}
