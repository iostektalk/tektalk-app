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
    var response : [PFObject]?
    var error : NSError?
    
    convenience init(updateBlock : UpdateUIBlock) {
        
        self.init()
        
        self.updateUIBlock = updateBlock
    }
    
    override func main() {
        
        if let updateBlock = self.updateUIBlock {
            updateBlock(self.response, self.error)
        }
        
        self.finishOperation()
    }
}
