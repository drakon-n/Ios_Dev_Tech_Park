//
//  RestoranTypeViewController.swift
//  Moscow_Places
//
//  Created by Влад on 18/11/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit

class RestoranTypeViewController: UIViewController{
    @IBOutlet weak var EconomButton: UIButton!
    @IBOutlet weak var MiddleButton: UIButton!
    @IBOutlet weak var EliteButton: UIButton!
    
    override func viewDidLoad(){
        super.viewDidLoad()
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?){
        
        let finishResult = segue.destination as? ListViewController
        finishResult?.category = "\(segue.identifier ?? "error")"
    }

}
