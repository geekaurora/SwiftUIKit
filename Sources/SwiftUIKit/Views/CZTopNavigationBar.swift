import SwiftUI

/// Top navigation bar that includes a close button etc.
public struct CZTopNavigationBar: View {
  private let presentationMode: Binding<PresentationMode>

  /// Initializer of CZTopNavigationBar.
  ///
  /// - Parameter presentationMode: the presentationMode binding. You could define it as below:
  /// ```
  /// @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
  /// ```
  public init(presentationMode: Binding<PresentationMode>) {
    self.presentationMode = presentationMode
  }

  public var body: some View {
    HStack(spacing: 15) {
      Spacer()

      Image(systemName: "xmark")
        .renderingMode(.template)
        .foregroundColor(Color.black)
        .imageScale(.medium)
        .onTapGesture {
          presentationMode.wrappedValue.dismiss()
        }
    }
    .padding(15)
  }
}
