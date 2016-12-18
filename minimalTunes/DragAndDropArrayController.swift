//
//  DragAndDropArrayController.swift
//  minimalTunes
//
//  Created by John Moody on 7/1/16.
//  Copyright © 2016 John Moody. All rights reserved.
//

import Cocoa

class DragAndDropArrayController: NSArrayController, NSTableViewDataSource, NSTableViewDelegate {
    
    var mainWindow: MainWindowController?
    
    
    
    func tableView(tableView: NSTableView, sortDescriptorsDidChange oldDescriptors: [NSSortDescriptor]) {
        print("sort descriptors did change called")
    }
    
    func tableView(tableView: NSTableView, writeRowsWithIndexes rowIndexes: NSIndexSet, toPasteboard pboard: NSPasteboard) -> Bool {
        print("table view writerows called")
        let rows = NSMutableArray()
        
        for index in rowIndexes {
            let trackView = (self.arrangedObjects as! [TrackView])[index]
            rows.addObject(trackView.track!.objectID.URIRepresentation())
        }
        let encodedIDs = NSKeyedArchiver.archivedDataWithRootObject(rows)
        let context = mainWindow?.currentSourceListItem?.name
        print("context is \(context)")
        if context != nil {
            pboard.setString(context!, forType: "context")
        }
        pboard.setData(encodedIDs, forType: "Track")
        return true
    }
    
    func tableView(tableView: NSTableView, draggingSession session: NSDraggingSession, willBeginAtPoint screenPoint: NSPoint, forRowIndexes rowIndexes: NSIndexSet) {
        
        print("dragypoo called")
    }
    
    func tableView(tableView: NSTableView, validateDrop info: NSDraggingInfo, proposedRow row: Int, proposedDropOperation dropOperation: NSTableViewDropOperation) -> NSDragOperation {
        print("validating drop library table")
        return NSDragOperation.Every
    }
}