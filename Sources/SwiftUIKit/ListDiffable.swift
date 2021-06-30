import Foundation
import CZUtils

/**
 Alternative protocol of List `Identifiable`, it requires `diffId` instead of `id` which possiblity conflicts with model prop.
 
 ### Note
 - For instances which conforms to Identifiable protocol, `diffId` is implemented with `self.id`.
 - If the instance properties are changable, you should override `diffId` by combining `id` with the changable properties.
   e.g. "\(feedId) | liked=\(liked)”
 
 ### Usage
 
 In List, use `\.diffId` after list identifier:
 `ForEach(feeds, id: \.diffId)`.
 */
public protocol ListDiffable {
  /// Type of the diffId. Defaults to Int.
  typealias ID = Int
  
  /// Diffable id be used for List identifierable.
  ///
  /// - Note: All diffIds are called for each Cell update. time = N^2 (N = cellCount).
  var diffId: ID { get }
}

/**
 Convenient implementation of ListDiffable if Self conforms Identifiable protocol.
 */
public extension ListDiffable where Self: Identifiable {
  var diffId: ListDiffable.ID {
    // dbgPrint("ListDiffable.diffId = \(self.id)")
    
    if let intId = self.id as? Int {
      return intId
    }
    assertionFailure("`self.id` should be Int to improve performance - all `diffId`s are called for each cell update. O(N^2)")
    return self.id.hashValue
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
/// Model should conform to `Identifiable` if has no changable proerpty, otherwise override `diffId`
/// by combining `id` with changable properties. e.g. "\(feedId) | liked=\(liked)”
///
/// - Discussion:
/// `diffId` doesn't depend on `Codable` as `description` calculation significantly impacts performance.
///
/// TODO: Remove `Codable` if no need.
public typealias ListDiffCodable = Codable & ListDiffable
