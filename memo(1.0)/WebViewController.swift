//
//  WebViewController.swift
//  memo(1.0)
//
//  Created by jerry on 17/1/26.
//  Copyright © 2017年 jerry. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var Web: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Web.loadRequest(NSURLRequest(URL: NSURL(string: "http://www.baidu.com")!))

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
