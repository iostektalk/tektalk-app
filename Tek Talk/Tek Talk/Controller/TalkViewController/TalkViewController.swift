//
//  TalkViewController.swift
//  Tek Talk
//
//  Created by minhthong on 5/20/16.
//  Copyright © 2016 Zyncas. All rights reserved.
//

import Foundation
import UIKit
import Parse
class TalkViewController: BaseViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView?
    
    var heightCell:CGFloat = {
        return 147
    }()
    
    var talksData: NSMutableArray = {
       return NSMutableArray()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let filePath = NSBundle.mainBundle().pathForResource("Video", ofType: "json")
        let fileData = NSData.init(contentsOfFile: filePath!)
        do {
            let json =  try NSJSONSerialization.JSONObjectWithData(fileData!, options: .AllowFragments) as! NSDictionary
            for obj in json["results"] as! NSArray  {
                let talkModel = TalkModel().talkModelWithData(obj as! NSDictionary)
                self.talksData.addObject(talkModel)
            }
        } catch {
            
        }
       
        self.tableView?.registerClass(TalkCell.self, forCellReuseIdentifier: "TalkCell");
        self.tableView?.registerNib(UINib.init(nibName: "TalkCell", bundle: nil), forCellReuseIdentifier: "TalkCell")
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "TALKS"
    }
    
    //MARK : - Table View Delegate 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return heightCell
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TalkCell") as? TalkCell
        return cell!
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}