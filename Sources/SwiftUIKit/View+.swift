import SwiftUI

/// Convenience methods for `View` protocol.
public extension View {  
  /// Return `AnyView` by erasing the type of `self`.
  func eraseToAnyView() -> AnyView {
    return AnyView(self)
  }
}

/// Build `AnyView` with `View`.
public func anyView<V: View>(block: () -> V) -> AnyView {
  let view = block()
  return AnyView(view)
}
