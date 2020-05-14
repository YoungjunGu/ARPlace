//
//  UpdateStore.swift
//  ARPlace
//
//  Created by youngjun goo on 2020/05/14.
//  Copyright © 2020 youngjun goo. All rights reserved.
//

import Combine
import SwiftUI

class UpdateStore: ObservableObject {
   var willChange = PassthroughSubject<Void, Never>()

   var updates: [Update] {
      didSet {
         willChange.send()
      }
   }

   init(updates: [Update] = []) {
      self.updates = updates
   }
}

