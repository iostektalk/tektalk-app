//
//  ImageOperation.swift
//  Tek Talk
//
//  Created by Nghia Tran Vinh on 5/23/16.
//  Copyright © 2016 Zyncas. All rights reserved.
//

import UIKit
import Nuke

class ImageOperation: BaseOperation {
    override func main() {
        
        let imageURL = NSURL()
        let task = Nuke.taskWith(imageURL).resume()
        print(task.state) // Prints "Running"
        
        // Cancels the image load, task completes with an error ImageManagerErrorCode.Cancelled
        task.cancel()
    }
}
