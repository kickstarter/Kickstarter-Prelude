import Prelude
import UIKit

public protocol UIViewControllerProtocol: NSObjectProtocol, UITraitEnvironmentProtocol, LensObject {
  var navigationController: UINavigationController? { get }
  var navigationItem: UINavigationItem { get }
  var title: String? { get set }
  var view: UIView! { get set }
}

extension UIViewController: UIViewControllerProtocol {}

public extension LensHolder where Object: UIViewControllerProtocol {
  public var navigationController: Lens<Object, UINavigationController?> {
    return Lens(
      view: { $0.navigationController },
      set: { $1 }
    )
  }

  public var navigationItem: Lens<Object, UINavigationItem> {
    return Lens(
      view: { $0.navigationItem },
      set: { $1 }
    )
  }

  public var title: Lens<Object, String?> {
    return Lens(
      view: { $0.title },
      set: { $1.title = $0; return $1 }
    )
  }

  public var view: Lens<Object, UIView> {
    return Lens(
      view: { $0.view },
      set: { $1.view = $0; return $1 }
    )
  }
}

extension LensType where Whole: UIViewControllerProtocol, Part == UIView {
  public var backgroundColor: Lens<Whole, UIColor> {
    return Whole.lens.view • Part.lens.backgroundColor
  }

  public var tintColor: Lens<Whole, UIColor> {
    return Whole.lens.view • Part.lens.tintColor
  }
}
