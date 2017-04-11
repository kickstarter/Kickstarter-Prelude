import Prelude
import UIKit

public protocol UINavigationControllerProtocol: UIViewControllerProtocol {
  var navigationBar: UINavigationBar { get }
  var navigationBarHidden: Bool { get set }
  func setNavigationBarHidden(_ hidden: Bool, animated: Bool)
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

  public var navigationBarHidden: Lens<Object, Bool> {
    return Lens(
      view: { $0.navigationBarHidden },
      set: { $1.navigationBarHidden = $0; return $1 }
    )
  }

  public func setNavigationBarHidden(animated: Bool) -> Lens<Object, Bool> {
    return Lens(
      view: { $0.navigationBarHidden },
      set: { $1.setNavigationBarHidden($0, animated: animated); return $1 }
    )
  }

  public var viewControllers: Lens<Object, [UIViewController]> {
    return Lens(
      view: { $0.viewControllers },
      set: { $1.viewControllers = $0; return $1 }
    )
  }
}

extension Lens where Whole: UINavigationControllerProtocol, Part == UINavigationBar {

  public var barTintColor: Lens<Whole, UIColor?> {
    return Whole.lens.navigationBar..Part.lens.barTintColor
  }
}
