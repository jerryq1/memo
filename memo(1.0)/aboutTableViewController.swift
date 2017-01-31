//
//  aboutTableViewController.swift
//  memo(1.0)
//
//  Created by jerry on 17/1/24.
//  Copyright © 2017年 jerry. All rights reserved.
//

import UIKit


class aboutTableViewController: UITableViewController {
    
    var sectionTitle = ["评分和反馈","关注我"]
    var sectionContent = [["在App Stroe上给我评分","反馈意见"],["网站","微信"]]
    var links = ["http://www.baidu.com","http://www.qq.com","http://www.2345.com"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("aboutCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = sectionContent[indexPath.section][indexPath.row]
        // Configure the cell...
        

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.section{
        //Safari跳转
//        case 0:
//            if indexPath.row == 0{
//                if let url = NSURL(string: "http://www.baidu.com"){
//                    UIApplication.sharedApplication().openURL(url)
//                }
//                
//            }
        //WebView跳转
        case 1:
            if indexPath.row == 1{
                performSegueWithIdentifier("goWeb", sender: self)
            }
        //SFSafariViewController跳转
//        case 2:
//            if let url = NSURL(string: "http://www.baidu.com"){
//                let sfVC = SFSafariViewController(URL: url, entersReaderIfAvailable: true)
//                presentViewController(sfVC, animated: true, completion: nil)
//            }
        default:break
            }
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
