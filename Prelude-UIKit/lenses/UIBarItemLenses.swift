import Prelude
import UIKit

public protocol UIBarItemProtocol: KSObjectProtocol {
  var enabled: Bool { get set }
  var title: String? { get set }
  var image: UIImage? { get set }
  var imageInsets: UIEdgeInsets { get set }
  var landscapeImagePhone: UIImage? { get set }
  var landscapeImagePhoneInsets: UIEdgeInsets { get set }
  var tag: Int { get set }
  func titleTextAttributes(for state: UIControlState) -> [String : Any]?
  func setTitleTextAttributes(_ attributes: [String : Any]?, for state: UIControlState)
}

extension UIBarItem: UIBarItemProtocol {}

public extension LensHolder where Object: UIBarItemProtocol {

  public var enabled: Lens<Object, Bool> {
    return Lens(
      view: { $0.enabled },
      set: { $1.enabled = $0; return $1 }
    )
  }

  public var title: Lens<Object, String?> {
    return Lens(
      view: { $0.title },
      set: { $1.title = $0; return $1 }
    )
  }

  public var image: Lens<Object, UIImage?> {
    return Lens(
      view: { $0.image },
      set: { $1.image = $0; return $1 }
    )
  }

  public var imageInsets: Lens<Object, UIEdgeInsets> {
    return Lens(
      view: { $0.imageInsets },
      set: { $1.imageInsets = $0; return $1 }
    )
  }

  public var landscapeImagePhone: Lens<Object, UIImage?> {
    return Lens(
      view: { $0.landscapeImagePhone },
      set: { $1.landscapeImagePhone = $0; return $1 }
    )
  }

  public var landscapeImagePhoneInsets: Lens<Object, UIEdgeInsets> {
    return Lens(
      view: { $0.landscapeImagePhoneInsets },
      set: { $1.landscapeImagePhoneInsets = $0; return $1 }
    )
  }

  public var tag: Lens<Object, Int> {
    return Lens(
      view: { $0.tag },
      set: { $1.tag = $0; return $1 }
    )
  }

  public func titleTextAttributes(forState state: UIControlState) -> Lens<Object, [String:Any]?> {
    return Lens(
      view: { $0.titleTextAttributes(for: state) },
      set: { $1.setTitleTextAttributes($0, for: state); return $1 }
    )
  }
}
