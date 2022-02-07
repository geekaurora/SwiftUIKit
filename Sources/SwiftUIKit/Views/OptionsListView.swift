import SwiftUI

/// List view for the options selection.
public struct OptionsListView: View {
  public typealias SelectedIndexChanged = (_ index: Int) -> Void
  
  @State private var selectedIndex: Int
  private let selectedIndexChanged: SelectedIndexChanged?
  private let items: [String]
  
  public init(items: [String],
              selectedIndex: Int = 0,
              selectedIndexChanged: SelectedIndexChanged? = nil) {
    self.items = items
    self.selectedIndex = selectedIndex
    self.selectedIndexChanged = selectedIndexChanged
  }
  
  public var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .top, spacing: 10) {
        ForEach(0..<items.count, id: \.self) { i in
          OptionsItemView(text: self.items[i], selected: self.selectedIndex == i)
            .onTapGesture {
              self.selectedIndex = i
              self.selectedIndexChanged?(i)
          }
        }
      }
    }.padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
  }
}

public struct OptionsItemView: View {
  static let normalColor: Color = .init(white: 0.2)
  static let selectedColor: Color = .init(red: 255.0/255.0, green: 80.0/255.0, blue: 80.0/255.0)
  static let selectedIndicatorColor: Color = .init(white: 0.3)
  
  private let text: String
  private let selected: Bool
  
  public init(text: String,
              selected: Bool) {
    self.text = text
    self.selected = selected
  }
  
  public var body: some View {
    return
      VStack(spacing: 8) {
        Text(text)
          .font(.headline)
          .foregroundColor(Self.normalColor)
          .fixedSize(horizontal: true, vertical: false)
          .layoutPriority(1000)
        
        if (selected) {
          Rectangle()
            .foregroundColor(Self.selectedIndicatorColor)
            .frame(height: 2)
            .cornerRadius(1)
            //.fixedSize(horizontal: false, vertical: false)
            .layoutPriority(1000)
        }
        
    }
  }
}
