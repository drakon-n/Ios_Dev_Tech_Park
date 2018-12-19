//
//  KudaGoApi.swift
//  Moscow_Places
//
//  Created by Влад on 17/12/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import Foundation
struct apiResult:Codable{  //Непосредственно информация о событии
    let title:String
    let body_text: String
    let images: [imageInfo]
    let site_url: String
}
struct sourseInfo:Codable{ //Информация об источнике картинки
    let name:String
    let link:String
}
struct imageInfo:Codable{  //Вся информация о картинке
    let image:String
}
struct event:Codable{
    let results:[apiResult]
}
let timestapDate = NSDate().timeIntervalSince1970
let apiRequestUrl = URL(string: "https://kudago.com/public-api/v1.4/events/?page_size=30&fields=title,body_text,images,site_url&text_format=text&location=msk&actual_since=\(timestapDate)&actual_until=\(timestapDate+604800)")
var doneResult:event? = nil
var isApiReady = false
func getApiData(){
    DispatchQueue.global().async {
        URLSession.shared.dataTask(with: apiRequestUrl!){(data, responce, error) in
            guard let data = data else{return}
            guard error == nil else {return}
            do {
            let jsonResult = try JSONDecoder().decode(event.self, from:data )
                DispatchQueue.main.async {
               doneResult = jsonResult
                    isApiReady = true
                }
            }catch let error{print(error)}
            }.resume()}
}
