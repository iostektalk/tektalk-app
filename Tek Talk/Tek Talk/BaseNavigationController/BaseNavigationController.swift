//
//  BaseNavigationController.swift
//  Tek Talk
//
//  Created by minhthong on 5/20/16.
//  Copyright © 2016 Zyncas. All rights reserved.
//

import Foundation
import UIKit
class BaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Style
        self.initStyle()
    }
    
    // Style
    private func initStyle() {
        self.navigationBar.translucent = false;
    }
}