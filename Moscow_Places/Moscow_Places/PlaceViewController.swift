//
//  PlaceViewController.swift
//  Moscow_Places
//
//  Created by Влад on 21/11/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit

class PlaceViewController: UIViewController {
    var identifier: String = ""
    
    @IBOutlet weak var PlaceName: UILabel!
    @IBOutlet weak var PlaceLogo: UIImageView!
    @IBOutlet weak var PlaceDescription: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
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
                        self.PlaceLogo.kf.setImage(with: url)
                        self.PlaceDescription.text = jsonResult.description
                        self.PlaceName.text = jsonResult.title
                        
                    }
                
                }   catch let error{
                        print(error)
                    }
            }.resume()
        }
 
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
