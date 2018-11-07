//
//  SecondViewController.swift
//  TableViewSwift
//
//  Created by Влад on 24/10/2018.
//  Copyright © 2018 mail.ru. All rights reserved.
//

import UIKit

struct Anim: Codable {
    var name: String
    var type: String
    var episodes: String
    var episode_length: String
    var description: String
}

class SecondViewController: UIViewController {
    @IBOutlet weak var LastField: UILabel!
    var textOfLabel: String = ""
    @IBOutlet weak var LogoImage: UIImageView!
    @IBOutlet weak var DescribeField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/\(textOfLabel).jpg")
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.LogoImage.image = UIImage(data: data!)
            }
        }
        LastField!.text = textOfLabel
       
                    let sourceURL = "https://raw.githubusercontent.com/techparkios/ios-lectures-fall-2018/master/06/\(textOfLabel).json"
        
        guard let urlJson = URL(string: sourceURL)else{return}
        
        DispatchQueue.global().async {
            
        
        URLSession.shared.dataTask(with: urlJson) { (data2, responce, error) in
            guard let data2 = data2 else {return}
            guard error == nil else{return}
        
        do{
        let jsonResult = try JSONDecoder().decode(Anim.self, from: data2)
            DispatchQueue.main.async {
                // Update UI
            
            self.LastField.text = jsonResult.name
                self.DescribeField.text = "\(jsonResult.type) \n Количество эпизодов:\(jsonResult.episodes) \n Длительность эпизода:\(jsonResult.episode_length) \n Описание: \n \(jsonResult.description)"}
        } catch let error {
            print(error)
        }
        }.resume()
        }
        DescribeField?.text = "Здесь должно быть описание"
        
        
        //[[UIImageView alloc] initWithImage:bgImage];
        //backgroundImageView.frame = [[UIScreen mainScreen] bounds];
        // Do any additional setup after loading the view.
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
