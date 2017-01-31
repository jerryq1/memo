//
//  ScrollerViewController.swift
//  memo(1.0)
//
//  Created by jerry on 17/1/16.
//  Copyright © 2017年 jerry. All rights reserved.
//

import UIKit

class ScrollerViewController: UIViewController,UIScrollViewDelegate {

    
    let pageControl = UIPageControl()
    var numOfPages = 4
    //scrollView的初始化
    let scrollView = UIScrollView()
    let Btn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //pageContrller位置设定
        pageControl.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height-30)
        //当前颜色
        pageControl.currentPageIndicatorTintColor = UIColor.blueColor()
        //其余页码标点颜色
        pageControl.pageIndicatorTintColor = UIColor.whiteColor()
        //标点数
        pageControl.numberOfPages = 4
        //滑动相应动作
        pageControl.addTarget(self, action: "scrollViewDidScroll", forControlEvents: UIControlEvents.ValueChanged)
        
        
        
        
        let frame = self.view.bounds
        //scrollView的框架大小等于当前控制器视图的边界大小
        scrollView.frame = self.view.bounds
        scrollView.delegate = self
        
        //为了能让内容横向滚动，设置横向内容宽度为3个页面的宽度总和
        scrollView.contentSize = CGSize(width: frame.size.width*CGFloat(numOfPages), height: frame.size.height)
        print("\(frame.size.width*CGFloat(numOfPages)),\(frame.size.height)")
        //pagingEnabled 是否自动滚动到subView边界
        scrollView.pagingEnabled = true
        //bounces 默认是YES，就是滚动超过边界会反弹，即有反弹回来的效果。若是NO，则滚动到达边界会立刻停止
        scrollView.bounces = true
        //滚动时是否显示水平滚动条
        scrollView.showsHorizontalScrollIndicator = false
        //滚动时是否显示垂直滚动条
        scrollView.showsVerticalScrollIndicator = false
        //是否可控制控件滚动到顶部
        scrollView.scrollsToTop = false
        scrollView.contentOffset = CGPoint.zero
        self.view.addSubview(scrollView)
        
        for i in 0..<numOfPages{
            let image = UIImage(named: "Welcome\(i+1)")
            let imageView = UIImageView(image: image)
            
            //框架大小为控制器视图大小,滑动范围为x轴方向i个控制器视图大小
            imageView.frame = CGRect(x: frame.size.width*CGFloat(i), y: CGFloat(0), width: frame.size.width, height: frame.size.height)
            scrollView.addSubview(imageView)
            self.view.addSubview(pageControl)
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    //scrollview滚动的时候就会调用
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x/self.view.frame.size.width)
        print("scrolled:\(scrollView.contentOffset)")
        pageControl.currentPage = index
        
        //添加Btn
        if index == 3{
            //理解UIView的空间坐标系,原点在左上角x轴向右，y轴向下
            self.Btn.frame = CGRect(x: 3*self.view.frame.width, y: self.view.frame.height, width: self.view.frame.width, height: 50)
            self.Btn.setTitle("开启Swift之旅", forState: UIControlState.Normal)
            self.Btn.titleLabel?.font = UIFont.systemFontOfSize(20.0)
            self.Btn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
            self.Btn.backgroundColor = UIColor.orangeColor()
            self.Btn.alpha = 0
            self.Btn.addTarget(self, action: "BtnClick:", forControlEvents: .TouchUpInside)
            UIView.animateWithDuration(1.5, delay: 0.5, options: .CurveEaseIn, animations: {() -> Void in
                self.Btn.frame = CGRect(x: 3*self.view.frame.width, y: self.view.frame.height-100, width: self.view.frame.width, height: 50)
                self.Btn.alpha = 1
                self.scrollView.addSubview(self.Btn)
                }, completion: nil)
            
        }
        
 
        
       
        
//        直接滑动不需要点击，注释UIPageControl和UIButton，并解除这段注释即可
//        let twidth = CGFloat(numOfPages-1)*self.view.frame.size.width
//        //如果在最后一个页面继续滑动的话就会跳转主页面
//        if(scrollView.contentOffset.x > twidth){
//            let mainStoryboard = UIStoryboard(name:"Main", bundle:nil)
//            let homePage = mainStoryboard.instantiateViewControllerWithIdentifier("homePage1")
//            self.presentViewController(homePage, animated: false, completion: nil)
//        }
        }
    
    func BtnClick(button:UIButton){
        let mainStoryboard = UIStoryboard(name:"Main", bundle:nil)
        let homePage = mainStoryboard.instantiateViewControllerWithIdentifier("homePage1")
        self.presentViewController(homePage, animated: false, completion: nil)
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
