//
//  memoTableViewController.swift
//  memo(1.0)
//
//  Created by jerry on 16/11/8.
//  Copyright © 2016年 jerry. All rights reserved.
//

import UIKit
import CoreData
import AudioToolbox

class memoTableViewController: UITableViewController,NSFetchedResultsControllerDelegate,UITextFieldDelegate{
    

    
    
    //实体数据子类实例
    var tst:ThingsType!
    
    //实体数据子类实例模型数组
    var tsts:[ThingsType] = []
    
    var frc:NSFetchedResultsController!
    
    var buttonTag:Int!

    @IBOutlet weak var 静态栏: UIView!
    
    @IBOutlet weak var 静态栏子视图: UIView!
    
    @IBOutlet weak var 添加按钮: UIBarButtonItem!
    
    @IBOutlet weak var 静态栏子视图图片: UIImageView!
    
    @IBOutlet weak var 静态栏textField: UITextField!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        
        
        添加memo(添加按钮)
        
        return true
    }

   
    
    
    //clear按键
    func textFieldShouldClear(textField: UITextField) -> Bool {
        
        NSLog("textFieldShouldClear")
        
        return true
    }
    
    @IBAction func 添加memo(sender: UIBarButtonItem) {
        
        //保存数据
        
        //Application(应用),managedObjectContext(托管缓冲区)
        let moc = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
        
        tst = NSEntityDescription.insertNewObjectForEntityForName("ThingsType", inManagedObjectContext: moc!) as! ThingsType
        
        tst.thing = 静态栏textField.text!
        tst.isImport = false
        tst.isDone = false
        tst.detailThing = ""
        
        
        do{
            try moc?.save()
        }catch{
            print(error)
            return
        }
        
        
        静态栏textField.resignFirstResponder()
        //清空静态栏textField
        静态栏textField.text = ""
        tableView.reloadData()
        
        
    }
    
    @IBAction func 取消键盘(sender: AnyObject) {
        静态栏textField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //memoTableView背景
        self.tableView.backgroundColor = UIColor.clearColor()
        let imgback = UIImage(named:"星空")
        let imgbackV = UIImageView(image: imgback)
        self.tableView.backgroundView = imgbackV
        

        
        
        //静态栏透明效果美化
        静态栏.backgroundColor = UIColor.clearColor()
        静态栏子视图.backgroundColor = UIColor(white: 1, alpha: 0.5)
        
        //去除单元格分隔线
        self.tableView!.separatorStyle = .None
        
        self.clearsSelectionOnViewWillAppear = true
        
        静态栏子视图图片.image = UIImage(named: "添加")
        
        静态栏textField.delegate = self
        静态栏textField.clearButtonMode = .WhileEditing
        静态栏textField.placeholder = "添加小任务..."
        
        取回数据()

      
        
    }
    
//    //添加手势到tableview
//    
//    func 添加手势(){
//    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "keyBoardHide:")
//    self.tableView.addGestureRecognizer(tapGestureRecognizer)
//    }
//        //使用手势触发隐藏键盘
//    func keyBoardHide(sender:UITapGestureRecognizer){
//        静态栏textField.resignFirstResponder()
//    }
    
//    是否执行添加手势
    


    
    func 取回数据(){
        
        //取回数据
        let request = NSFetchRequest(entityName: "ThingsType")
        
        //指定取回数据结果如何排序,ascending升降序
        let sd = NSSortDescriptor(key: "isImport", ascending: false)
        request.sortDescriptors = [sd]
        
        let moc = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
        frc = NSFetchedResultsController(fetchRequest: request, managedObjectContext: moc!, sectionNameKeyPath: nil, cacheName: nil)
        frc.delegate = self
        
        do{
            try frc.performFetch()
            tsts = frc.fetchedObjects as! [ThingsType]
        }catch{
            print(error)
        }
        
    }
    
    /*当数据库内容发生变化时，NSFetchedResultsControllerDelegate协议的以下方法会被调用:
    
    //当控制器开始处理内容变化时
    controllerWillChangeContent(_:)
    
    //内容发生变更时
    controller(_:didChangeObject:atIndexPath:forChangeType:newIndexPath:)
    
    //当控制器已经处理完内容变更时
    controllerDidChangeContenet(_:)
    */
    
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type{
        case.Insert:
            if let _newIndexPath = newIndexPath{
                tableView.insertRowsAtIndexPaths([_newIndexPath], withRowAnimation: .Automatic)
            }
        case.Delete:
            if let _indexPath = indexPath{
                tableView.deleteRowsAtIndexPaths([_indexPath], withRowAnimation: .Automatic)
            }
        case.Update:
            if let _indexPath = indexPath{
                tableView.reloadRowsAtIndexPaths([_indexPath], withRowAnimation: .Automatic)
            }
        default:
            tableView.reloadData()
        }
            tsts = controller.fetchedObjects as! [ThingsType]
    }
    
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let 删除行为 = UITableViewRowAction(style: .Default
            , title: "删除") { (action, IndexPath) -> Void in
                let moc = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
                
                let tststoDel = self.frc.objectAtIndexPath(indexPath) as! ThingsType
                
                moc?.deleteObject(tststoDel)
                
                do{
                    try moc?.save()
                }catch{
                    print(error)
                }
                
                tableView.reloadData()
        }
        let 编辑行为 = UITableViewRowAction(style: .Normal, title: "编辑") { (action, indexPath) -> Void in
            
//            let detailView = DetailViewController()
//            
//            self.presentViewController(detailView, animated: true, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
//            
//            
//            self.performSegueWithIdentifier("showDetail", sender: self)
        }
        
        
        return [删除行为,编辑行为]
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tsts.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        /*
        不加此句时，在二级栏目点击返回时，此行会由选中状态慢慢变成非选中状态。
        加上此句，返回时直接就是非选中状态。
        */
        self.tableView!.deselectRowAtIndexPath(indexPath, animated: true)
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as!
        memoTableViewCell
        
        cell.Label2.text = tsts[indexPath.row].thing
        if tsts[indexPath.row].isImport == false{
            cell.收藏按钮.setImage(UIImage(named: "皇冠反"), forState: .Normal)
        }else{
            cell.收藏按钮.setImage(UIImage(named: "皇冠正"), forState: .Normal)
        }
        
        //使触摸模式下按钮也不会变暗（半透明）
        cell.收藏按钮.adjustsImageWhenHighlighted = false
        cell.收藏按钮.tag = indexPath.row
        cell.收藏按钮.addTarget(self, action: "onClickBtn1:", forControlEvents: .TouchUpInside)
        cell.收藏按钮.imageEdgeInsets = UIEdgeInsetsMake(19, 8, 19, 8)
        
        
        
        if tsts[indexPath.row].isDone == false{
            cell.完成按钮.setImage(UIImage(named: "未打勾"), forState: .Normal)
        }else{
            cell.完成按钮.setImage(UIImage(named: "打勾"), forState: .Normal)
        }
        cell.完成按钮.adjustsImageWhenHighlighted = false //使触摸模式下按钮也不会变暗（半透明）
        cell.完成按钮.tag = indexPath.row
        cell.完成按钮.addTarget(self, action: "onClickBtn:", forControlEvents: .TouchUpInside)
        //cell.完成按钮.imageView?.contentMode = .ScaleAspectFit
        //限制button里面图片的大小
        cell.完成按钮.imageEdgeInsets = UIEdgeInsetsMake(19, 8, 19, 8)
        //透明框效果
        cell.selectedBackgroundView = UITableView()
        cell.selectedBackgroundView?.backgroundColor =
            UIColor.clearColor()
        
        
        // Configure the cell...

        return cell
    }
    
    func onClickBtn(sender:UIButton){
        
        let moc = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
        

        
        if tsts[sender.tag].isDone == false {
            tsts[sender.tag].isDone = true
        }else if tsts[sender.tag].isDone == true{
            tsts[sender.tag].isDone
                = false
        }
        
        //建立的SystemSoundID对象,点击音效
        let soundID:SystemSoundID = 1109
        
        
        AudioServicesPlaySystemSound(soundID)

        print(sender.tag)

        
    
   
    
    
    do{
    try moc?.save()
    }catch{
    print(error)
    }
    
    //刷新相应行的数据
        let indexPath = NSIndexPath(forRow: sender.tag, inSection: 0)
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    func onClickBtn1(sender:UIButton){
        
        let moc = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
        
        
        
        if tsts[sender.tag].isImport == false {
            tsts[sender.tag].isImport  = true
            
            
            
            let 当前行数据 = tsts[sender.tag]
            
            tsts.removeAtIndex(sender.tag)

            
            tsts.append(当前行数据)
        }else if tsts[sender.tag].isImport  == true{
            tsts[sender.tag].isImport
                = false

        }
        
        
        
        
        print(sender.tag)
        
        
        
        
        
        
        do{
            try moc?.save()
        }catch{
            print(error)
        }
        
//        //刷新相应行的数据
//        let indexPath = NSIndexPath(forRow: sender.tag, inSection: 0)
//        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        tableView.reloadData()
    }
    
    
    @IBAction func 返回备忘录(segue:UIStoryboardSegue){
        
    }
    
   
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do no
    ath: NSIndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        //指定转场传送
        if segue.identifier == "showDetail"{
            
            //传值指令；destinationViewController as! DetailViewController代表self传值到DetailViewController
            let detailVC = segue.destinationViewController as! DetailViewController
            //传值数据
                detailVC.tst = tsts[(tableView.indexPathForSelectedRow?.row)!]
            
                detailVC.tsts = self.tsts
            
                let number = tableView.indexPathForSelectedRow!.row as Int
            
                detailVC.indexNumber = number
            //转场后隐藏标签栏
            detailVC.hidesBottomBarWhenPushed = true
            
            print(number)
    }
    
    }
    

}
