//
//  TargetType.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/04/16.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import Foundation

protocol TargetType {
    var routerVersion: TargetVersion { get }
    var method: HTTPMethod { get }
    var paths: [String] { get }
    var parameter: [String: String]? { get }
    var body: Data? { get }
}
