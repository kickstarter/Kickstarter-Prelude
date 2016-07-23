import Prelude
import UIKit

public protocol UINavigationBarProtocol: UIViewProtocol {
  var barTintColor: UIColor? { get set }
  var titleTextAttributes: [String: AnyObject]? { get set }
}

extension UINavigationBar: UINavigationBarProtocol {}

public extension LensHolder where Object: UINavigationBarProtocol {
  public var barTintColor: Lens<Object, UIColor?> {
    return Lens(
      view: { $0.barTintColor },
      set: { $1.barTintColor = $0; return $1; }
    )
  }

  public var titleTextAttributes: Lens<Object, [String: AnyObject]> {
    return Lens(
      view: { $0.titleTextAttributes ?? [:] },
      set: { $1.titleTextAttributes = $0; return $1; }
    )
  }
}
