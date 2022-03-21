import SwiftUI
import Combine
import WebKit

/// Store that maintains WKWebView and its observers.
/// The observers will get notified when corresponding property of WKWebView changes. e.g. canGoBack, canGoForward etc.
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
