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

enum UIMargin {
    static let small: CGFloat = 5
    static let medium: CGFloat = 10
    static let big: CGFloat = 15
    static let large: CGFloat = 20
}

enum UIIconSize {
    static let mini: CGFloat = 30
    static let medium: CGFloat = 50
}

enum UICellSize {
    static let small: CGFloat = 40
    static let big: CGFloat = 80
}

enum Name {
    static let entity = "Meteorite"
    static let defaultDescriptorProperty = "mass"
    static let task = "cz.meteorites.refresh"
    static let masterReusableCell = "masterCell"
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

enum Font {
    static let titleFont = UIFont.preferredFont(forTextStyle: .headline)
    static let bodyFont = UIFont.preferredFont(forTextStyle: .body)
    static let subtitleFont = UIFont.preferredFont(forTextStyle: .footnote)
    static let boldMediumFont = UIFont.boldSystemFont(ofSize: 15)
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
