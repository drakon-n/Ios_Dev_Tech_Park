//
//  MenuViewController.swift
//  Moscow_Places
//
//  Created by Влад on 07/11/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit
struct listArr:Codable{
struct list:Codable{
    let name: String
    let cellname: String
    let image: String
}
    let places:[list]
}
class MenuViewController: UIViewController
{

	override func viewDidLoad()
    {
		super.viewDidLoad()
	}
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?)
    {
            //let indexPath = tableView.indexPathForSelectedRow
        let finishResult = segue.destination as? ListViewController
        finishResult?.category = "\(segue.identifier ?? "error")"
    }
}

