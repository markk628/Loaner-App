//
//  Item+CoreDataClass.swift
//  loaner
//
//  Created by Mark Kim on 9/14/20.
//  Copyright © 2020 LinnierGames. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit.UIImage

@objc(Item)
public class Item: NSManagedObject {
    
    override public func awakeFromInsert() {
        super.awakeFromInsert()
        
        itemTitle = "Untitled"
        notes = ""
        itemImage = UIImage(named: "no image")!
        loanee = Loanee(name: "", contactNumber: "")
    }

    func assignLoanee(name: String?, phoneNumber: String?) {
        
        //validate contact has at least one number
        guard let contactNumber = phoneNumber else {
            return print("this contact needed to have at least one number")
        }
        
        if let contactName = name {
            
            //update loanee var
            let newLoanee = Loanee(
                name: contactName,
                contactNumber: contactNumber
            )
            loanee = newLoanee
        } else {
            loanee = Loanee.init(name: "no name", contactNumber: "no number")
        }
    }
}
