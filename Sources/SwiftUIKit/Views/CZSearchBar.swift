import SwiftUI
import CZUtils

public struct CZSearchBar: View {
  public typealias OnSubmit = (String) -> Void

  @State private var text = ""
  @FocusState var isFocused: Bool
  private var isFocusedFromInitializer = false
  private let placeholder: String
  private let onSubmit: OnSubmit
  private let disableAutocorrection: Bool

  public init(placeholder: String = "",
               text: String = "",
               isFocused: Bool = false,
               onSubmit: @escaping OnSubmit,
               disableAutocorrection: Bool = true) {
    self.placeholder = placeholder
    self.text = text
    self.onSubmit = onSubmit
    self.disableAutocorrection = disableAutocorrection
    self.isFocusedFromInitializer = isFocused
  }

  public var body: some View {
    return HStack(alignment: .center, spacing: 10) {
      Image(systemName: "magnifyingglass")
      TextField(self.placeholder, text: $text)
        .focused($isFocused)
        .onSubmit {
          onSubmit(self.text)
        }
        .disableAutocorrection(self.disableAutocorrection)

      if !self.text.isEmpty {
        Image(systemName: "x.circle.fill")
          .opacity(0.8)
          .onTapGesture {
            self.text = ""
          }
      }
    }
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
        self.isFocused = isFocusedFromInitializer
      }
    }
    .padding(.init(top: 17, leading: 20, bottom: 17, trailing: 20))
    .background(Color(red: 241.0/255.0, green: 243.0/255.0, blue: 244.0/255.0))
    .cornerRadius(34)
  }
}
