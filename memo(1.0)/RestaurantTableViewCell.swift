//
//  RestaurantTableViewCell.swift
//  memo(1.0)
//
//  Created by jerry on 16/11/30.
//  Copyright © 2016年 jerry. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {


    
    @IBOutlet weak var restaurantView: UIImageView!
    
    @IBOutlet weak var restaurantName: UILabel!
    
    @IBOutlet weak var restaurantLocation: UILabel!
    
    @IBOutlet weak var restaurantType: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
