import SwiftUI

// MARK: - Text

public struct TextTitleStyle: ViewModifier {
  public init() {}
  
  public func body(content: Content) -> some View {
    content
      .font(.headline)
      .foregroundColor(Color(white: 0.1))
  }
}

public struct TextDescriptionStyle: ViewModifier {
  public init() {}

  public func body(content: Content) -> some View {
    content
      .foregroundColor(Color(white: 0.1))
  }
}

// MARK: - Button

/// Button style that makes button in Cell tappable.
/// - Usage:
/// Button().modifier(TappableButtonStyle())
public struct TappableButtonStyle: ViewModifier {
  public init() {}
  
  public func body(content: Content) -> some View {
    content
      .buttonStyle(BorderlessButtonStyle())
  }
}

// MARK: - Image

public extension Image {
  func feedImageStyle() -> AnyView {
    AnyView(
      self
        .resizable()
        .aspectRatio(1, contentMode: .fit)
      //.frame(width: 300, height: 300)
      //.scaledToFit()
      //.scaledToFill()
      //.clipped()
    )
  }
}
