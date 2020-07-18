//  NameComponentsSampleApp
//  Copyright (c) Filip Lazov 2020
//  MIT license - see LICENSE file for more info

import SwiftUI

struct PropertyValueView: View {
  var property: String
  var value: String?
  
  var body: some View {
    HStack {
      Text(property)
      Spacer()
      Text(flattenValue).fontWeight(.thin)
    }
  }
  
  private var flattenValue: String {
    guard let value = value else { return "N/A" }
    return value.isEmpty ? "N/A" : value
  }
}

struct PropertyValueView_Previews: PreviewProvider {
    static var previews: some View {
      Form{
        PropertyValueView(property: "property name", value: "value")
        PropertyValueView(property: "property name", value: nil)
      }
        
    }
}
