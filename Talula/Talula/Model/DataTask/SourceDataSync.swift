//
//  SourceDataSync.swift
//  Talula
//
//  Created by Diana Brnovik on 30/01/2019.
//  Copyright © 2019 Diana Brnovik. All rights reserved.
//

import Foundation
import CoreData

class SourceDataSync {
    
    private let persistentContainer: NSPersistentContainer = CoreDataContainer.shared.persistentContainer
    private let downloader: SourceDataDownloader = SourceDataDownloader()
    
    // MARK: - Fetch
    
    /**
     1. Checks if data are obtained.
     2. Updates persistent data by private function.
     3. Sends error message if necessary.
     
     - Parameter all: Information describing if it is neccessary to download all data.
     */
    func fetchMeteorites(all: Bool, completion: @escaping(Error?) -> Void) {
        downloader.getMeteorites(all: all) { [weak self] data, error in
            guard let self = self else { return }
            // Checks if is error a result, if true then returns.
            if let error = error {
                completion(error)
                return
            }
            // Checks if data are obtained.
            guard let data = data else {
                let error = NSError(domain: ErrorDomain.dataDomain, code: ErrorCode.incorrectDataFormat, userInfo: nil)
                completion(error)
                return
            }
            // Sets new context - backgroung contect works for both (foreground, backgroung).
            let context = self.persistentContainer.newBackgroundContext()
            context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            context.undoManager = nil
            // Updates persistent data.
            let accepted = self.syncMeteorites(meteorites: data, context: context)
            // If update was not successful returns error.
            if accepted {
                completion(nil)
            } else {
                let error = NSError(domain: ErrorDomain.dataDomain, code: ErrorCode.syncFailure, userInfo: nil)
                completion(error)
            }
        }
    }
    
    /**
     Performs update. Saves new meteorites and updates old meteorites using MeteoriteStorage class.
     
     - Parameters:
            - dataDictionary: Dictionary of obtained data.
            - context: Context which updates persistent data.
     
     - Returns: Information about success of update in persistent storage.
     */
    private func syncMeteorites(meteorites: [MeteoriteResponse], context: NSManagedObjectContext) -> Bool {
        var successfull = false
        let storage = MeteoriteStorage()
        storage.setExternalContext(context: context)
        // Performs update.
        context.performAndWait {
            meteorites.forEach {
                let id = $0.meteoriteId
                let meteoriteObject = storage.getById(id: id) ?? storage.create()
                do {
                    try meteoriteObject?.update(with: $0) //set properties
                } catch let error as NSError {
                    NSLog("Update error: \(error.debugDescription).")
                    guard let meteoriteObject = meteoriteObject else {
                        NSLog("Update error: Deletion of meteorite object failed.")
                        return
                    }
                    context.delete(meteoriteObject)
                }
            }
            storage.save()
            successfull = true
        }
        return successfull
    }
    
}
