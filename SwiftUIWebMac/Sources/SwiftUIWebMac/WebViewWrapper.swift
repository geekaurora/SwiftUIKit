import SwiftUI

public struct WebViewWrapper: View {
  public typealias Completion = (String?) -> Void

  @ObservedObject var webViewStore = WebViewStore()
  @Environment(\.presentationMode) var presentationMode

  public var url: URL
  private var completion: Completion?

  public init(url: URL,
              completion: Completion? = nil) {
    self.url = url
    self.completion = completion
  }
  
  public var body: some View {
    print("Load WebViewWrapper ...")
    
    return NavigationView {
      VStack {
        WebView(webView: webViewStore.webView)
        //          .navigationBarTitle(Text(verbatim: webViewStore.webView.title ?? ""), displayMode: .inline)
        //          .navigationBarItems(leading: HStack {
        //            Button(action: {
        //              self.presentationMode.wrappedValue.dismiss()
        //            }) {
        //              Image(systemName: "xmark")
        //                .imageScale(.large)
        //                .aspectRatio(contentMode: .fit)
        //                .frame(width: 32, height: 32)
        //            }
        //
        //            Button(action: goBack) {
        //              Image(systemName: "chevron.left")
        //                .imageScale(.large)
        //                .aspectRatio(contentMode: .fit)
        //                .frame(width: 32, height: 32)
        //            }.disabled(!webViewStore.webView.canGoBack)
        //
        //            Button(action: goForward) {
        //              Image(systemName: "chevron.right")
        //                .imageScale(.large)
        //                .aspectRatio(contentMode: .fit)
        //                .frame(width: 32, height: 32)
        //            }.disabled(!webViewStore.webView.canGoForward)
        //          })
      }
    }.onAppear {
      self.load(URLRequest(url: self.url), completion: self.completion)
    }
    //.lanscapeSupported()
  }

  func load(_ request: URLRequest, completion: Completion? = nil) {
    self.webViewStore.load(request) { _ in
      self.webViewStore.webView.evaluateJavaScript(
        "document.body.innerHTML",
        completionHandler: { (html: Any?, error: Error?) in
          let htmlString = html as? String
          completion?(htmlString)
        })
    }
  }
  
  func goBack() {
    webViewStore.webView.goBack()
  }
  
  func goForward() {
    webViewStore.webView.goForward()
  }
}
