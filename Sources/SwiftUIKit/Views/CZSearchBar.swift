import SwiftUI

public struct CZSearchBar: View {
  public typealias OnSubmit = () -> Void

  private var text: Binding<String>
  private let placeholder: String
  private let onSubmit: OnSubmit
  private let disableAutocorrection: Bool

  public  init(placeholder: String = "",
               text: Binding<String>,
               onSubmit: @escaping OnSubmit,
               disableAutocorrection: Bool = true) {
    self.text = text
    self.placeholder = placeholder
    self.onSubmit = onSubmit
    self.disableAutocorrection = disableAutocorrection
  }

  public var body: some View {
    return HStack(alignment: .center, spacing: 10) {
      Image(systemName: "magnifyingglass")
      TextField(self.placeholder, text: text)
        .onSubmit {
          onSubmit()
        }
        .disableAutocorrection(self.disableAutocorrection)
    }
    .padding(.init(top: 17, leading: 20, bottom: 17, trailing: 20))
    .background(Color(red: 241.0/255.0, green: 243.0/255.0, blue: 244.0/255.0))
    .cornerRadius(34)
  }
}
