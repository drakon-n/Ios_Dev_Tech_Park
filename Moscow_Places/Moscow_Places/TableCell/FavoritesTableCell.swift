//
//  FavoritesTableCell.swift
//  Moscow_Places
//
//  Created by Влад on 19/12/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit

class FavoritesTableCell: UITableViewCell {
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var PlaceLogo: UIImageView!
    
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
    
    func fillCell(with model: FavoriteCellModel) {
        Title.text = model.title
        PlaceLogo.image = model.image
    }

    
}
