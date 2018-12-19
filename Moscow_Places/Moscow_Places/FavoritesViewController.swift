//
//  FavoritesViewController.swift
//  Moscow_Places
//
//  Created by Влад on 19/12/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit
import CoreData

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ooops: UILabel!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = modelArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        if let castedCell = cell as? FavoritesTableCell {
            castedCell.fillCell(with: model)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        performSegue(withIdentifier: "GoFavoritePlace", sender: nil)
        
    }
    
    
    var modelArray = [FavoriteCellModel]()
    let cellIdentifier = "FavoritesTableCell"
    
    override func viewDidLoad() {
        ooops.alpha = 0
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "FavoritesTableCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Place")
        do{
            placeData = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Failed to save \(error)")
        }
        fillModelPlace(placeData)
        self.tableView.reloadData()
    }
    
    func fillModelPlace(_ mass: [NSManagedObject]) {
        modelArray = []
        for elm in mass {
            let model = FavoriteCellModel()
            model.image = UIImage(data: elm.value(forKey: "image") as! Data)
            model.title = elm.value(forKey: "title") as? String
            modelArray.append(model)
        }
        if(mass.count==0){ooops.alpha = 1
            tableView.alpha = 0
        }else{ooops.alpha = 0
            tableView.alpha = 1}
    }

    override func prepare(for segue: UIStoryboardSegue, sender:Any?){
        if(segue.identifier=="GoFavoritePlace"){
            let finishResult = segue.destination as? PlaceViewController
            let indexPath = tableView.indexPathForSelectedRow
            finishResult?.inBase = true
            finishResult?.inBaseNumber = indexPath?.row ?? 0
            finishResult?.identifier = placeData[indexPath?.row ?? 0].value(forKey: "identifier") as! String
        }
    }
    
    

}
