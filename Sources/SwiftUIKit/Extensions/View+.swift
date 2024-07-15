import SwiftUI

// MARK: - Extension

/**
 Convenience methods for `View` protocol.
*/
public extension View {  
  /// Return `AnyView` by erasing the type of `self`.
  func eraseToAnyView() -> AnyView {
    return AnyView(self)
  }
  
  func lanscapeSupported() -> some View {
    return self.navigationViewStyle(StackNavigationViewStyle())
  }
}

// MARK: - Layout

/// Convenience methods for the layout of View.
extension View {
  /// Aligns the top to the parent.
  public func alignTopToParent() -> some View {
    VStack {
      self
      Spacer()
    }
  }

  /// Aligns the bottom to the parent.
  public func alignBottomToParent() -> some View {
    VStack {
      Spacer()
      self
    }
  }

  /// Aligns the leading to the parent.
  public func alignLeadingToParent() -> some View {
    HStack {
      self
      Spacer()
    }
  }

  /// Aligns the trailing to the parent.
  public func alignTrailingToParent() -> some View {
    HStack {
      Spacer()
      self
    }
  }

  /// Centers horizontally to the parent.
  public func centerHorizontally() -> some View {
    HStack {
      Spacer()
      self
      Spacer()
    }
  }

  /// Centers vertically to the parent.
  public func centerVertically() -> some View {
    VStack {
      Spacer()
      self
      Spacer()
    }
  }
}

// MARK: - Others

/// Build `AnyView` with `View`.
public func anyView<V: View>(block: () -> V) -> AnyView {
  let view = block()
  return AnyView(view)
}
