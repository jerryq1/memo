//
//  DetailViewController.swift
//  memo(1.0)
//
//  Created by jerry on 16/11/23.
//  Copyright © 2016年 jerry. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var tsts:[ThingsType]!
    
    var tst:ThingsType!
    
    var indexNumber:Int!
    
    @IBOutlet weak var DetailTextField: UITextField!
    

    @IBOutlet weak var DetailThing: UITextView!
    
    @IBAction func 保存按钮(sender: AnyObject) {
        
        let moc = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
        
        tsts[indexNumber].detailThing = DetailThing.text
        tsts[indexNumber].thing = DetailTextField.text!
        
        do{
            try moc?.save()
        }catch{
            print(error)
        }
        
        performSegueWithIdentifier("fanhui1", sender: sender)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DetailTextField.text = tst.thing
        DetailThing.text = tst.detailThing
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
