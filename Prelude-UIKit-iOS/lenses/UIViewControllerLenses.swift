@testable import Prelude
import UIKit

public protocol UIViewControllerProtocol: NSObjectProtocol, LensObject {
  var title: String? { get set }
  var view: UIView! { get set }
}

extension UIViewController: UIViewControllerProtocol {}

public extension LensHolder where Object: UIViewControllerProtocol {
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
}
