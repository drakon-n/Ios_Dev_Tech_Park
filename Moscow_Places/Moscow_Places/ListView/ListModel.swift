//
//  ListModel.swift
//  Moscow_Places
//
//  Created by Влад on 21/11/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import Foundation
struct location {
    let long: Double
    let width: Double
}
struct listArr:Codable{
    struct list:Codable{
        let name: String
        let cellname: String
        let image: String
    }
    let places:[list]
}
struct place:Codable{
    let title:String
    let image:String
    let description:String
    let longitude: Double
    let latitude: Double
}
