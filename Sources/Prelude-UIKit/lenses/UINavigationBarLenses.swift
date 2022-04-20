import Prelude
import UIKit

public protocol UINavigationBarProtocol: UIViewProtocol {
  func backgroundImage(for barMetrics: UIBarMetrics) -> UIImage?
  var barTintColor: UIColor? { get set }
  func setBackgroundImage(_ backgroundImage: UIImage?, for barMetrics: UIBarMetrics)
  var shadowImage: UIImage? { get set }
  var titleTextAttributes: [NSAttributedString.Key: Any]? { get set }
  var isTranslucent: Bool { get set }
  var standardAppearance: UINavigationBarAppearance { get set }
  var scrollEdgeAppearance: UINavigationBarAppearance? { get set }
}

public extension LensHolder where Object: UINavigationBarProtocol {
  func backgroundImage(for barMetrics: UIBarMetrics) -> Lens<Object, UIImage?> {
    return Lens(
      view: { $0.backgroundImage(for: barMetrics) },
      set: { $1.setBackgroundImage($0, for: barMetrics); return $1 }
    )
  }

  var barTintColor: Lens<Object, UIColor?> {
    return Lens(
      view: { $0.barTintColor },
      set: { $1.barTintColor = $0; return $1; }
    )
  }

  var isTranslucent: Lens<Object, Bool> {
    return Lens(
      view: { $0.isTranslucent },
      set: { $1.isTranslucent = $0; return $1; }
    )
  }

  var shadowImage: Lens<Object, UIImage?> {
    return Lens(
      view: { $0.shadowImage },
      set: { $1.shadowImage = $0; return $1; }
    )
  }

  var titleTextAttributes: Lens<Object, [NSAttributedString.Key: Any]> {
    return Lens(
      view: { $0.titleTextAttributes ?? [:] },
      set: { $1.titleTextAttributes = $0; return $1; }
    )
  }
  
  var standardAppearance: Lens<Object, UINavigationBarAppearance> {
    return Lens(
      view: { $0.standardAppearance },
      set: { $1.standardAppearance = $0; return $1; }
    )
  }
  
  var scrollEdgeAppearance: Lens<Object, UINavigationBarAppearance?> {
    return Lens(
      view: { $0.scrollEdgeAppearance },
      set: { $1.scrollEdgeAppearance = $0; return $1; }
    )
  }
}
