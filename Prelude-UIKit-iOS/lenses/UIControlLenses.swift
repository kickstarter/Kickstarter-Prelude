// swiftlint:disable type_name
import Prelude
import UIKit

public protocol UIControlProtocol: UIViewProtocol {
  var enabled: Bool { get set }
  var selected: Bool { get set }
  var contentVerticalAlignment: UIControlContentVerticalAlignment { get set }
  var contentHorizontalAlignment: UIControlContentHorizontalAlignment { get set }
}

extension UIControl: UIControlProtocol {}

public extension LensHolder where Object: UIControlProtocol {
  public var enabled: Lens<Object, Bool> {
    return Lens(
      view: { $0.enabled },
      set: { $1.enabled = $0; return $1 }
    )
  }
  public var selected: Lens<Object, Bool> {
    return Lens(
      view: { $0.selected },
      set: { $1.selected = $0; return $1 }
    )
  }
  public var contentVerticalAlignment: Lens<Object, UIControlContentVerticalAlignment> {
    return Lens(
      view: { $0.contentVerticalAlignment },
      set: { $1.contentVerticalAlignment = $0; return $1 }
    )
  }
  public var contentHorizontalAlignment: Lens<Object, UIControlContentHorizontalAlignment> {
    return Lens(
      view: { $0.contentHorizontalAlignment },
      set: { $1.contentHorizontalAlignment = $0; return $1 }
    )
  }
}
