import SwiftUI

/// Convenience methods for `View` protocol.
public extension View {  
  /// Return `AnyView` by erasing the type of `self`.
  func eraseToAnyView() -> AnyView {
    return AnyView(self)
  }
  
  func lanscapeSupported() -> some View {
    return self.navigationViewStyle(StackNavigationViewStyle())
  }
  
  /// Center self horizontally.
  func centerHorizontally() -> AnyView {
    HStack {
      Spacer()
      self
      Spacer()
    }.eraseToAnyView()
  }
  
  /// Center self vertically.
  func centerVertically() -> AnyView {
    VStack {
      Spacer()
      self
      Spacer()
    }.eraseToAnyView()
  }
}

/// Build `AnyView` with `View`.
public func anyView<V: View>(block: () -> V) -> AnyView {
  let view = block()
  return AnyView(view)
}
