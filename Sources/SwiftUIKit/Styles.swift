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
      .foregroundColor(Color(white: 0.2))
  }
}

public struct TextLightSmallStyle: ViewModifier {
  public init() {}
  public func body(content: Content) -> some View {
    content
      .foregroundColor(Color(white: 0.2))
      .font(.system(size: 17))
  }
}

public struct TextLightestSmallStyle: ViewModifier {
  public init() {}
  public func body(content: Content) -> some View {
    content
      .foregroundColor(Color(white: 0.45))
      .font(.system(size: 15))
  }
}

// MARK: - Button

/// Button style that makes button in Cell tappable.
///
/// - Note:
/// Must use modifier `TappableButtonStyle`in Cell -  .buttonStyle(BorderlessButtonStyle()),
/// otherwise Cell selection will always be triggered before Button action.
///
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
