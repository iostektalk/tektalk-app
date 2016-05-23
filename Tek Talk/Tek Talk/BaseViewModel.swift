//
//  BaseViewModel.swift
//  Tek Talk
//
//  Created by Nghia Tran Vinh on 5/23/16.
//  Copyright © 2016 Zyncas. All rights reserved.
//

import UIKit

@objc protocol BaseViewModelDelegate {
    optional func fetchData()
}

class BaseViewModel: NSObject, BaseViewModelDelegate {

}
