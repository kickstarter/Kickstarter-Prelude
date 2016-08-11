import Prelude
import UIKit

public protocol UINavigationControllerProtocol: UIViewControllerProtocol {
  var navigationBar: UINavigationBar { get }
  var viewControllers: [UIViewController] { get set }
}

extension UINavigationController: UINavigationControllerProtocol {}

public extension LensHolder where Object: UINavigationControllerProtocol {
  public var navigationBar: Lens<Object, UINavigationBar> {
    return Lens(
      view: { $0.navigationBar },
      set: { $1 }
    )
  }

  public var viewControllers: Lens<Object, [UIViewController]> {
    return Lens(
      view: { $0.viewControllers },
      set: { $1.viewControllers = $0; return $1 }
    )
  }
}
