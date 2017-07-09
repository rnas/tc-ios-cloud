//
//  BeerTableViewController.swift
//  PUNKBeers
//
//  Created by rnas on 08/07/17.
//  Copyright © 2017 rnas. All rights reserved.
//

import UIKit

class BeerTableViewController: UITableViewController {
    
    var dataSource : [Beer] = []
    let api : BeerAPI = BeerAPI()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        loading()
        DispatchQueue.global().async {
            self.getBeers()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    func getBeers() -> Void {
        
        api.getBeersList(page: 1, success: { (beers : [Beer]) in
            
            DispatchQueue.main.async {
                
                self.endLoading()
                
                self.dataSource = beers
                self.tableView.reloadData()
                
            }
            
        }) { (error : String) in
            
        }
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BeerTableViewCell

        cell.fill(beer: dataSource[indexPath.row])

        return cell
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "beerDetail" {
            
            let vc = segue.destination as! BeerViewController
            let row = tableView.indexPathForSelectedRow?.row
            vc.beer = dataSource[row!]
            
        }
    }
    
    
    func loading() {
        let alert = UIAlertController(title: nil, message: "Carregando dados...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    
    func endLoading() {
        self.dismiss(animated: false, completion: nil)
    }

}
