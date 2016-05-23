//
//  EventViewModel.swift
//  Tek Talk
//
//  Created by Nghia Tran Vinh on 5/23/16.
//  Copyright © 2016 Zyncas. All rights reserved.
//

import UIKit
import Parse

class EventViewModel: NSObject{

    // Data
    var arrEvents : [PFObject]? = []
    weak var tableView : UITableView? {
        didSet {
            tableView?.delegate = self
            tableView?.dataSource = self
        }
    }
    
    internal func fetchData() {
        APIManager.shareInstance.fetchEvent {[weak self] (response : [PFObject]?, error : NSError?)  in
            self?.arrEvents = response
            
            print(self?.tableView)
            
            self?.tableView?.reloadData()
        }
    }
}

extension EventViewModel :  UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arrEvents?.count)!
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView?.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell?.backgroundColor = UIColor.redColor()
        
        return cell!
    }
}