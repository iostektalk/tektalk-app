//
//  TalkCell.swift
//  Tek Talk
//
//  Created by minhthong on 5/22/16.
//  Copyright © 2016 Zyncas. All rights reserved.
//

import Foundation
import UIKit
class TalkCell: UITableViewCell {
    @IBOutlet weak var lbNumber: UILabel?
    @IBOutlet weak var lbNameTekTalk: UILabel?
    @IBOutlet weak var lbDescriptionTekTalk: UILabel?
    @IBOutlet weak var imgAvatar: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}