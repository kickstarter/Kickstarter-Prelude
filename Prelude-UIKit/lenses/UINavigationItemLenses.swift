import Prelude
import UIKit

public protocol UINavigationItemProtocol: KSObjectProtocol {
  var title: String? { get set }
}

extension UINavigationItem: UINavigationItemProtocol {}

public extension LensHolder where Object: UINavigationItemProtocol {
  public var title: Lens<Object, String?> {
    return Lens(
      view: { $0.title },
      set: { $1.title = $0; return $1 }
    )
  }
}
