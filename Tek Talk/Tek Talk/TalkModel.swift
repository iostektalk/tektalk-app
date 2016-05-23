//
//  TalkModel.swift
//  Tek Talk
//
//  Created by minhthong on 5/22/16.
//  Copyright © 2016 Zyncas. All rights reserved.
//

import Foundation
import Parse
class TalkModel: NSObject {
    var avatarSpeaker: String?
    var numberTekTalk: Int?
    var subject: String?
    var descTekTalk: String?
    var languageTekTalk: String?
    
    func talkModelWithData(data: NSDictionary!) -> TalkModel {
//        self.avatarSpeaker = data.objectForKey("")
//        self.numberTekTalk = data.objectForKey("") as? Int
//        self.subject = data.objectForKey("")
        
        return self
    }
}