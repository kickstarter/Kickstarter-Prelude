import Prelude
import UIKit

public protocol UIActivityIndicatorViewProtocol: UIViewProtocol {
  #if os(iOS)
  var activityIndicatorViewStyle: UIActivityIndicatorView.Style { get set }
  #elseif os(tvOS)
  var style: UIActivityIndicatorView.Style { get set }
  #endif
  #if os(iOS)
  var color: UIColor? { get set }
  #elseif os(tvOS)
  var color: UIColor! { get set }
  #endif
  var hidesWhenStopped: Bool { get set }
  var isAnimating: Bool { get }
  func startAnimating()
  func stopAnimating()
}

extension UIActivityIndicatorView: UIActivityIndicatorViewProtocol {}

public extension LensHolder where Object: UIActivityIndicatorViewProtocol {

  #if os(iOS)
  public var activityIndicatorViewStyle: Lens<Object, UIActivityIndicatorView.Style> {
    return Lens(
      view: { $0.activityIndicatorViewStyle },
      set: { $1.activityIndicatorViewStyle = $0; return $1 }
    )
  }
  #elseif os(tvOS)
  public var style: Lens<Object, UIActivityIndicatorView.Style> {
    return Lens(
      view: { $0.style },
      set: { $1.style = $0; return $1 }
    )
  }
  #endif

  public var animating: Lens<Object, Bool> {
    return Lens(
      view: { $0.isAnimating },
      set: { $0 ? $1.startAnimating() : $1.stopAnimating(); return $1 }
    )
  }

  #if os(iOS)
  public var color: Lens<Object, UIColor?> {
    return Lens(
      view: { $0.color },
      set: { $1.color = $0; return $1 }
    )
  }
  #elseif os(tvOS)
  public var color: Lens<Object, UIColor> {
    return Lens(
      view: { $0.color },
      set: { $1.color = $0; return $1 }
    )
  }
  #endif

  public var hidesWhenStopped: Lens<Object, Bool> {
    return Lens(
      view: { $0.hidesWhenStopped },
      set: { $1.hidesWhenStopped = $0; return $1 }
    )
  }
}
