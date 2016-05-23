//
//  ApplicationHelper.swift
//  Tek Talk
//
//  Created by Nghia Tran Vinh on 5/20/16.
//  Copyright © 2016 Zyncas. All rights reserved.
//

import UIKit
import Parse
import Bolts

class ApplicationHelper: NSObject {
    
    // Init all essential SDK
    internal static func initAllSDKWithLaunchOption(launchOption : [NSObject : AnyObject]?) {
        
        // Parse
        ApplicationHelper.initParseSDK()
        
        // FB
        ApplicationHelper.initFBSDK()
    }
    
    // Init Parse
    private static func initParseSDK() {
        
        // Initialize Parse.
        let configuration = ParseClientConfiguration {
            $0.applicationId = k_PARSE_APPLICATION_ID
            $0.clientKey = k_PARSE_CLIENT_KEY
            $0.localDatastoreEnabled = true
        }
        
        Parse.initializeWithConfiguration(configuration)
    }
    
    // Init Facebook SDK
    private static func initFBSDK() {
        
    }
}
