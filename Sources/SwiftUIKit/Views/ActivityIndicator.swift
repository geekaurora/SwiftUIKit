import UIKit
import SwiftUI

/**
 Wrap UIKit UIActivityIndicatorView into SwiftUI.
 
 ### Usage
 
 ```
 class FeedListState: ObservableObject {
  @Published var isLoading = false
 }
 ActivityIndicator(style: .gray, isAnimating: $modelListState.isLoading)
  .centerHorizontally()
 ```
 */
public struct ActivityIndicator: UIViewRepresentable {
  /// Utilize `Binding` to be aware of value change.
  private var isAnimating: Binding<Bool>
  private let style: UIActivityIndicatorView.Style
  
  public init(style: UIActivityIndicatorView.Style = .gray,
              isAnimating: Binding<Bool>) {
    self.style = style
    self.isAnimating = isAnimating
  }
  
  public func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
    return UIActivityIndicatorView(style: style)
  }
  
  public func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
    isAnimating.wrappedValue ? uiView.startAnimating() : uiView.stopAnimating()
  }
}

