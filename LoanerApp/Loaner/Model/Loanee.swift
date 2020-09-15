//
//  Loanee.swift
//  loaner
//
//  Created by Thomas Vandegriff on 3/13/19.
//  Copyright © 2019 LinnierGames. All rights reserved.
//

import UIKit

class Loanee: NSObject, NSCoding {

    var name: String
    var contactNumber: String?

    // NSCoding protocol requires keys for variables
    enum Keys: String {
        case name = "name"
        case contactNumber = "contactNumber"
    }
    
    init(name: String, contactNumber: String?) {
        
        /** For Future Feature: Ability to access Contacts app:
        init(name: String, profileImage: UIImage, contactNumber: String?) {

        self.profileImage = profileImage
        **/
        
        self.name = name
        self.contactNumber = contactNumber
    }
    
    // NSCoding requires encoding func
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(contactNumber, forKey: "contactNumber")
    }
    
    // NSCoding requires decoing func
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        contactNumber = aDecoder.decodeObject(forKey: "contactNumber") as? String
        super.init()
    }
}
