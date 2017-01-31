//
//  memoTableViewCell.swift
//  memo(1.0)
//
//  Created by jerry on 16/11/6.
//  Copyright © 2016年 jerry. All rights reserved.
//

import UIKit
import CoreData

class memoTableViewCell: UITableViewCell {


    
    @IBOutlet weak var 收藏按钮: UIButton!
    @IBOutlet weak var Label2: UILabel!
    
    @IBOutlet weak var 完成按钮: UIButton!

    
 
//    @IBAction func 改变图表背景(sender: UIButton) {
//        
//        
//        sender.selected = !sender.selected
//    }
    
//    @IBOutlet weak var cellButton: UIButton!
    
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        self.contentView.backgroundColor = UIColor.clearColor()
        self.backgroundColor = UIColor.clearColor()
        
        backView.backgroundColor = UIColor(white: 1, alpha: 0.5)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
