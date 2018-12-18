//
//  EventController.swift
//  Moscow_Places
//
//  Created by Влад on 18/12/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit

class EventController: UIViewController {

    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventDescription: UITextView!
    var eventNumber = 0
    let eventQuantity = (doneResult?.results.count ?? 1) - 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventTitle.text = doneResult?.results[eventNumber].title
        eventImage.kf.setImage(with: URL(string: (doneResult?.results[eventNumber].images[0].image)!))
        eventDescription.text = doneResult?.results[eventNumber].body_text
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(leftslide))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(rightslide))
        swipeDown.direction = .left
        self.view.addGestureRecognizer(swipeDown)
    }
    

    
    @objc func leftslide(_ sender: UISwipeGestureRecognizer){
        if(eventNumber>0){
        eventNumber = eventNumber - 1
        eventTitle.text = doneResult?.results[eventNumber].title
        eventImage.kf.setImage(with: URL(string: (doneResult?.results[eventNumber].images[0].image)!))
        eventDescription.text = doneResult?.results[eventNumber].body_text
        }
    }
    @objc func rightslide(_ sender: UISwipeGestureRecognizer){
        if(eventNumber<eventQuantity){
            eventNumber = eventNumber + 1
            eventTitle.text = doneResult?.results[eventNumber].title
            eventImage.kf.setImage(with: URL(string: (doneResult?.results[eventNumber].images[0].image)!))
            eventDescription.text = doneResult?.results[eventNumber].body_text
        }
    }
}
