//
//  SourceDataStorage.swift
//  Talula
//
//  Created by Diana Brnovik on 30/01/2019.
//  Copyright © 2019 Diana Brnovik. All rights reserved.
//

import Foundation

class SourceDataDownloader {
    
    private let urlSession = URLSession.shared
    private var downloadAll = true
    
    /// Creates meteorite URL.
    private var meteoriteURL: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "data.nasa.gov"
        components.path = "/resource/y77d-th95.json"
        var urlWhere = "year>=\"2011-01-01T00:00:00\""
        if !downloadAll {
            let lastUpdateTimestamp = UserDefaults.standard.integer(forKey: Name.timestampKey)
            let lastUpdateDate = Date.init(timeIntervalSince1970: TimeInterval(lastUpdateTimestamp))
            let dateString = Formatter.dateFormatter.iso.string(from: lastUpdateDate)
            urlWhere = "year>=\"2011-01-01T00:00:00\"AND:updated_at>\"" + dateString + "Z\""
        }
        components.queryItems = [
            URLQueryItem(name: "$$app_token", value: "vkpZsq6vJE0i7wvOkP2ybNIbm"),
            URLQueryItem(name: "$where", value: urlWhere),
            URLQueryItem(name: "fall", value: "Fell"),
            URLQueryItem(name: "$select", value: "id,reclat,reclong,recclass,mass,year,name")
        ]
        return components.url
    }
    
    /**
     Downloads meteorite data from NASA API using URLSession.
     
     - Parameters:
             - all: Information saying if all data should be download.
             - completion: Completion with obtained data or obtained error.
     */
    func getMeteorites(all: Bool, completion: @escaping(_ meteoritesDict: [MeteoriteResponse]?, _ error: Error?) -> ()) {
        self.downloadAll = all
        // Checks is defined URL of session.
        guard let meteoritesURL = meteoriteURL else {
            let error = NSError(domain: ErrorDomain.dataDomain, code: ErrorCode.wrongURLFormat, userInfo: nil)
            completion(nil, error)
            return
        }
        // Starts url session with given url.
        urlSession.dataTask(with: meteoritesURL) { (data, response, error) in
            // Checks if received data exists.
            guard let data = data else {
                let error = NSError(domain: ErrorDomain.dataDomain, code: ErrorCode.emptyReceivedData, userInfo: nil)
                completion(nil, error)
                return
            }
            // Decodes received data.
            do {
                let jsonObject = try JSONDecoder().decode([MeteoriteResponse].self, from: data)
                completion(jsonObject, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}
