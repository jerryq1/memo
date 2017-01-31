//
//  homePage.swift
//  memo(1.0)
//
//  Created by jerry on 16/11/6.
//  Copyright © 2016年 jerry. All rights reserved.
//

import UIKit

class homePage: UIViewController {

    @IBOutlet weak var homePageBackImage: UIImageView!

    @IBOutlet weak var homePageButton1: UIButton!
    
    @IBOutlet weak var homePageButton2: UIButton!
    
    @IBOutlet weak var homePageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //让按钮加入图片并且设置圆角
        homePageButton1.layer.cornerRadius = 33
        
        homePageButton1.layer.masksToBounds = true
        
        homePageButton1.setImage(UIImage(named: "怪兽"), forState: .Normal
        )
        
        homePageButton2.layer.cornerRadius = 33
        
        homePageButton2.layer.masksToBounds = true
        
        homePageButton2.setImage(UIImage(named: "怪兽"), forState: .Normal
        )
        
        homePageLabel.backgroundColor = UIColor.clearColor()
        
        
        //设置背景
        self.homePageBackImage.image = UIImage(named: "星空2")
        
        //首先创建一个模糊效果
        let blurEffect = UIBlurEffect(style: .Dark)
        //接着创建一个承载模糊效果的视图
        let blurView = UIVisualEffectView(effect: blurEffect)
        //设置模糊视图的大小（全屏）
        blurView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        //添加模糊视图到页面view上（模糊视图下方都会有模糊效果）
        self.homePageBackImage.addSubview(blurView)
        
    }
    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        if let pageVC = storyboard?.instantiateViewControllerWithIdentifier("GuideController") as? GuidePageViewController{
//            presentViewController(pageVC, animated: true, completion: nil)
//        }
//    }
    
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
    @IBAction func 返回主菜单(segue:UIStoryboardSegue){
        
    }
}
