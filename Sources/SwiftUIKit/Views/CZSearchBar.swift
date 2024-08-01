import SwiftUI
import CZUtils

/// The customizable SwiftUI search bar.
struct CZSearchBar: View {
  typealias OnSubmit = (String) -> Void

  @State private var text: String = ""
  @FocusState var isFocused: Bool
  @State private var isFocusedFromInitializer: Bool
  private let placeholder: String
  private let onSubmit: OnSubmit?
  private let disableAutocorrection: Bool

  private enum Constants {
    static let updateFocusDelay = 0.6
    static let backgroundColor = Color(red: 0.9450980424880981, green: 0.9529411792755127, blue: 0.95686274766922)
  }

  init(
    placeholder: String = "",
    text: String = "",
    isFocused: Bool = false,
    onSubmit: OnSubmit? = nil,
    disableAutocorrection: Bool = true
  ) {
    self.placeholder = placeholder
    self.text = text
    self.onSubmit = onSubmit
    self.disableAutocorrection = disableAutocorrection
    self.isFocusedFromInitializer = isFocused
  }

  var body: some View {
    return HStack(alignment: .center, spacing: 10) {
      Image(systemName: "magnifyingglass")
      TextField(self.placeholder, text: $text)
        .focused($isFocused)
        .onSubmit {
          onSubmit?(self.text)
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
      DispatchQueue.main.asyncAfter(deadline: .now() + Constants.updateFocusDelay) {
        self.isFocused = isFocusedFromInitializer
        self.isFocusedFromInitializer = false
      }
    }
    .padding(.vertical, 15)
    .padding(.horizontal, 20)
    .background(Constants.backgroundColor)
    .cornerRadius(34)
  }
}
