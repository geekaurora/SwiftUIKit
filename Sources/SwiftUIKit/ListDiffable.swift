import Foundation
import CZUtils

/**
 Alternative protocol of List `Identifierable`, it requires `diffId` instead of `id` which possiblity conflicts with model prop.
 
 -  Note:
 For instances which conform to `Codable`, `diffId` will be automatically implemented with the string retrived from
 all member variables of `self`, which is efficient for diffing with respect to `self` property changes.
 
 ### Usage
 
 In List, use `\.diffId` after list identifier:
 `ForEach(feeds, id: \.diffId)`.
 */
public protocol ListDiffable {
  /// Diffable id be used for List identifierable.
  var diffId: String { get }
}

public extension ListDiffable where Self: Codable {
  /// In Codable extension, `description` returns `self` dictionary version corresponding to
  /// all member variables of `self`, which is efficient for diffing with respect to `self` property changes.
  var diffId: String {
    return description.MD5
  }
}

/// Protocol composed of `Codable` and `ListDiffable`.
///
/// - Note:
///
/// With `Coable` extension, `diffId` will be automatically implemented with the string retrived from all member
/// variables of `self`, which is efficient for diffing with respect to `self` property changes.
public typealias ListDiffCodable = Codable & ListDiffable
