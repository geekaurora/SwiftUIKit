import SwiftUI

/// Returns fixed length Spacer.
struct SpacerFixed : View {
  let height: CGFloat
  
  public var body: some View {
    Text("")
      .frame(maxWidth: .infinity)
      .frame(height: height)
  }
}
