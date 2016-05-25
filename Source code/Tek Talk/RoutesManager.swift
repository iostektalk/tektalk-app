//
//  RoutesManager.swift
//  Tek Talk
//
//  Created by Nghia Tran Vinh on 5/23/16.
//  Copyright © 2016 Zyncas. All rights reserved.
//

import UIKit
import Parse

class RoutesManager: NSObject {
    
    class var rootViewController : BaseTabbarController {
        get {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            if let window = app.window {
                return window.rootViewController as! BaseTabbarController
            }
            
            return BaseTabbarController()
        }
    }
    
    class var visibleNavigationController : BaseNavigationController {
        get {
            return self.rootViewController.selectedViewController as! BaseNavigationController
        }
    }
    
    internal class func pushToEventDetailWithEventObj(eventObj:PFObject) {
        
        let controller = self.rootViewController.storyboard!.instantiateViewControllerWithIdentifier(EventDetailViewController._ID)
    
        self.visibleNavigationController.pushViewController(controller, animated: true)
    }
    
    internal class func pushToTalkDetailWithEventObj(eventObj:PFObject) {
        
        let controller = self.rootViewController.storyboard!.instantiateViewControllerWithIdentifier(TalkDetailViewController._ID)
        
        self.visibleNavigationController.pushViewController(controller, animated: true)
    }
}
