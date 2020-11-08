import UIKit
import SwiftUI

/**
 ### How it works
 
 - It squazes insets between Cells and set background color.
 
 ### Usage
 
 ```
 List {
 if headerViewWrapper?.scrollingWithList ?? false {
 headerViewWrapper?.view
 }
 
 ForEach(modelListState.models, id: \.diffId) { model in
 self
 .cellBuilder(model)
 .hideCellSeparator(background: backgroundColor)
 }
 }
 ```
 */
public extension View {
  func hideCellSeparator(insets: EdgeInsets = .defaultListRowInsets, background: Color = .red) -> some View {
    modifier(HideRowSeparatorModifier(insets: insets, background: background))
  }
  
  // Not working.
  func removeListCellDivider() {
    if #available(iOS 14.0, *) {
      // iOS 14 doesn't have extra separators below the list by default.
    } else {
      // To remove only extra separators below the list:
      UITableView.appearance().tableFooterView = UIView()
    }
    
    // To remove all separators including the actual ones:
    UITableView.appearance().separatorStyle = .none
    UITableView.appearance().separatorColor = .clear
  }
}

struct HideRowSeparatorModifier: ViewModifier {
  static let defaultListRowHeight: CGFloat = 44
  var insets: EdgeInsets
  var background: Color
  
  init(insets: EdgeInsets, background: Color) {
    self.insets = insets
    var alpha: CGFloat = 0
    UIColor(background).getWhite(nil, alpha: &alpha)
    assert(alpha == 1, "Setting background to a non-opaque color will result in separators remaining visible.")
    self.background = background
  }
  
  func body(content: Content) -> some View {
    Group {
      content
        .padding(insets)
        // Ensures Cell taking full width of list.
        .frame(
          minWidth: 0, maxWidth: .infinity,
          // minHeight: Self.defaultListRowHeight,
          alignment: .leading
        )
        // Squaze insets between Cells.
        .listRowInsets(EdgeInsets())
        // Set background color.
        .background(background)
    }
  }
}

public extension EdgeInsets {
  static let defaultListRowInsets = Self(top: 0, leading: 16, bottom: 0, trailing: 16)
}

