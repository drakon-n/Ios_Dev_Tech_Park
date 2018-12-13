//
//  ListViewController.swift
//  Moscow_Places
//
//  Created by Влад on 18/11/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit



class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return modelArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        performSegue(withIdentifier: "GoPlace", sender: nil)
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = modelArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        if let castedCell = cell as? TableCell {
            castedCell.fillCell(with: model)
        }
        return cell
    }
    
    var modelArray = [CellModel]()
    var category:String = " "
    var identifier: [String] = []
    
    let cellIdentifier = "TableCell"
    @IBOutlet weak var tableList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableList.delegate = self
        tableList.dataSource = self
        tableList.register(UINib.init(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        
        
        let sourceURL = "https://raw.githubusercontent.com/drakon-n/Ios_Dev_Tech_Park/master/Moscow_Places/JSON/\(category).json"
        
        DispatchQueue.global().async {
        guard let urlJson = URL(string: sourceURL)else{return}
        URLSession.shared.dataTask(with: urlJson){(data, responce, error) in
            guard let data = data else{return}
            guard error == nil else {return}
            do {
               let jsonResult = try JSONDecoder().decode(listArr.self, from:data )
                DispatchQueue.main.async {
                    self.fillModelArray(jsonResult)
                    self.tableList.reloadData()
                }
            
            }catch let error{print(error)}
            }.resume()}
        
    }
    func fillModelArray(_ mass: listArr) {
        for elm in mass.places {
            let model = CellModel()
            model.image = "\(elm.image)"
            model.title = "\(elm.name)"
            identifier.append(elm.cellname)
            modelArray.append(model)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?){
        
        let finishResult = segue.destination as? PlaceViewController
        
        let indexPath = tableList.indexPathForSelectedRow
        finishResult?.identifier = "\(self.identifier[indexPath?.row ?? 1])"
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
