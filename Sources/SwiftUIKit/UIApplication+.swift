import SwiftUI

public extension UIApplication {
  /// Resigns the first responder and hides keyboard.
  func endEditing() {
    sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
