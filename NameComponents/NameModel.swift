//  NameComponentsSampleApp
//  Copyright (c) Filip Lazov 2020
//  MIT license - see LICENSE file for more info

import Combine
import Foundation

final class NameModel: ObservableObject {
  @Published var name = "" {
    didSet { nameComponents = name.personNameComponents ?? PersonNameComponents()}
  }
  
  @Published var useComponentsInput = false {
    didSet {
      name = ""
    }
  }
  
  @Published var nameComponents = PersonNameComponents()
  
}
