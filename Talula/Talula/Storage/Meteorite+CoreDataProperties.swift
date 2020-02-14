//
//  Meteorite+CoreDataProperties.swift
//  Talula
//
//  Created by Diana Brnovik on 30/01/2019.
//  Copyright © 2019 Diana Brnovik. All rights reserved.
//
//

import Foundation
import CoreData


extension Meteorite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meteorite> {
        return NSFetchRequest<Meteorite>(entityName: Name.entity)
    }

    @NSManaged public var meteoriteId: String?
    @NSManaged public var name: String?
    @NSManaged public var geotype: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var mass: Float
    
    func update(with meteoriteResponse: MeteoriteResponse) throws {
        // Sets obligatory attributes.
        meteoriteId = meteoriteResponse.meteoriteId
        longitude = meteoriteResponse.latitude
        latitude = meteoriteResponse.longitude
        // Sets voluntary attributes.
        name = meteoriteResponse.name
        geotype = meteoriteResponse.geotype
        mass = meteoriteResponse.mass
    }

}
