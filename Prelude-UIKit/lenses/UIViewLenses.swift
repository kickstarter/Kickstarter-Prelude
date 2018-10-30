import Prelude
import UIKit

public protocol UIViewProtocol: KSObjectProtocol, UITraitEnvironmentProtocol, LensObject {
  func addConstraints(_ constraints: [NSLayoutConstraint])
  var alpha: CGFloat { get set }
  var backgroundColor: UIColor? { get set }
  var clipsToBounds: Bool { get set }
  var constraints: [NSLayoutConstraint] { get }
  func contentCompressionResistancePriority(for axis: NSLayoutConstraint.Axis) -> UILayoutPriority
  func contentHuggingPriority(for axis: NSLayoutConstraint.Axis) -> UILayoutPriority
  var contentMode: UIView.ContentMode { get set }
  var frame: CGRect { get set }
  var isHidden: Bool { get set }
  var layer: CALayer { get }
  var layoutMargins: UIEdgeInsets { get set }
  var preservesSuperviewLayoutMargins: Bool { get set }
  func removeConstraints(_ constraints: [NSLayoutConstraint])
  var semanticContentAttribute: UISemanticContentAttribute { get set }
  func setContentCompressionResistancePriority(_ priority: UILayoutPriority,
                                               for axis: NSLayoutConstraint.Axis)
  func setContentHuggingPriority(_ priority: UILayoutPriority,
                                 for axis: NSLayoutConstraint.Axis)
  var tag: Int { get set }
  var tintColor: UIColor! { get set }
  var translatesAutoresizingMaskIntoConstraints: Bool { get set }
  var isUserInteractionEnabled: Bool { get set }
}

extension UIView: UIViewProtocol {}

public extension LensHolder where Object: UIViewProtocol {
  public var alpha: Lens<Object, CGFloat> {
    return Lens(
      view: { $0.alpha },
      set: { $1.alpha = $0; return $1 }
    )
  }

  public var backgroundColor: Lens<Object, UIColor> {
    return Lens(
      view: { $0.backgroundColor ?? .clear },
      set: { $1.backgroundColor = $0; return $1 }
    )
  }

  public var clipsToBounds: Lens<Object, Bool> {
    return Lens(
      view: { $0.clipsToBounds },
      set: { $1.clipsToBounds = $0; return $1 }
    )
  }

  public var constraints: Lens<Object, [NSLayoutConstraint]> {
    return Lens(
      view: { $0.constraints },
      set: {
        $1.removeConstraints($1.constraints)
        $1.addConstraints($0)
        return $1
      }
    )
  }

  public func contentCompressionResistancePriority(for axis: NSLayoutConstraint.Axis)
    -> Lens<Object, UILayoutPriority> {

    return Lens(
      view: { $0.contentCompressionResistancePriority(for: axis) },
      set: { $1.setContentCompressionResistancePriority($0, for: axis); return $1 }
    )
  }

  public func contentHuggingPriority(for axis: NSLayoutConstraint.Axis)
    -> Lens<Object, UILayoutPriority> {

      return Lens(
        view: { $0.contentHuggingPriority(for: axis) },
        set: { $1.setContentHuggingPriority($0, for: axis); return $1 }
      )
  }

  public var contentMode: Lens<Object, UIView.ContentMode> {
    return Lens(
      view: { $0.contentMode },
      set: { $1.contentMode = $0; return $1 }
    )
  }

  public var frame: Lens<Object, CGRect> {
    return Lens(
      view: { $0.frame },
      set: { $1.frame = $0; return $1 }
    )
  }

  public var isHidden: Lens<Object, Bool> {
    return Lens(
      view: { $0.isHidden },
      set: { $1.isHidden = $0; return $1 }
    )
  }

  public var isUserInteractionEnabled: Lens<Object, Bool> {
    return Lens(
      view: { $0.isUserInteractionEnabled },
      set: { $1.isUserInteractionEnabled = $0; return $1 }
    )
  }

  public var layer: Lens<Object, CALayer> {
    return Lens(
      view: { $0.layer },
      set: { $1 }
    )
  }

  public var layoutMargins: Lens<Object, UIEdgeInsets> {
    return Lens(
      view: { $0.layoutMargins },
      set: { $1.layoutMargins = $0; return $1 }
    )
  }

  public var preservesSuperviewLayoutMargins: Lens<Object, Bool> {
    return Lens(
      view: { $0.preservesSuperviewLayoutMargins },
      set: { $1.preservesSuperviewLayoutMargins = $0; return $1 }
    )
  }

  public var semanticContentAttribute: Lens<Object, UISemanticContentAttribute> {
    return Lens(
      view: { $0.semanticContentAttribute },
      set: { $1.semanticContentAttribute = $0; return $1; }
    )
  }

  public var tag: Lens<Object, Int> {
    return Lens(
      view: { $0.tag },
      set: { $1.tag = $0; return $1 }
    )
  }

  public var tintColor: Lens<Object, UIColor> {
    return Lens(
      view: { $0.tintColor },
      set: { $1.tintColor = $0; return $1 }
    )
  }

  public var translatesAutoresizingMaskIntoConstraints: Lens<Object, Bool> {
    return Lens(
      view: { $0.translatesAutoresizingMaskIntoConstraints },
      set: { $1.translatesAutoresizingMaskIntoConstraints = $0; return $1 }
    )
  }
}

public extension Lens where Whole: UIViewProtocol, Part == CGRect {
  public var origin: Lens<Whole, CGPoint> {
    return Whole.lens.frame..CGRect.lens.origin
  }
  public var size: Lens<Whole, CGSize> {
    return Whole.lens.frame..CGRect.lens.size
  }
}

public extension Lens where Whole: UIViewProtocol, Part == CGPoint {
  public var x: Lens<Whole, CGFloat> {
    return Whole.lens.frame.origin..CGPoint.lens.x
  }
  public var y: Lens<Whole, CGFloat> {
    return Whole.lens.frame.origin..CGPoint.lens.y
  }
}

public extension Lens where Whole: UIViewProtocol, Part == CGSize {
  public var width: Lens<Whole, CGFloat> {
    return Whole.lens.frame.size..CGSize.lens.width
  }
  public var height: Lens<Whole, CGFloat> {
    return Whole.lens.frame.size..CGSize.lens.height
  }
}

public extension Lens where Whole: UIViewProtocol, Part == CALayer {
  public var borderColor: Lens<Whole, CGColor?> {
    return Whole.lens.layer..Part.lens.borderColor
  }

  public var borderWidth: Lens<Whole, CGFloat> {
    return Whole.lens.layer..Part.lens.borderWidth
  }

  public var cornerRadius: Lens<Whole, CGFloat> {
    return Whole.lens.layer..Part.lens.cornerRadius
  }

  public var masksToBounds: Lens<Whole, Bool> {
    return Whole.lens.layer..Part.lens.masksToBounds
  }

  public var shadowColor: Lens<Whole, CGColor?> {
    return Whole.lens.layer..CALayer.lens.shadowColor
  }

  public var shadowOffset: Lens<Whole, CGSize> {
    return Whole.lens.layer..CALayer.lens.shadowOffset
  }

  public var shadowOpacity: Lens<Whole, Float> {
    return Whole.lens.layer..CALayer.lens.shadowOpacity
  }

  public var shadowRadius: Lens<Whole, CGFloat> {
    return Whole.lens.layer..CALayer.lens.shadowRadius
  }

  public var shouldRasterize: Lens<Whole, Bool> {
    return Whole.lens.layer..CALayer.lens.shouldRasterize
  }
}
