import Prelude
import UIKit

public protocol UISwitchProtocol: UIViewProtocol {
  var isOn: Bool { get set }
  var onTintColor: UIColor { get set }
  var thumbTintColor: UIColor? { get set }
}

extension UISwitch: UISwitchProtocol {}

public extension LensHolder where Object: UISwitchProtocol {
  public var isOn: Lens<Object, Bool> {
    return Lens(
      view: { $0.isOn },
      set: { $1.isOn = $0; return $1; }
    )
  }

  public var onTintColor: Lens<Object, UIColor> {
    return Lens(
      view: { $0.onTintColor },
      set: { $1.onTintColor = $0; return $1; }
    )
  }

  public var thumbTintColor: Lens<Object, UIColor?> {
    return Lens(
      view: { $0.thumbTintColor },
      set: { $1.thumbTintColor = $0; return $1; }
    )
  }
}
