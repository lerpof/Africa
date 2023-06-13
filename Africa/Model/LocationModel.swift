//
//  LocationModel.swift
//  Africa
//
//  Created by Leonardo Lazzari on 02/05/23.
//

import Foundation
import MapKit

struct NationalParkLoaction: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    // MARK: - Computed Properties
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
}
