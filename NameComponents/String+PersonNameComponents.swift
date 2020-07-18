//  NameComponentsSampleApp
//  Copyright (c) Filip Lazov 2020
//  MIT license - see LICENSE file for more info

import Foundation

extension String {
  var personNameComponents: PersonNameComponents? {
    PersonNameComponentsFormatter().personNameComponents(from: self)
  }
}
