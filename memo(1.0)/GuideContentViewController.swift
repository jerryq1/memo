//
//  GuideContentViewController.swift
//  memo(1.0)
//
//  Created by jerry on 17/1/15.
//  Copyright © 2017年 jerry. All rights reserved.
//

import UIKit

class GuideContentViewController: UIViewController {

    @IBOutlet weak var labelHeading: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var labelFooter: UILabel!
    
    @IBOutlet weak var pageControl: UIPageControl!

    @IBOutlet weak var Btn: UIButton!
    
    @IBAction func Btntapped(sender: UIButton) {
    }
    
    
    var index = 0
    var heading = ""
    var footer = ""
    var imageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelHeading.text = heading
        labelFooter.text = footer
        imageView.image = UIImage(named: imageName)
        pageControl.currentPage = index
        
        
        //当是第三个引导页的时候，按钮才显示
        if index == 2{
        Btn.hidden = false
        Btn.setTitle("马上体验", forState: .Normal)
        Btn.layer.cornerRadius = 5
        Btn.layer.borderColor = UIColor.blueColor().CGColor
        Btn.layer.borderWidth = 0.2
        Btn.layer.masksToBounds = true
        }else{
            Btn.hidden = true
        }

        // Do any additional setup after loading the view.
        
        
      
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
