import SwiftUI
import UIKit

/**
 Bridging UIKit SearchBar to SwiftUI.
 
 ### Usage
 ```
 SearchBar(onSearch: { keyword in
  print("Searching keyword: \(keyword)")
 })
 ```
 */
public struct SearchBar: UIViewRepresentable {
  public typealias OnSearch = (String?) -> Void
  
  //@Binding var text: String
  private let onSearch: OnSearch
  private let icon: UIImage?
  
  public init(icon: UIImage? = nil,
              onSearch: @escaping OnSearch) {
    self.icon = icon
    self.onSearch = onSearch
  }
  
  public func makeCoordinator() -> Coordinator {
    return Coordinator(onSearch: onSearch)
  }
  
  public func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
    let searchBar = UISearchBar(frame: .zero)
    searchBar.delegate = context.coordinator
    return searchBar
  }
  
  public func updateUIView(_ uiView: UISearchBar,
                           context: UIViewRepresentableContext<SearchBar>) {
    // uiView.text = text
  }
  
  // MARK: - Coordinator
  
  public class Coordinator: NSObject, UISearchBarDelegate {
    let onSearch: OnSearch
    
    //        init(text: Binding<String>) {
    //            $text = text
    //        }
    
    init(onSearch: @escaping OnSearch) {
      self.onSearch = onSearch
      super.init()
    }
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      //text = searchText
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
      searchBar.resignFirstResponder()
      onSearch(searchBar.text)
    }
  }
}
