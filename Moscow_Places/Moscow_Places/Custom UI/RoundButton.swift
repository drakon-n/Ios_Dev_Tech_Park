//
//  RoundButton.swift
//  Moscow_Places
//
//  Created by Влад on 14/11/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit

class RoundButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = self.frame.size.width / 2
        self.layer.masksToBounds = true
        self.backgroundColor = #colorLiteral(red: 0.4996578097, green: 0.6304417253, blue: 0.7095039487, alpha: 1)
    }
    
    

}
