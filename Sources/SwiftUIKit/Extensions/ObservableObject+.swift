import SwiftUI
import Combine

/**
 Convenience methods for `ObservableObject` protocol.
*/
public extension ObservableObject where Self.ObjectWillChangePublisher == ObservableObjectPublisher {
  /// Dispatches that ObservableObject will change.
  func dispatchObjectWillChange() {
    objectWillChange.send()
  }
}
