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
class TalkViewController: BaseViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView?
    
    var heightCell:CGFloat = {
        return 147
    }()
    
    var talksData: NSMutableArray = {
       return NSMutableArray()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.tableView?.registerClass(TalkCell.self, forCellReuseIdentifier: "TalkCell");
        self.tableView?.registerNib(UINib.init(nibName: "TalkCell", bundle: nil), forCellReuseIdentifier: "TalkCell")
        
        APIManager.shareInstance.fetchTalks {(response : [PFObject]?, error : NSError?)  in
            if error != nil {
                UIAlertView.init(title: "Error", message: error?.localizedDescription, delegate: nil, cancelButtonTitle: "Close").show()
            }else{
                for pfobject in response! {
                    let speaker = pfobject["speaker"] as? PFObject
                    
                    let talkModel = TalkModel()
                    talkModel.avatarSpeaker = speaker?.objectForKey("avatar") as? String
                    talkModel.descTekTalk   = pfobject.objectForKey("shortDescription") as? String
                    talkModel.subject   = pfobject.objectForKey("subject") as? String
                    self.talksData.addObject(talkModel)
                }
                self.tableView?.reloadData()
            }
        }
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "TALKS"
        
    }
    
    //MARK : - Table View Delegate 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.talksData.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return heightCell
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> TalkCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TalkCell") as? TalkCell
        let talkModel = self.talksData[indexPath.row] as! TalkModel
        cell?.lbNameTekTalk?.text = talkModel.subject
        cell?.lbDescriptionTekTalk?.text = talkModel.descTekTalk
        return cell!
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}