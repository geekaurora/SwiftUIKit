import UIKit
import SwiftUI
import CZUtils

/**
 Present View in more flexible way than .sheet().
 
 ### Usage
 ```
 struct ContentView: View {
   @Environment(\.viewController) private var viewControllerHolder: UIViewController?
   
   var body: some View {
     Button("Login") {
       self.viewControllerHolder?.present(style: .popover) {
         Text("Main")
       }
     }
   }
 }
 ```
 
 - Note:
 The presentingModal is passed to the modal so you can dismiss it from the modal itself, but you can get rid of it.
 To make it REALLY present fullscreen (Not just visually)
 You need to access to the ViewController. So you need some helper containers and environment stuff.
 */
public struct ViewControllerHolder {
  public weak var value: UIViewController?
}

public struct ViewControllerKey: EnvironmentKey {
  public static var defaultValue: ViewControllerHolder {
    // return ViewControllerHolder(value: UIApplication.shared.windows.first?.rootViewController)
    return ViewControllerHolder(value: UIApplication.shared.topMostViewController())
  }
}

public extension EnvironmentValues {
  var viewController: UIViewController? {
    get { return self[ViewControllerKey.self].value }
    set { self[ViewControllerKey.self].value = newValue }
  }
}

//Then you should use implement this extension:

public extension UIViewController {
  func present<Content: View>(style: UIModalPresentationStyle = .automatic, @ViewBuilder builder: () -> Content) {
    let toPresent = UIHostingController(rootView: AnyView(EmptyView()))
    toPresent.modalPresentationStyle = style
    toPresent.rootView = AnyView(
      builder()
        .environment(\.viewController, toPresent)
    )
    self.present(toPresent, animated: true, completion: nil)
  }
}
