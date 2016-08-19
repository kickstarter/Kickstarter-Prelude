import Prelude
import UIKit

public protocol UINavigationBarProtocol: UIViewProtocol {
  func backgroundImageForBarMetrics(barMetrics: UIBarMetrics) -> UIImage?
  var barTintColor: UIColor? { get set }
  func setBackgroundImage(backgroundImage: UIImage?, forBarMetrics barMetrics: UIBarMetrics)
  var shadowImage: UIImage? { get set }
  var titleTextAttributes: [String: AnyObject]? { get set }
  var translucent: Bool { get set }
}

extension UINavigationBar: UINavigationBarProtocol {}

public extension LensHolder where Object: UINavigationBarProtocol {
  public func backgroundImageForBarMetrics(barMetrics: UIBarMetrics) -> Lens<Object, UIImage?> {
    return Lens(
      view: { $0.backgroundImageForBarMetrics(barMetrics) },
      set: { $1.setBackgroundImage($0, forBarMetrics: barMetrics); return $1 }
    )
  }

  public var barTintColor: Lens<Object, UIColor?> {
    return Lens(
      view: { $0.barTintColor },
      set: { $1.barTintColor = $0; return $1; }
    )
  }

  public var shadowImage: Lens<Object, UIImage?> {
    return Lens(
      view: { $0.shadowImage },
      set: { $1.shadowImage = $0; return $1; }
    )
  }

  public var titleTextAttributes: Lens<Object, [String: AnyObject]> {
    return Lens(
      view: { $0.titleTextAttributes ?? [:] },
      set: { $1.titleTextAttributes = $0; return $1; }
    )
  }

  public var translucent: Lens<Object, Bool> {
    return Lens(
      view: { $0.translucent },
      set: { $1.translucent = $0; return $1; }
    )
  }

}
