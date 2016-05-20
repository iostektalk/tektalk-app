//
//  BaseTabbarController.swift
//  Tek Talk
//
//  Created by minhthong on 5/20/16.
//  Copyright © 2016 Zyncas. All rights reserved.
//

import Foundation
import UIKit
class BaseTabbarController: UITabBarController {
    
    //MARK : - init life vehicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Style
        self.initStyle()
    }
    
    deinit {
        NSLog("De init")
    }
    
    // Style
    private func initStyle() {
        self.tabBar.translucent = false;
    }
}