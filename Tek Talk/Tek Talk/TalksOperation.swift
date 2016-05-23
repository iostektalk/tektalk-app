//
//  TalksOperation.swift
//  Tek Talk
//
//  Created by minhthong on 5/23/16.
//  Copyright © 2016 Zyncas. All rights reserved.
//

import Foundation
import Parse
class TalksOperation: BaseOperation {
    
    override func main() {
        super.main()
        
        // Executing code here
        let query = PFQuery(className: k_Classname_Event)
        query.includeKey(k_Event_Speaker)
        query.includeKey(k_Event_Videos)
        
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