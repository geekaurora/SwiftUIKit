import SwiftUI

public struct WebViewWrapper: View {
  
  @ObservedObject var webViewStore = WebViewStore()
  @Environment(\.presentationMode) var presentationMode
  public var url: URL
  
  public init(url: URL) {
    self.url = url
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
      self.webViewStore.webView.load(URLRequest(url: self.url))

      DispatchQueue.main.asyncAfter(deadline: .now() + 15) {

        self.webViewStore.webView.evaluateJavaScript(
          "document.body.innerHTML",
          completionHandler: { (html: Any?, error: Error?) in
            let htmlString = html as? String
            print("htmlString = \(htmlString!)")
            // completion(html as? String, error)
          })
      }
    }
    //.lanscapeSupported()
  }
  
  func goBack() {
    webViewStore.webView.goBack()
  }
  
  func goForward() {
    webViewStore.webView.goForward()
  }
}
