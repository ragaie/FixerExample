//
//  ListViewCell.swift
//  fixer-io
//
//  Created by Ragaie alfy on 11/22/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit
//cell id --> cellID
class ListViewCell: UITableViewCell {

    
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    @IBOutlet weak var fromLabel: UILabel!
    
    @IBOutlet weak var toLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setData(item : ConvertItem){
        
        dateLabel.text = item.date ?? ""
        fromLabel.text = item.from_Count  + "  " + item.from
        toLabel.text   = item.to_Count + "  " + item.to
        
        
        
    }

}
