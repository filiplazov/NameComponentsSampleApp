//  NameComponentsSampleApp
//  Copyright (c) Filip Lazov 2020
//  MIT license - see LICENSE file for more info

import SwiftUI

struct ContentView: View {
  @StateObject var model = NameModel()
  
  var body: some View {
    VStack(spacing: 0) {
      if model.useComponentsInput {
        MonogramView(personNameComponents: model.nameComponents)
          .padding(.vertical, 30)
      } else {
        MonogramView(name: model.name)
          .padding(.vertical, 30)
      }

      Form {
        Section(footer: Text("Changing the toggle will clear input").font(.caption)) {
          if model.useComponentsInput {
            TextField("Given Name", text: $model.nameComponents.givenName.bound)
              .disableAutocorrection(true)
            
            TextField("Middle Name", text: $model.nameComponents.middleName.bound)
              .disableAutocorrection(true)
            
            TextField("Family Name", text: $model.nameComponents.familyName.bound)
              .disableAutocorrection(true)
            
            TextField("Nickname", text: $model.nameComponents.nickname.bound)
              .disableAutocorrection(true)
            
            TextField("Name Prefix", text: $model.nameComponents.namePrefix.bound)
              .disableAutocorrection(true)
            
            TextField("Name Suffix", text: $model.nameComponents.nameSuffix.bound)
              .disableAutocorrection(true)
            
          } else {
            
            TextField("Enter Name", text: $model.name)
              .disableAutocorrection(true)
          }

          Toggle("Use Name Components Input", isOn: $model.useComponentsInput)
        }
        
        if !model.useComponentsInput {
          Section(
            header: Text("Name Components"),
            footer: Text("Check PersonNameComponets and personNameComponents(from:) documentation").font(.caption)
          ) {
            PropertyValueView(property: "givenName", value: model.nameComponents.givenName)
            PropertyValueView(property: "middleName", value: model.nameComponents.middleName)
            PropertyValueView(property: "familyName", value: model.nameComponents.familyName)
            PropertyValueView(property: "nickname", value: model.nameComponents.nickname)
            PropertyValueView(property: "namePrefix", value: model.nameComponents.namePrefix)
            PropertyValueView(property: "nameSuffix", value: model.nameComponents.nameSuffix)
          }
        }
        
        Section(
          header: Text("Person Name Components Formatter Style"),
          footer: Text("Check PersonNameComponentsFormatter documentation").font(.caption)
        ) {
          PropertyValueView(property: ".short", value: model.nameComponents.shortName)
          PropertyValueView(property: ".medium", value: model.nameComponents.mediumName)
          PropertyValueView(property: ".long", value: model.nameComponents.longName)
          PropertyValueView(property: ".abbreviated", value: model.nameComponents.abbreviatedName)
        }
      }
    }
    .padding(.bottom)
  }
}

private extension Optional where Wrapped == String {
  var _bound: String? {
    get { return self }
    set { self = newValue }
  }
  var bound: String {
    get { return _bound ?? "" }
    set { _bound = newValue.isEmpty ? nil : newValue }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}


