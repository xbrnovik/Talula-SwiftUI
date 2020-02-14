//
//  MeteoriteFetchedResultController.swift
//  Talula
//
//  Created by Diana Brnovik on 14/02/2020.
//  Copyright © 2020 Diana Brnovik. All rights reserved.
//
import CoreData

class MeteoriteFetchedResultsControllerDelegate: NSObject, NSFetchedResultsControllerDelegate {
    
    var meteoriteModelContainer: MeteoriteModelContainer
    
    init(meteoriteModelContainer: MeteoriteModelContainer) {
        self.meteoriteModelContainer = meteoriteModelContainer
    }
    
    /// Updates meteorites tableview with new content saved.
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let meteorites = controller.fetchedObjects as? [Meteorite] else {
            return
        }
        meteoriteModelContainer.meteoriteModels = meteorites.compactMap {
            MeteoriteModel(meteorite: $0)
        }
    }
}
