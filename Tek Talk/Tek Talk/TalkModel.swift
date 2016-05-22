//
//  TalkModel.swift
//  Tek Talk
//
//  Created by minhthong on 5/22/16.
//  Copyright © 2016 Zyncas. All rights reserved.
//

import Foundation
class TalkModel: NSObject {
    var avatarSpeaker: NSString?
    var numberTekTalk: Int?
    var nameTekTalk: NSString?
    var descTekTalk: NSString?
    var languageTekTalk: NSString?
    
    func talkModelWithData(data: NSDictionary!) -> TalkModel {
        self.avatarSpeaker = data.objectForKey("") as? NSString
        self.numberTekTalk = data.objectForKey("") as? Int
        self.nameTekTalk = data.objectForKey("") as? NSString
        
        return self
    }
}