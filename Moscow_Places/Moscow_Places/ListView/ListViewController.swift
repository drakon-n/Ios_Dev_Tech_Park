//
//  ListViewController.swift
//  Moscow_Places
//
//  Created by Влад on 18/11/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit



class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var navigationView: UIView!
    @IBOutlet weak var ooops: UILabel!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return modelArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        if(category=="Event"){performSegue(withIdentifier: "GoEvent", sender: nil)}
        else{performSegue(withIdentifier: "GoPlace", sender: nil)}
    
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
        ooops.alpha = 0
        self.view.backgroundColor = #colorLiteral(red: 0.09432386607, green: 0.1339568198, blue: 0.1721197665, alpha: 1)
        super.viewDidLoad()
        tableList.delegate = self
        tableList.dataSource = self
        tableList.register(UINib.init(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        
        if(category=="Event"){
            if((doneResult?.results.count ?? -1)>0){
            fillModelEvent(doneResult!)
                self.tableList.reloadData()}
        }
        else{
        let sourceURL = "https://raw.githubusercontent.com/drakon-n/Ios_Dev_Tech_Park/master/Moscow_Places/JSON/\(category).json"
        
        DispatchQueue.global().async {
        guard let urlJson = URL(string: sourceURL)else{return}
        URLSession.shared.dataTask(with: urlJson){(data, responce, error) in
            guard let data = data else{return}
            guard error == nil else {return}
            do {
               let jsonResult = try JSONDecoder().decode(listArr.self, from:data )
                DispatchQueue.main.async {
                    self.fillModelPlace(jsonResult)
                    self.tableList.reloadData()
                }
            
            }catch let error{print(error)}
            }.resume()}
        
        }}
    func fillModelPlace(_ mass: listArr) {
        modelArray = []
        for elm in mass.places {
            let model = CellModel()
            model.image = "\(elm.image)"
            model.title = "\(elm.name)"
            identifier.append(elm.cellname)
            modelArray.append(model)
            if(mass.places.count==0){ooops.alpha = 1
                tableList.alpha = 0
            }else{ooops.alpha = 0
                tableList.alpha = 1}
        }
        
    }
        func fillModelEvent(_ mass: event) {
            modelArray = []
            for elm in mass.results {
                let model = CellModel()
                model.image = "\(elm.images[0].image)"
                model.title = "\(elm.title)"
                modelArray.append(model)
                if(mass.results.count==0){ooops.alpha = 1
                    tableList.alpha = 0
                }else{ooops.alpha = 0
                    tableList.alpha = 1}
            }
    }
    override func viewWillAppear(_ animated: Bool) {
        if(category=="Event"){
            if((doneResult?.results.count ?? -1)>0){
                fillModelEvent(doneResult!)
                self.tableList.reloadData()}
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender:Any?){
        if(segue.identifier=="GoPlace"){
            let finishResult = segue.destination as? PlaceViewController
            let indexPath = tableList.indexPathForSelectedRow
            finishResult?.identifier = "\(self.identifier[indexPath?.row ?? 1])"
        }
        if(segue.identifier=="GoEvent"){
            let finishResult = segue.destination as? EventController
            let indexPath = tableList.indexPathForSelectedRow
            finishResult?.eventNumber = indexPath?.row ?? 0
        }
        
    }
    

}
