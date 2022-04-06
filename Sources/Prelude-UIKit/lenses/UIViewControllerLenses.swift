import Prelude
import UIKit

public protocol UIViewControllerProtocol: UITraitEnvironmentProtocol, LensObject {
  var navigationController: UINavigationController? { get }
  var navigationItem: UINavigationItem { get }
  var title: String? { get set }
  var view: UIView! { get set }
}

extension UIViewController: UIViewControllerProtocol {}

public extension LensHolder where Object: UIViewControllerProtocol {
  var navigationController: Lens<Object, UINavigationController?> {
    return Lens(
      view: { $0.navigationController },
      set: { $1 }
    )
  }

  var navigationItem: Lens<Object, UINavigationItem> {
    return Lens(
      view: { $0.navigationItem },
      set: { $1 }
    )
  }

  var title: Lens<Object, String?> {
    return Lens(
      view: { $0.title },
      set: { $1.title = $0; return $1 }
    )
  }

  var view: Lens<Object, UIView> {
    return Lens(
      view: { $0.view },
      set: { $1.view = $0; return $1 }
    )
  }
}

extension Lens where Whole: UIViewControllerProtocol, Part == UIView {
  var backgroundColor: Lens<Whole, UIColor> {
    return Whole.lens.view..Part.lens.backgroundColor
  }

  var layoutMargins: Lens<Whole, UIEdgeInsets> {
    return Whole.lens.view..Part.lens.layoutMargins
  }

  var tintColor: Lens<Whole, UIColor> {
    return Whole.lens.view..Part.lens.tintColor
  }
}
