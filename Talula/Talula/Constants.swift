//
//  Constants.swift
//  Talula
//
//  Created by Diana Brnovik on 30/01/2019.
//  Copyright © 2019 Diana Brnovik. All rights reserved.
//

import Foundation
import MapKit
import SwiftUI

enum IconSize {
    static let mini: CGFloat = 30
    static let medium: CGFloat = 50
}

enum RowSize {
    static let small: CGFloat = 40
}

enum Name {
    static let configuration = "Default Configuration"
    static let entity = "Meteorite"
    static let defaultDescriptorProperty = "mass"
    static let task = "cz.meteorites.refresh"
    static let timestampKey = "updateTimestamp"
}

enum ErrorDomain {
    static let dataDomain = "dataError"
}

enum ErrorCode {
    static let emptyReceivedData = 101
    static let incorrectDataFormat = 102
    static let syncFailure = 103
    static let wrongURLFormat = 104
}

enum Map {
    static let latitudeDelta: CLLocationDegrees = 10
    static let longitudeDelta: CLLocationDegrees = 10
    static let highMassLevel: Int = 10000
    static let lowMassLevel: Int = 1000
    static let updateDelay: Int = 86400
}

enum Icon: String {
    case meteoriteBig = "BigMeteorite"
    case meteoriteSmall = "SmallMeteorite"
    case meteoriteOther = "OtherMeteorite"
    case informationGmail = "InformationGmail"
    case informationLinkedIn = "InformationLinkedIn"
    
    var image: Image {
        Image(rawValue)
    }
}

struct Formatter {
    struct numberFormatter {
        static let localeDecimal: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.locale = NSLocale.current
            formatter.minimumFractionDigits = 3
            formatter.maximumFractionDigits = 3
            return formatter
        }()
        static let localeRounded: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.locale = NSLocale.current
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 0
            return formatter
        }()
    }
    
    struct dateFormatter {
        static let iso: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss.SSS"
            return formatter
        }()
    }
}
