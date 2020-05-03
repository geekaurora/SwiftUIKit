import SwiftUI

/**
 Convenience methods for `UIApplication`.
*/
public extension UIApplication {
  /// Resigns first responder and hides the keyboard.
  func endEditing() {
    sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
