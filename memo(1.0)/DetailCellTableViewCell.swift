//
//  DetailCellTableViewCell.swift
//  memo(1.0)
//
//  Created by jerry on 16/12/4.
//  Copyright © 2016年 jerry. All rights reserved.
//

import UIKit

class DetailCellTableViewCell: UITableViewCell {

    @IBOutlet weak var detailkey: UILabel!
    @IBOutlet weak var detailValue: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
