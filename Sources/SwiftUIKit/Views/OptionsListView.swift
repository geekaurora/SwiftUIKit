import SwiftUI

public struct OptionsListView: View {
  public typealias SelectedIndexChanged = (_ index: Int) -> Void
  
  @State private var selectedIndex = 0
  private let selectedIndexChanged: SelectedIndexChanged?
  private let items: [String]
  
  public init(items: [String],
              selectedIndexChanged: SelectedIndexChanged? = nil) {
    self.items = items
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
    }
    //.frame(height: 185)
  }
}

public struct OptionsItemView: View {
  static let normalColor: Color = .black
  static let selectedColor: Color = .red
  private let text: String
  private let selected: Bool
  
  public init(text: String,
              selected: Bool) {
    self.text = text
    self.selected = selected
  }
  
  public var body: some View {
    let color = selected ? Self.selectedColor : Self.normalColor
    return Text(text)
      //.frame(width: 100)
      .foregroundColor(color)
      .font(.headline)
  }
}
