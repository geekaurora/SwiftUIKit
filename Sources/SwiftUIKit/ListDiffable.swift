import Foundation
import CZUtils

/**
 Alternative protocol of List `Identifiable`, it requires `diffId` instead of `id` which possiblity conflicts with model prop.
 
 ### Note
 - For instances which conforms to Identifiable protocol, `diffId` is implemented with `self.id`.
 - If the instance properties are changable, you should override `diffId` by combining `id` with the changable properties.
 
 ### Usage
 
 In List, use `\.diffId` after list identifier:
 `ForEach(feeds, id: \.diffId)`.
 */
public protocol ListDiffable {
  /// Diffable id be used for List identifierable.
  var diffId: String { get }
}

/**
 Convenient implementation of ListDiffable if Self conforms Identifiable protocol.
 */
public extension ListDiffable where Self: Identifiable {
  var diffId: String {
    assert(self.id is CustomStringConvertible, "self.id should conform CustomStringConvertible protocol.")
    return String(describing:self.id)
  }
}

/**
 - Deprecated: description calculation of Codable significantly impacts performance.
 
/// For instances which conform to `Codable`, `diffId` will be automatically implemented with the string retrived from
/// all member variables of `self`, which is efficient for diffing with respect to `self` property changes.
 
public extension ListDiffable where Self: Codable {
  /// In Codable extension, `description` returns `self` dictionary version corresponding to
  /// all member variables of `self`, which is efficient for diffing with respect to `self` property changes.
  var diffId: String {
    // return descriptionSortedByKey.MD5
    // return description.MD5
    return UUID().uuidString
  }
}
 */

/// Protocol composed of `Codable` and `ListDiffable`.
///
/// - Note:
///
/// With `Coable` extension, `diffId` will be automatically implemented with the string retrived from all member
/// variables of `self`, which is efficient for diffing with respect to `self` property changes.
public typealias ListDiffCodable = Codable & ListDiffable
