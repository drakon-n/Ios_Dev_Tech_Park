//
//  WelcomeViewController.swift
//  Moscow_Places
//
//  Created by Влад on 07/11/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBAction func AppInfo(_ sender: Any) {
        let alertController = UIAlertController(title: "О приложении", message: "Добро пожаловать в Moscow Places! Мы постарались собрать для вас лучшие местечки Москвы, где каждый найдет себе что-нибудь по вкусу. Желаем приятного пользования и новых впечатлений!", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Ок", style: .default) { (action:UIAlertAction) in
            print("You've pressed default");
        }
        alertController.addAction(action1)
        
        
        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func StartTouch(_ sender: Any)
    {
        
    }
    override func viewDidLoad()
    {   getApiData()
        
        

        super.viewDidLoad()
    }
    
}
