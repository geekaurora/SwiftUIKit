import SwiftUI
import Combine
import WebKit

public class WebViewStore: ObservableObject {
  @Published public var webView: WKWebView {
    didSet {
      setupObservers()
    }
  }
  
  public init(webView: WKWebView = WKWebView()) {
    self.webView = webView
    setupObservers()
  }
  
  private func setupObservers() {
    func subscriber<Value>(for keyPath: KeyPath<WKWebView, Value>) -> NSKeyValueObservation {
      return webView.observe(keyPath, options: [.prior]) { _, change in
        if change.isPrior {
          // Dispatches when property changes.
          self.objectWillChange.send()
        }
      }
    }
    // Setup observers for all KVO compliant properties
    observers = [
            subscriber(for: \.canGoBack),
            subscriber(for: \.canGoForward)
//
//      subscriber(for: \.title),
//      subscriber(for: \.url),
//      subscriber(for: \.isLoading),
//      subscriber(for: \.estimatedProgress),
//      subscriber(for: \.hasOnlySecureContent),
//      subscriber(for: \.serverTrust),
    ]
  }
  
  private var observers: [NSKeyValueObservation] = []
  
  deinit {
    observers.forEach {
      $0.invalidate()
    }
  }
}

/// A container for using a WKWebView in SwiftUI
public struct WebView: View, NSViewRepresentable {
  /// The WKWebView to display
  public let webView: WKWebView
  
  public typealias NSViewType = NSViewContainerView<WKWebView>
  
  public init(webView: WKWebView) {
    self.webView = webView
  }
  
  public func makeNSView(context: NSViewRepresentableContext<WebView>) -> WebView.NSViewType {
    return NSViewContainerView()
  }
  
  public func updateNSView(_ uiView: WebView.NSViewType, context: NSViewRepresentableContext<WebView>) {
    // If its the same content view we don't need to update.
          uiView.contentView = webView    
//    if uiView.contentView !== webView {
//      uiView.contentView = webView
//    }
  }
}

/// A NSView which simply adds some view to its view hierarchy
public class NSViewContainerView<ContentView: NSView>: NSView {
  var contentView: ContentView? {
    willSet {
      contentView?.removeFromSuperview()
    }
    didSet {
      if let contentView = contentView {
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
          contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
          contentView.topAnchor.constraint(equalTo: topAnchor),
          contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
      }
    }
  }
}
