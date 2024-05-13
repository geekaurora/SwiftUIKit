import SwiftUI
import UIKit

/**
 Bridging UIKit SearchBar to SwiftUI.

 - Note: For SwiftUI native experience, you may use `CZSearchBar`.

 ### Usage
 ```
 SearchBar(onSearch: { keyword in
  print("Searching keyword: \(keyword)")
 })
 ```
 */
public struct SearchBar: UIViewRepresentable {
  public typealias OnSearch = (String?, UISearchBar) -> Void
  public typealias OnTextDidBeginEditing = () -> Void

  //@Binding var text: String
  private let onSearch: OnSearch
  private let onTextDidBeginEditing: OnTextDidBeginEditing?
  private let icon: UIImage?
  private let text: String?
  private let placeholder: String?
  public private(set) var searchBar: UISearchBar!

  public init(icon: UIImage? = nil,
              text: String? = nil,
              placeholder: String? = nil,
              onSearch: @escaping OnSearch,
              onTextDidBeginEditing: OnTextDidBeginEditing? = nil) {
    self.icon = icon
    self.text = text
    self.placeholder = placeholder
    self.onSearch = onSearch
    self.onTextDidBeginEditing = onTextDidBeginEditing
  }
  
  public func makeCoordinator() -> Coordinator {
    return Coordinator(onSearch: onSearch, onTextDidBeginEditing: onTextDidBeginEditing)
  }
  
  public func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
    let searchBar = UISearchBar(frame: .zero)
    searchBar.text = text
    searchBar.placeholder = placeholder
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
      onSearch(searchBar.text, searchBar)
    }
  }
}
