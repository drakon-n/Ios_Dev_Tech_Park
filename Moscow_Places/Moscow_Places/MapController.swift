//
//  MapController.swift
//  Moscow_Places
//
//  Created by Влад on 12/12/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit
import MapKit

class MapController: UIViewController, MKMapViewDelegate {
    var text: String = ""

    @IBOutlet weak var locationMap: MKMapView!
    override func viewDidLoad() {
        locationMap.delegate = self
        let sourceLocation = CLLocationCoordinate2D(latitude: 55.75370, longitude: 37.61981) //показывает координаты красной площади, скоро допилю jsonы и будет показывать координаты локации
        let sourcePlacemark = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
       let sourceAnnotation = MKPointAnnotation()
        sourceAnnotation.title = text
        if let location = sourcePlacemark.location {
            sourceAnnotation.coordinate = location.coordinate
        }
        print("\(sourceAnnotation.title ?? "error")")
        self.locationMap.showAnnotations([sourceAnnotation], animated: true )
        super.viewDidLoad()

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
