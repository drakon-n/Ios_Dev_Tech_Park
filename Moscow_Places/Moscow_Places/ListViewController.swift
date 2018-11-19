//
//  ListViewController.swift
//  Moscow_Places
//
//  Created by Влад on 18/11/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate {
    var modelArray = [CellModel]()
    let cellIdentifier = "TableCell"
    @IBOutlet weak var tableList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableList.delegate = self
        tableList.register(UINib.init(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
    
        let sourceURL = "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/opm.json"
        
        guard let urlJson = URL(string: sourceURL)else{return}
        URLSession.shared.dataTask(with: urlJson){(data, responce, error) in
            guard let data = data else{return}
            guard error == nil else {return}
            do {
                let jsonResult = try JSONDecoder().decode(listArr.self, from:data )
            }catch let error{print(error)}
        }.resume()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
