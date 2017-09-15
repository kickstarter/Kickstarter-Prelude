import Prelude
import UIKit

public protocol UITabBarProtocol: UIViewProtocol {
  var barTintColor: UIColor? { get set }
}

extension UITabBar: UITabBarProtocol {}

public extension LensHolder where Object: UITabBarProtocol {
  public var barTintColor: Lens<Object, UIColor?> {
    return Lens(
      view: { $0.barTintColor },
      set: { $1.barTintColor = $0; return $1 }
    )
  }
}
