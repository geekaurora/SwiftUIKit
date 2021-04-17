import UIKit
import SwiftUI
import CZUtils

/**
 Wrap UIKit CZFPSLabel into SwiftUI.
 
 ### Usage
 ```
 ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
   OtherView()
         
   FPSLabel()
     .frame(minWidth: 0, maxWidth: FPSLabel.size.width, minHeight: 0, maxHeight: FPSLabel.size.height)
 }
 ```
 */
public struct FPSLabel: UIViewRepresentable {
  public static let size = CZFPSLabel.Constant.size
  
  public init() {}
  
  public func makeUIView(context: UIViewRepresentableContext<FPSLabel>) -> CZFPSLabel {
    return CZFPSLabel()
  }
  
  public func updateUIView(_ uiView: CZFPSLabel, context: Context) {
    
  }
}
