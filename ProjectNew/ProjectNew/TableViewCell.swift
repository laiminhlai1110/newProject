//
//  TableViewCell.swift
//  ProjectNew
//
//  Created by Lai Minh on 6/9/19.
//  Copyright © 2019 LaiMinh. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var lblHOTEN: UILabel!
    
    @IBOutlet weak var lblNAMSINH: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
