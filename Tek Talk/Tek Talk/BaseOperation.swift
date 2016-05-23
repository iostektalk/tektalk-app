//
//  BaseOperation.swift
//  Tek Talk
//
//  Created by Nghia Tran Vinh on 5/23/16.
//  Copyright © 2016 Zyncas. All rights reserved.
//

import UIKit

class BaseOperation: NSOperation {
    
    // Executing
    internal var _executing: Bool = false
    override var executing: Bool {
        get {
            return _executing
        }
        set {
            if _executing != newValue {
                willChangeValueForKey("isExecuting")
                _executing = newValue
                didChangeValueForKey("isExecuting")
            }
        }
    }
    
    // Finish
    internal var _finished: Bool = false;
    override var finished: Bool {
        get {
            return _finished
        }
        set {
            if _finished != newValue {
                willChangeValueForKey("isFinished")
                _finished = newValue
                didChangeValueForKey("isFinished")
            }
        }
    }
    
    // Async
    override var asynchronous: Bool {
        return false
    }
    
    // Main
    override func main() {
        
        if self.cancelled {
            self.finishOperation()
            return
        }
        
        self.executing = true;
        
        // Load data here -> Need override
        // ...
    }
    
    // Finish
    internal func finishOperation() {
        self.executing = false
        self.finished = true
    }
}
