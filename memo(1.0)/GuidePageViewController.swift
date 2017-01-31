 //
//  GuidePageViewController.swift
//  memo(1.0)
//
//  Created by jerry on 17/1/15.
//  Copyright © 2017年 jerry. All rights reserved.
//

import UIKit

class GuidePageViewController: UIPageViewController,UIPageViewControllerDataSource {

    var headings = ["私人定制","餐馆定位","美食发现"]
    var images = ["foodpin-intro-1","foodpin-intro-2","foodpin-intro-3"]
    var footers = ["somethingInteresting","hello","queen"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //设置数据源为自身
        dataSource = self
        
        //创建第一个页面
        if let startingVC = viewControllerAtIndex(0){
            setViewControllers([startingVC], direction: .Reverse, animated: false
                , completion: nil)
        }
    }
//UIPageViewControllerDateSource协议提供2个方法来支持标准的页码：
    
//    //要显示的页数
//    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
//        return headings.count
//    }
//    
//    //起始页的索引
//    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
//        return 0
//    }
//代码指令的默认指示器添加虽然方便，但位置和颜色都无法调整。
//所以注释不要用控件定制重做来取代
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! GuideContentViewController).index
        
        index++
        
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! GuideContentViewController).index
        
        index--
        
        return viewControllerAtIndex(index)
    }
    
    func viewControllerAtIndex(index:Int) -> GuideContentViewController?{
        
        //判断index是否在合理的区间(即0到2)Swift2的if case语句
        if case 0 ..< headings.count = index{
            
            //使用instantiateViewControllerWithIdentifier方法来初始化一个有storyboard ID的控制器。
            //因为此方法可能会失败，所以用安全下转(as?)并做可选绑定。如果成功，则传递相应的数据。
            
            if let contentVC = storyboard?.instantiateViewControllerWithIdentifier("GuideContentController") as? GuideContentViewController{
                contentVC.imageName = images[index]
                contentVC.heading = headings[index]
                contentVC.footer = footers[index]
                contentVC.index = index
                
                return contentVC
            }
            
        }
        return nil
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
