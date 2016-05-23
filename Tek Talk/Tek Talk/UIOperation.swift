//
//  UIOperation.swift
//  Tek Talk
//
//  Created by Nghia Tran Vinh on 5/23/16.
//  Copyright © 2016 Zyncas. All rights reserved.
//

import UIKit
import Parse

typealias UpdateUIBlock = ([PFObject]?, NSError?) -> ()

class UIOperation: BaseOperation {
    
    // Public
    var updateUIBlock:UpdateUIBlock?
    
    convenience init(updateBlock : UpdateUIBlock) {
        
        self.init()
        
        self.updateUIBlock = updateBlock
    }
    
    override func main() {
        super.main()
        
        // Get data
        if let op = self.dependencies.first as? EventOperation {
            self.response = op.response
            self.error = op.error
        }
        
        if let updateBlock = self.updateUIBlock {
            updateBlock(self.response, self.error)
        }
        
        self.finishOperation()
    }
}
