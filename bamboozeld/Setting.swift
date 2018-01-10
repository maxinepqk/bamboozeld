//
//  Setting.swift
//  bamboozeld
//
//  Created by Claire C on 1/9/18.
//  Copyright © 2018 Maxine Kwan. All rights reserved.
//

import Foundation
import Parse

class Setting: NSObject {
    class func createSetting(drinks: [String], withCompletion completion: PFBooleanResultBlock?) {
        // Create Parse object PFObject
        let setting = PFObject(className: "Setting")
        
        // Add relevant fields to the object
        setting["drink_one"] = drinks[0]
        setting["drink_two"] = drinks[1]
        setting["drink_three"] = drinks[2]
        setting["drink_four"] = drinks[3]
        setting["drink_five"] = drinks[4]
        setting["id"] = "default"
        
        // Save object (following function will save the object in Parse asynchronously)
    setting.saveInBackground(block: completion)
    }
}
