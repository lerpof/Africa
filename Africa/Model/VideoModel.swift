//
//  VideoModel.swift
//  Africa
//
//  Created by Leonardo Lazzari on 02/05/23.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        return "video-\(id)"
    }
}
