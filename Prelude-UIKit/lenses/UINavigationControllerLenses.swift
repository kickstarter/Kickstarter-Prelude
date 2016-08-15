import Prelude
import UIKit

public protocol UINavigationControllerProtocol: UIViewControllerProtocol {
  var navigationBar: UINavigationBar { get }
}

extension UINavigationController: UINavigationControllerProtocol {}

public extension LensHolder where Object: UINavigationControllerProtocol {
  public var navigationBar: Lens<Object, UINavigationBar> {
    return Lens(
      view: { $0.navigationBar },
      set: { $1 }
    )
  }
}

extension LensType where Whole: UINavigationControllerProtocol, Part == UINavigationBar {

  public var barTintColor: Lens<Whole, UIColor?> {
    return Whole.lens.navigationBar • Part.lens.barTintColor
  }
}
