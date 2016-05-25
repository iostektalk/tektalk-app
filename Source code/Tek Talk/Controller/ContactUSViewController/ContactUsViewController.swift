//
//  ContactUsViewController.swift
//  Tek Talk
//
//  Created by minhthong on 5/20/16.
//  Copyright © 2016 Zyncas. All rights reserved.
//

import Foundation
class ContactUsViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }
}