//
//  SearchAPITarget.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/04/16.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import Foundation

struct SearchAPITarget: TargetType {
    var routerVersion: TargetVersion { .searchAPI }
    
    var method: HTTPMethod { .get }
    
    var paths: [String] { ["map-place","v1","search"] }
    
    var parameter: [String : String]?
    
    var body: Data?
    
    init(parameter: [String: String]?) {
        self.parameter = parameter
    }
}
