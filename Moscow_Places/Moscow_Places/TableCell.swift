//
//  TableCell.swift
//  Moscow_Places
//
//  Created by Влад on 14/11/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit
import Kingfisher

class TableCell: UITableViewCell {
    
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var PlaceImage: UIImageView!
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.backgroundColor = #colorLiteral(red: 0.09432386607, green: 0.1339568198, blue: 0.1721197665, alpha: 1)
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func fillCell(with model: CellModel) {
        Title.text = model.title
        let url = URL(string: model.image ?? "https://raw.githubusercontent.com/drakon-n/Ios_Dev_Tech_Park/master/Moscow_Places/Images/error.jpg")
        PlaceImage.kf.setImage(with: url)
    }
    
}
