//
//  ViewController.swift
//  TableViewSwift
//
//  Created by d.taraev on 14.03.2018.
//  Copyright © 2018 mail.ru. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let cellIdentifier = "CustomTableViewCell"
    @IBOutlet weak var tableView: UITableView!
    let anime: [String] = ["beck", "attack_on_titan", "gto", "gits", "opm", "steinsgate", "clannad", "fma", "monster", "usagi", "code_geass"]
    var modelArray = [CellModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fillModelArray(anime)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func fillModelArray(_ mass: [String]) {
        for i in 1...mass.count {
            let model = CellModel()
            model.title = "\(mass[i-1])"
            modelArray.append(model)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        performSegue(withIdentifier: "Trade", sender: nil)
        //tableView.deselectRow(at: indexPath, animated: true)
        //let vc = UIViewController()
        //navigationController?.pushViewController(vc, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        if segue.identifier == "Trade" {
            let indexPath = tableView.indexPathForSelectedRow
            let finishResult = segue.destination as? SecondViewController
            //finishResult?.LastField.text = "\(anime[indexPath?.row ?? 12])"
            finishResult?.textOfLabel = "\(anime[indexPath?.row ?? 1])"
        }}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = modelArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        if let castedCell = cell as? CustomTableViewCell {
            castedCell.fillCell(with: model)
        }
        return cell
    }
}

