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
  public typealias OnTextDidBeginEditing = () -> Void

  //@Binding var text: String
  private let onSearch: OnSearch
  private let onTextDidBeginEditing: OnTextDidBeginEditing?
  private let icon: UIImage?
  public private(set) var searchBar: UISearchBar!

  public init(icon: UIImage? = nil,
              onSearch: @escaping OnSearch,
              onTextDidBeginEditing: OnTextDidBeginEditing? = nil) {
    self.icon = icon
    self.onSearch = onSearch
    self.onTextDidBeginEditing = onTextDidBeginEditing
  }
  
  public func makeCoordinator() -> Coordinator {
    return Coordinator(onSearch: onSearch, onTextDidBeginEditing: onTextDidBeginEditing)
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
    let onTextDidBeginEditing: OnTextDidBeginEditing?
    
    //        init(text: Binding<String>) {
    //            $text = text
    //        }
    
    public init(onSearch: @escaping OnSearch,
                onTextDidBeginEditing: OnTextDidBeginEditing? = nil) {
      self.onSearch = onSearch
      self.onTextDidBeginEditing = onTextDidBeginEditing
    }
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      //text = searchText
    }
        
    public func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
      onTextDidBeginEditing?()
    }

    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
      searchBar.resignFirstResponder()
      onSearch(searchBar.text)
    }
  }
}
