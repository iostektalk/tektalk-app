//
//  APIManager.swift
//  Tek Talk
//
//  Created by Nghia Tran Vinh on 5/23/16.
//  Copyright © 2016 Zyncas. All rights reserved.
//

import UIKit

class APIManager: NSObject {
    
    // Queue
    let apiQueue = NSOperationQueue()
    let mainQueue = NSOperationQueue.mainQueue()
    
    // Share instance
    class var shareInstance : APIManager {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: APIManager? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = APIManager()
        }
        return Static.instance!
    }
    
    override init() {
        super.init()
        
        // queue
        self.apiQueue.name = "com.zyncas.Tek-Talk.apiQueue"
    }
    
    ///////////////////////////////////////////////////
    internal func fetchEvent(updateBlock : UpdateUIBlock) {
        
        let eventOp = EventOperation()
        let uiOp = UIOperation(updateBlock: updateBlock)
        
        // Dependency
        uiOp.addDependency(eventOp)
        
        // Queue
        self.apiQueue.addOperation(eventOp)
        self.mainQueue.addOperation(uiOp)
    }
}
