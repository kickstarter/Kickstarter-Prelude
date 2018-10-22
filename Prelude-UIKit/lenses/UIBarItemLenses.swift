import Prelude
import UIKit

public protocol UIBarItemProtocol: KSObjectProtocol {
  var isEnabled: Bool { get set }
  var title: String? { get set }
  var image: UIImage? { get set }
  var imageInsets: UIEdgeInsets { get set }
  var landscapeImagePhone: UIImage? { get set }
  var landscapeImagePhoneInsets: UIEdgeInsets { get set }
  var tag: Int { get set }
  func titleTextAttributes(for state: UIControl.State) -> [String: Any]?
  func setTitleTextAttributes(_ attributes: [NSAttributedString.Key: Any]?, for state: UIControl.State)
}

extension UIBarItem: UIBarItemProtocol {}

private func ksr_titleTextAttributes(from attributes: [String: Any]?) -> [NSAttributedString.Key: Any]? {
  guard let attributes = attributes else { return nil }

  return Dictionary(uniqueKeysWithValues: attributes.map({ key, value -> (NSAttributedString.Key, Any) in
    (NSAttributedString.Key(key), value)
  }))
}

public extension LensHolder where Object: UIBarItemProtocol {

  public var image: Lens<Object, UIImage?> {
    return Lens(
      view: { $0.image },
      set: { $1.image = $0; return $1 }
    )
  }

  public func titleTextAttributes(for state: UIControl.State)
    -> Lens<Object, [String: Any]?> {
      return Lens(
        view: { $0.titleTextAttributes(for: state) },
        set: { $1.setTitleTextAttributes(ksr_titleTextAttributes(from: $0), for: state); return $1 }
      )
  }

  public var imageInsets: Lens<Object, UIEdgeInsets> {
    return Lens(
      view: { $0.imageInsets },
      set: { $1.imageInsets = $0; return $1 }
    )
  }

  public var isEnabled: Lens<Object, Bool> {
    return Lens(
      view: { $0.isEnabled },
      set: { $1.isEnabled = $0; return $1 }
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

  public var title: Lens<Object, String?> {
    return Lens(
      view: { $0.title },
      set: { $1.title = $0; return $1 }
    )
  }
}
