//
//  SongCollection.swift
//  minimalTunes
//
//  Created by John Moody on 7/14/16.
//  Copyright © 2016 John Moody. All rights reserved.
//

import Foundation
import CoreData


class SongCollection: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    @NSManaged func addTracksObject(track: Track)
}
