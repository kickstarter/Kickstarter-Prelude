import Prelude
import UIKit

public protocol CALayerProtocol: KSObjectProtocol {
  var borderColor: CGColor? { get set }
  var borderWidth: CGFloat { get set }
  var cornerRadius: CGFloat { get set }
  var masksToBounds: Bool { get set }
  var shadowColor: CGColor? { get set }
  var shadowOffset: CGSize { get set }
  var shadowOpacity: Float { get set }
  var shadowRadius: CGFloat { get set }
  var shouldRasterize: Bool { get set }
}

extension CALayer: CALayerProtocol {}

extension LensHolder where Object: CALayerProtocol {
  public var borderColor: Lens<Object, CGColor?> {
    return Lens(
      view: { $0.borderColor },
      set: { $1.borderColor = $0; return $1 }
    )
  }

  public var borderWidth: Lens<Object, CGFloat> {
    return Lens(
      view: { $0.borderWidth },
      set: { $1.borderWidth = $0; return $1 }
    )
  }
  public var cornerRadius: Lens<Object, CGFloat> {
    return Lens(
      view: { $0.cornerRadius },
      set: { $1.cornerRadius = $0; return $1 }
    )
  }

  public var masksToBounds: Lens<Object, Bool> {
    return Lens(
      view: { $0.masksToBounds },
      set: { $1.masksToBounds = $0; return $1 }
    )
  }

  public var shadowColor: Lens<Object, CGColor?> {
    return Lens(
      view: { $0.shadowColor },
      set: { $1.shadowColor = $0; return $1 }
    )
  }

  public var shadowOffset: Lens<Object, CGSize> {
    return Lens(
      view: { $0.shadowOffset },
      set: { $1.shadowOffset = $0; return $1 }
    )
  }

  public var shadowOpacity: Lens<Object, Float> {
    return Lens(
      view: { $0.shadowOpacity },
      set: { $1.shadowOpacity = $0; return $1 }
    )
  }

  public var shadowRadius: Lens<Object, CGFloat> {
    return Lens(
      view: { $0.shadowRadius },
      set: { $1.shadowRadius = $0; return $1 }
    )
  }

  public var shouldRasterize: Lens<Object, Bool> {
    return Lens(
      view: { $0.shouldRasterize },
      set: { $1.shouldRasterize = $0; return $1 }
    )
  }
}
