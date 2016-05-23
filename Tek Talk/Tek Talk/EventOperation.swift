//
//  EventOperation.swift
//  Tek Talk
//
//  Created by Nghia Tran Vinh on 5/23/16.
//  Copyright © 2016 Zyncas. All rights reserved.
//

import UIKit
import Parse

class EventOperation: BaseOperation {
    
    override func main() {
        super.main()
        
        // Prepare data
        let currentTime = NSDate();
        
        // Executing code here
        let query = PFQuery(className: k_Classname_Event)
        query.whereKey(k_Event_StartAt, greaterThanOrEqualTo: currentTime)
//        query.includeKey(k_Event_Speaker)
//        query.includeKey(k_Event_Videos)
//        query.includeKey(k_Event_Documents)
//        query.includeKey(k_Event_Tags)
        
        // Try
        do {
            self.response = try query.findObjects()
        }
        catch let error as NSError {
            self.error = error
        }
        
        // Finish
        self.finishOperation()
    }
}
