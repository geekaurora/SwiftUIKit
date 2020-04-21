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
    }.padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
  }
}

public struct OptionsItemView: View {
  static let normalColor: Color = .init(white: 0.2)
  static let selectedColor: Color = .init(red: 255.0/255.0, green: 80.0/255.0, blue: 80.0/255.0)
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
      .foregroundColor(color)
      .font(.headline)
  }
}
