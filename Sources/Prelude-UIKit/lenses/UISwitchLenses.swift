import Prelude
import UIKit

public protocol UISwitchProtocol: UIControlProtocol {
  var isOn: Bool { get set }
  var onTintColor: UIColor? { get set }
  var thumbTintColor: UIColor? { get set }
  var tintColor: UIColor! { get set }
}

#if os(iOS)
extension UISwitch: UISwitchProtocol {}
#endif

public extension LensHolder where Object: UISwitchProtocol {

  public var isOn: Lens<Object, Bool> {
    return Lens(
      view: { $0.isOn },
      set: { $1.isOn = $0; return $1; }
    )
  }

  public var onTintColor: Lens<Object, UIColor?> {
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

  public var tintColor: Lens<Object, UIColor> {
    return Lens(
      view: { $0.tintColor },
      set: { $1.tintColor = $0; return $1; }
    )
  }
}
