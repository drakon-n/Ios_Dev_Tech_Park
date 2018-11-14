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
        self.backgroundColor = UIColor.green
    }
    
    

}
