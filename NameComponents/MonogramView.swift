//  NameComponentsSampleApp
//  Copyright (c) Filip Lazov 2020
//  MIT license - see LICENSE file for more info

import SwiftUI

// A view that creates a circlular monogram displaing person's initials
// If the initials can not be constructed then it uses a generic person image
struct MonogramView: View {
  
  private struct CircleMonogram<Content: View> : View {
    var content: Content
    
    var body: some View {
      content
        .font(.system(.largeTitle, design: .rounded))
        .padding()
        .frame(width: 80, height: 80)
        .background(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
        .clipShape(Circle())
    }
  }
  
  private var name: String?
  private var personNameComponents: PersonNameComponents?
  private var useComponents: Bool
  
  var body: some View {
    makeMonogram()
  }
  
  init(name: String) {
    self.name = name
    useComponents = false
  }
  
  init(personNameComponents: PersonNameComponents) {
    self.personNameComponents = personNameComponents
    useComponents = true
  }
  
  private func makeGenericMonogram() -> some View {
    CircleMonogram(content: Image(systemName: "person.fill"))
  }
  
  private func makePreciseMonogram(for name: String) -> some View {
    CircleMonogram(content: Text(name))
  }
  
  private func makeMonogram() -> some View {
    let abbreviatedName = useComponents
      ? personNameComponents?.abbreviatedName
      : name?.personNameComponents?.abbreviatedName

    if let initials = abbreviatedName, initials.count == 2 {
      return AnyView(makePreciseMonogram(for: initials))
    }

    return AnyView(makeGenericMonogram())
  }
}
