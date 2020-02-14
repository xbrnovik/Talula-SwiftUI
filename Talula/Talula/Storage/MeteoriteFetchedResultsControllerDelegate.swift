//
//  MeteoriteFetchedResultController.swift
//  Talula
//
//  Created by Diana Brnovik on 14/02/2020.
//  Copyright © 2020 Diana Brnovik. All rights reserved.
//
import CoreData

class MeteoriteFetchedResultsControllerDelegate: NSObject, NSFetchedResultsControllerDelegate {
    
    var meteoriteStore: MeteoriteStore
    
    init(meteoriteStore: MeteoriteStore) {
        self.meteoriteStore = meteoriteStore
    }
    
    /// Updates meteorites tableview with new content saved.
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        DispatchQueue.main.async { [weak self] in
            guard let meteorites = controller.fetchedObjects as? [Meteorite] else {
                return
            }
            self?.meteoriteStore.meteoriteModels = meteorites.compactMap {
                MeteoriteModel(meteorite: $0)
            }
        }
    }
}
