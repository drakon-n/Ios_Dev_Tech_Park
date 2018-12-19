//
//  PlaceViewController.swift
//  Moscow_Places
//
//  Created by Влад on 21/11/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation

class PlaceViewController: UIViewController, CLLocationManagerDelegate{
    var identifier: String = ""
    var inBase = false
    var inBaseNumber = 0
    
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var favoriteStar: UIButton!
    @IBOutlet weak var mapButton: RoundButton!
    @IBOutlet weak var placeLogo: UIImageView!
    @IBOutlet weak var placeDescription: UITextView!
    var locationManager: CLLocationManager = CLLocationManager()
    var loc:location = location(long: 0.0, width: 0.0)
    var favorite = false
    @IBAction func tapFarorite(_ sender: UIButton) {
        if(favorite){
            favorite = false
            UserDefaults.standard.set(favorite, forKey: identifier)
            favoriteStar.setImage(UIImage(named: "icons8-star"), for: UIControl.State.normal)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            context.delete(placeData[inBaseNumber])
            do{
                try context.save()
                placeData.remove(at: inBaseNumber)
            } catch let error as NSError {
                print("Failed to save \(error)")
            }
            }
        else{
            favorite = true
            favoriteStar.setImage(UIImage(named: "icons8-star_filled"), for: UIControl.State.normal)
            
            UserDefaults.standard.set(favorite, forKey: identifier)
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Place", in: context)
            let newPlace = NSManagedObject(entity: entity!, insertInto: context)
            newPlace.setValue(self.placeName.text, forKey: "title")
            newPlace.setValue(self.placeDescription.text, forKey: "decription")
            newPlace.setValue(loc.long, forKey: "longtitude")
            newPlace.setValue(loc.width, forKey: "latitude")
            newPlace.setValue(identifier, forKey: "identifier")
            let imageData = placeLogo.image?.pngData()
            newPlace.setValue(imageData, forKey: "image")
            do{
                try context.save()
                placeData.append(newPlace)
            } catch let error as NSError {
                print("Failed to save \(error)")
            }
            
            
        }
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        mapButton.alpha = 0
        favoriteStar.alpha = 0
     locationManager.delegate = self
        if(inBase){
            placeLogo.image = UIImage(data: placeData[inBaseNumber].value(forKey: "image") as! Data)
            placeName.text = placeData[inBaseNumber].value(forKey: "title") as? String
            placeDescription.text = placeData[inBaseNumber].value(forKey: "decription") as? String
            loc = location(long: placeData[inBaseNumber].value(forKey: "longtitude") as! Double, width: placeData[inBaseNumber].value(forKey: "latitude") as! Double)
            mapButton.alpha = 1
            favoriteStar.alpha = 1
            let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(rightslide))
            swipeRight.direction = .right
            self.view.addGestureRecognizer(swipeRight)
            
            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(leftslide))
            swipeLeft.direction = .left
            self.view.addGestureRecognizer(swipeLeft)
            
            
        }
        else{
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
                        self.loc = location(long: jsonResult.longitude, width: jsonResult.latitude)
                        self.mapButton.alpha = 1
                        self.favoriteStar.alpha = 1
                    }
                
                }   catch let error{
                        print(error)
                    }
            }.resume()
            }
            
        }
 
    }
    

    override func viewWillAppear(_ animated: Bool) {
        favorite = UserDefaults.standard.bool(forKey: identifier)
        if(favorite){
            favoriteStar.setImage(UIImage(named: "icons8-star_filled"), for: UIControl.State.normal)
        }
        else{
            favoriteStar.setImage(UIImage(named: "icons8-star"), for: UIControl.State.normal)}
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?)
    {
        let finishResult = segue.destination as? MapController
        
        finishResult?.text = "\(placeName.text ?? "ошибка")"
        finishResult?.selfLoc = location(long: loc.long, width: loc.width)
    }
    
    @objc func rightslide(_ sender: UISwipeGestureRecognizer){
        if(inBaseNumber>0){
            inBaseNumber = inBaseNumber - 1
            placeLogo.image = UIImage(data: placeData[inBaseNumber].value(forKey: "image") as! Data)
            placeName.text = placeData[inBaseNumber].value(forKey: "title") as? String
            placeDescription.text = placeData[inBaseNumber].value(forKey: "decription") as? String
            loc = location(long: placeData[inBaseNumber].value(forKey: "longtitude") as! Double, width: placeData[inBaseNumber].value(forKey: "latitude") as! Double)
            
        }
    }
    @objc func leftslide(_ sender: UISwipeGestureRecognizer){
        if(inBaseNumber<(placeData.count-1)){
            inBaseNumber = inBaseNumber + 1
            placeLogo.image = UIImage(data: placeData[inBaseNumber].value(forKey: "image") as! Data)
            placeName.text = placeData[inBaseNumber].value(forKey: "title") as? String
            placeDescription.text = placeData[inBaseNumber].value(forKey: "decription") as? String
            loc = location(long: placeData[inBaseNumber].value(forKey: "longtitude") as! Double, width: placeData[inBaseNumber].value(forKey: "latitude") as! Double)
        }
    }
}
