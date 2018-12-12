//
//  PlaceViewController.swift
//  Moscow_Places
//
//  Created by Влад on 21/11/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit
import CoreLocation

class PlaceViewController: UIViewController, CLLocationManagerDelegate{
    var identifier: String = ""
    
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var placeLogo: UIImageView!
    @IBOutlet weak var placeDescription: UITextView!
    var locationManager: CLLocationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     locationManager.delegate = self
        let sourceURL = "https://raw.githubusercontent.com/drakon-n/Ios_Dev_Tech_Park/master/Moscow_Places/JSON/Places/\(identifier).json"
        
        guard let urlJson = URL(string: sourceURL)else{return}
        
        DispatchQueue.global().async {
            
            
            URLSession.shared.dataTask(with: urlJson) { (data2, responce, error) in
                guard let data2 = data2 else {return}
                guard error == nil else{return}
                
                do{
                    let jsonResult = try JSONDecoder().decode(place.self, from: data2)
                    DispatchQueue.main.async {
                        let url = URL(string: jsonResult.image)
                        self.placeLogo.kf.setImage(with: url)
                        self.placeDescription.text = jsonResult.description
                        self.placeName.text = jsonResult.title
                        
                    }
                
                }   catch let error{
                        print(error)
                    }
            }.resume()
        }
 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?)
    {
        let finishResult = segue.destination as? MapController
        
        finishResult?.text = "\(placeName.text ?? "ошибка")"
    }
}
