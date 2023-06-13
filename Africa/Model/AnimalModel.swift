//
//  AnimalModel.swift
//  Africa
//
//  Created by Leonardo Lazzari on 27/04/23.
//

import Foundation

struct Animal: Identifiable, Codable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
