import UIKit
import SwiftUI
import CZUtils

/**
 Wrap UIKit CZFPSLabel into SwiftUI.
 
 ### Usage
 
 ```
 ```
 */
public struct FPSLabel: UIViewRepresentable {
  public typealias UIViewType = CZFPSLabel
  
  public init() {}
  
  public func makeUIView(context: UIViewRepresentableContext<FPSLabel>) -> CZFPSLabel {
    return CZFPSLabel()
  }
  
  public func updateUIView(_ uiView: CZFPSLabel, context: Context) {
    
  }
}
