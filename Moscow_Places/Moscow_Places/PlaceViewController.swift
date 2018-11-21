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
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var titleLogo: UIImageView!
    @IBOutlet weak var textDescription: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sourceURL = "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/\(identifier).json"
        
        guard let urlJson = URL(string: sourceURL)else{return}
        
        DispatchQueue.global().async {
            
            
            URLSession.shared.dataTask(with: urlJson) { (data2, responce, error) in
                guard let data2 = data2 else {return}
                guard error == nil else{return}
                
                do{
                    let jsonResult = try JSONDecoder().decode(place.self, from: data2)
                    DispatchQueue.main.async {
                        let url = URL(string: jsonResult.image)
                        self.titleLogo.kf.setImage(with: url)
                        self.textDescription.text = jsonResult.description
                        self.titleName.text = jsonResult.title
                        
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
