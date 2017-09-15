import Prelude
import UIKit

public protocol UITabBarItemProtocol: UIBarItemProtocol {
  var selectedImage: UIImage? { get set }
  var titlePositionAdjustment: UIOffset { get set }
}

extension UITabBarItem: UITabBarItemProtocol {}

public extension LensHolder where Object: UITabBarItemProtocol {
  public var selectedImage: Lens<Object, UIImage?> {
    return Lens(
      view: { $0.selectedImage },
      set: { $1.selectedImage = $0; return $1 }
    )
  }

  public var titlePositionAdjustment: Lens<Object, UIOffset> {
    return Lens(
      view: { $0.titlePositionAdjustment },
      set: { $1.titlePositionAdjustment = $0; return $1 }
    )
  }
}
