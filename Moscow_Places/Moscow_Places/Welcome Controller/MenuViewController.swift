//
//  WelcomeViewController.swift
//  Moscow_Places
//
//  Created by Влад on 07/11/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit
struct listArr:Codable{
struct list:Codable{
    let name: String
}
    let listAr:[list]
}
class MenuViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
	}
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        if segue.identifier == "Parks" {
            //let indexPath = tableView.indexPathForSelectedRow
            let finishResult = segue.destination as? ListViewController
            //finishResult?.LastField.text = "\(anime[indexPath?.row ?? 12])"
            //finishResult?.textOfLabel = "\(anime[indexPath?.row ?? 1])"
        }}
}

