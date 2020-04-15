//
//  Place.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/04/15.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import Foundation

struct Place: Codable {
    let status: String?
    let places: [PlaceInfo]?
}

struct PlaceInfo: Codable {
    let name: String?
    let roadAddress: String?
    let jibunAddress: String?
    let phoneNumber: String?
    let x: String?
    let y: String?
    let distance: Double?
    
    enum CodingKeys: String, CodingKey {
        case name,x,y,distance
        case roadAddress = "road_address"
        case jibunAddress = "jibun_address"
        case phoneNumber = "phone_number"
    }
}

