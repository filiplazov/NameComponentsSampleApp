//  NameComponentsSampleApp
//  Copyright (c) Filip Lazov 2020
//  MIT license - see LICENSE file for more info

import Foundation

extension PersonNameComponents {
  var shortName: String {
    return PersonNameComponentsFormatter.localizedString(from: self, style: .short)
  }
  
  var mediumName: String {
    return PersonNameComponentsFormatter.localizedString(from: self, style: .medium)
  }
  
  var longName: String {
    return PersonNameComponentsFormatter.localizedString(from: self, style: .long)
  }
  
  var abbreviatedName: String {
    return PersonNameComponentsFormatter.localizedString(from: self, style: .abbreviated)
  }
}
