import SwiftUI
import SwiftUIWebMac

/**
 ### Note

 - MacOS: should expand the window the see the web view.
 */
struct ContentView: View {
    var body: some View {
      WebViewWrapper(
        url: URL(string: "https://www.google.com")!,
        completion: { htmlString in
          print("htmlString = \(htmlString!)")
        })
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
