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
import Nuke
class TalkViewController: BaseViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView?
    
    var heightCell:CGFloat = {
        return 147
    }()
    
    var talksData: [PFObject] = {
       return []
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView?.registerClass(TalkCell.self, forCellReuseIdentifier: "TalkCell");
        self.tableView?.registerNib(UINib.init(nibName: "TalkCell", bundle: nil), forCellReuseIdentifier: "TalkCell")
        
        APIManager.shareInstance.fetchTalks {[weak self](response : [PFObject]?, error : NSError?)  in
            if error != nil {
                UIAlertView.init(title: "Error", message: error?.localizedDescription, delegate: nil, cancelButtonTitle: "Close").show()
            }else{
                if let response1 = response {
                    self?.talksData = response1
                }
                self?.tableView?.reloadData()
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
        let talkObj = self.talksData[indexPath.row]
        
        cell?.imgAvatar?.nk_cancelLoading()
        cell?.imgAvatar?.image = nil;
        cell?.lbDescriptionTekTalk?.text = talkObj["shortDescription"] as? String
        cell?.lbNameTekTalk?.text = talkObj["subject"] as? String
        cell?.bgAvatar?.nk_setImageWith(NSURL(string:talkObj["background"] as! String)!)
        
        // Speaker
        if let speaker = talkObj["speaker"] as? PFObject {
            cell?.imgAvatar?.nk_setImageWith(NSURL(string:speaker["avatar"] as! String )!)
        }
//        
        //Video
        if let video = talkObj["videos"] as? PFObject {
            print("")
        }
        
        
        return cell!
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if let obj = self.talksData[indexPath.row] as? PFObject {
            RoutesManager.pushToTalkDetailWithEventObj(obj)
        }
    }
}