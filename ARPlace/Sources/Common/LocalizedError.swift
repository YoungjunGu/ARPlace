//
//  LocalizedError.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/04/17.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import Foundation

public protocol LocalizedError : Error {
    
    /// A localized message describing what error occurred.
    var errorDescription: String? { get }
    
    /// A localized message describing the reason for the failure.
    var failureReason: String? { get }
    
    /// A localized message describing how one might recover from the failure.
    // var recoverySuggestion: String? { get }
    
    /// A localized message providing "help" text if the user requests help.
    // var helpAnchor: String? { get }
}
