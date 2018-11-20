//
//  RestoranTypeViewController.swift
//  Moscow_Places
//
//  Created by Влад on 18/11/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit

class RestoranTypeViewController: UIViewController {
    @IBOutlet weak var EconomButton: UIButton!
    @IBOutlet weak var MiddleButton: UIButton!
    @IBOutlet weak var EliteButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        //let indexPath = tableView.indexPathForSelectedRow
        let finishResult = segue.destination as? ListViewController
        //finishResult?.LastField.text = "\(anime[indexPath?.row ?? 12])"
        finishResult?.category = "\(segue.identifier ?? "error")"
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
