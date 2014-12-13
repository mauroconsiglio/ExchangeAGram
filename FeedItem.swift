//
//  FeedItem.swift
//  ExchangeAGram
//
//  Created by Mauro Consiglio on 13/12/14.
//  Copyright (c) 2014 Mauro Consiglio. All rights reserved.
//

import Foundation
import CoreData

@objc (FeedItem)

class FeedItem: NSManagedObject {

    @NSManaged var caption: String
    @NSManaged var image: NSData
    @NSManaged var thumbNail: NSData

}
