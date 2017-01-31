//
//  reviewViewController.swift
//  memo(1.0)
//
//  Created by jerry on 16/12/13.
//  Copyright © 2016年 jerry. All rights reserved.
//

import UIKit


class reviewViewController: UIViewController {
    
//    var restaurants:[Restaurant]
    
//    var restaurant:Restaurant!
    
    var rating:String!
    
//    var indexNumberReview:Int?

    @IBOutlet weak var backGroundImage: UIImageView!
    
    @IBOutlet weak var rantingStackView: UIStackView!
    
    @IBAction func rantingBtnTapper(sender: UIButton) {
        

        switch sender.tag{
        case 100:
            rating = "dislike"

        case 200:
            rating = "good"

        case 300:
            rating = "great"

        default:break
        }

        performSegueWithIdentifier("unwindToRestaurantDeatil", sender: sender)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建毛玻璃图层
        let blurEffectView = UIVisualEffectView(effect:UIBlurEffect(style: .Light))
        //设定毛玻璃图层的大小
        blurEffectView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        //将毛玻璃涂层覆盖到背景图片上
        backGroundImage.addSubview(blurEffectView)
        //设置图片缩放到最小
        rantingStackView.transform = CGAffineTransformMakeScale(0, 0)

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {self.rantingStackView.transform = CGAffineTransformIdentity}, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
    }


}
