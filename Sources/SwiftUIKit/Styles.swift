import SwiftUI

/**
 ### Usage
 
 ```
 Text(title).modifier(TextTitleStyle())
 ```
 */

// MARK: - Common

public struct CapsuleStyle: ViewModifier {
  private let width: CGFloat
  private let height: CGFloat
  private let foregroundColor: Color
  private let backgroundColor: Color
  
  public init(width: CGFloat = 125,
              height: CGFloat = 30,
              foregroundColor: Color = .white,
              backgroundColor: Color = .secondLightGreen) {
    
    self.width = width
    self.height = height
    self.foregroundColor = foregroundColor
    self.backgroundColor = backgroundColor
  }
  
  public func body(content: Content) -> some View {
    content
      .frame(width: width, height: height)
      .foregroundColor(foregroundColor)
      .background(backgroundColor)
      .clipShape(Capsule())
  }
}

// MARK: - Text

public struct TextTitleStyle: ViewModifier {
  public init() {}
  public func body(content: Content) -> some View {
    content
      .font(.headline)
      .foregroundColor(Color(white: 0.1))
  }
}

public struct TextSubtitleStyle: ViewModifier {
  public init() {}
  public func body(content: Content) -> some View {
    content
      .font(.subheadline)
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
  func feedImageStyle(ratio: CGFloat = 1) -> AnyView {
    AnyView(
      self
        .resizable()
        .aspectRatio(ratio, contentMode: .fit)
      //.frame(width: 300, height: 300)
      //.scaledToFit()
      //.scaledToFill()
      //.clipped()
    )
  }
  
  func thumbnailStyle(size: CGSize = CGSize(width: 30, height: 30),
                      cornerRadius: CGFloat = 5,
                      isCircleShape: Bool = false) -> AnyView {
    let view = self
      .resizable()
      .frame(width: size.width, height: size.height)
      .cornerRadius(cornerRadius)
    
    if isCircleShape {
      return view.clipShape(Circle()).eraseToAnyView()
    }
    else {
      return view.eraseToAnyView()
    }
  }
}
