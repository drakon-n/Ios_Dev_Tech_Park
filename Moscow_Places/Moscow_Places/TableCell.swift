//
//  TableCell.swift
//  Moscow_Places
//
//  Created by Влад on 14/11/2018.
//  Copyright © 2018 Влад. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
    
    @IBOutlet weak var Title: UILabel!
    required init?(coder aDecoder: NSCoder)
    {   super.init(coder: aDecoder)
       
       self.backgroundColor = #colorLiteral(red: 0.09432386607, green: 0.1339568198, blue: 0.1721197665, alpha: 1)
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func fillCell(with model: CellModel) {
        Title.text = model.title
    }
    
}
