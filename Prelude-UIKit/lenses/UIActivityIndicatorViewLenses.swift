import Prelude
import UIKit

public protocol UIActivityIndicatorViewProtocol: UIViewProtocol {
  var activityIndicatorViewStyle: UIActivityIndicatorViewStyle { get set }
  var color: UIColor? { get set }
  var hidesWhenStopped: Bool { get set }
  func isAnimating() -> Bool
  func startAnimating()
  func stopAnimating()
}

extension UIActivityIndicatorView: UIActivityIndicatorViewProtocol {}

public extension LensHolder where Object: UIActivityIndicatorViewProtocol {

  public var activityIndicatorViewStyle: Lens<Object, UIActivityIndicatorViewStyle> {
    return Lens(
      view: { $0.activityIndicatorViewStyle },
      set: { $1.activityIndicatorViewStyle = $0; return $1 }
    )
  }

  public var animating: Lens<Object, Bool> {
    return Lens(
      view: { $0.isAnimating() },
      set: { $0 ? $1.startAnimating() : $1.stopAnimating(); return $1 }
    )
  }

  public var color: Lens<Object, UIColor?> {
    return Lens(
      view: { $0.color },
      set: { $1.color = $0; return $1 }
    )
  }

  public var hidesWhenStopped: Lens<Object, Bool> {
    return Lens(
      view: { $0.hidesWhenStopped },
      set: { $1.hidesWhenStopped = $0; return $1 }
    )
  }
}
