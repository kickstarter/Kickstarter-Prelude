import Prelude
import UIKit

public protocol UIViewProtocol: KSObjectProtocol, UITraitEnvironmentProtocol, LensObject {
  func addConstraints(constraints: [NSLayoutConstraint])
  var alpha: CGFloat { get set }
  var backgroundColor: UIColor? { get set }
  var bottomAnchor: NSLayoutYAxisAnchor { get }
  var centerXAnchor: NSLayoutXAxisAnchor { get }
  var centerYAnchor: NSLayoutYAxisAnchor { get }
  var constraints: [NSLayoutConstraint] { get }
  func contentCompressionResistancePriorityForAxis(axis: UILayoutConstraintAxis) -> UILayoutPriority
  func contentHuggingPriorityForAxis(axis: UILayoutConstraintAxis) -> UILayoutPriority
  var contentMode: UIViewContentMode { get set }
  var firstBaselineAnchor: NSLayoutYAxisAnchor { get }
  var frame: CGRect { get set }
  var hidden: Bool { get set }
  var heightAnchor: NSLayoutDimension { get }
  var lastBaselineAnchor: NSLayoutYAxisAnchor { get }
  var layer: CALayer { get }
  var layoutMargins: UIEdgeInsets { get set }
  var leadingAnchor: NSLayoutXAxisAnchor { get }
  var leftAnchor: NSLayoutXAxisAnchor { get }
  var preservesSuperviewLayoutMargins: Bool { get set }
  func removeConstraints(constraints: [NSLayoutConstraint])
  var rightAnchor: NSLayoutXAxisAnchor { get }
  func setContentCompressionResistancePriority(priority: UILayoutPriority,
                                               forAxis axis: UILayoutConstraintAxis)
  func setContentHuggingPriority(priority: UILayoutPriority,
                                 forAxis axis: UILayoutConstraintAxis)
  var tag: Int { get set }
  var tintColor: UIColor! { get set }
  var topAnchor: NSLayoutYAxisAnchor { get }
  var trailingAnchor: NSLayoutXAxisAnchor { get }
  var translatesAutoresizingMaskIntoConstraints: Bool { get set }
  var userInteractionEnabled: Bool { get set }
  var widthAnchor: NSLayoutDimension { get }
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
      view: { $0.backgroundColor ?? .clearColor() },
      set: { $1.backgroundColor = $0; return $1 }
    )
  }

  public var bottomAnchor: Lens<Object, NSLayoutYAxisAnchor> {
    return Lens(
      view: { $0.bottomAnchor },
      set: { $1 }
    )
  }

  public var centerXAnchor: Lens<Object, NSLayoutXAxisAnchor> {
    return Lens(
      view: { $0.centerXAnchor },
      set: { $1 }
    )
  }

  public var centerYAnchor: Lens<Object, NSLayoutYAxisAnchor> {
    return Lens(
      view: { $0.centerYAnchor },
      set: { $1 }
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

  public func contentCompressionResistancePriorityForAxis(axis: UILayoutConstraintAxis)
    -> Lens<Object, UILayoutPriority> {

    return Lens(
      view: { $0.contentCompressionResistancePriorityForAxis(axis) },
      set: { $1.setContentCompressionResistancePriority($0, forAxis: axis); return $1 }
    )
  }

  public func contentHuggingPriorityForAxis(axis: UILayoutConstraintAxis) -> Lens<Object, UILayoutPriority> {
    return Lens(
      view: { $0.contentHuggingPriorityForAxis(axis) },
      set: { $1.setContentHuggingPriority($0, forAxis: axis); return $1 }
    )
  }

  public var contentMode: Lens<Object, UIViewContentMode> {
    return Lens(
      view: { $0.contentMode },
      set: { $1.contentMode = $0; return $1 }
    )
  }

  public var firstBaselineAnchor: Lens<Object, NSLayoutYAxisAnchor> {
    return Lens(
      view: { $0.firstBaselineAnchor },
      set: { $1 }
    )
  }

  public var frame: Lens<Object, CGRect> {
    return Lens(
      view: { $0.frame },
      set: { $1.frame = $0; return $1 }
    )
  }

  public var heightAnchor: Lens<Object, NSLayoutDimension> {
    return Lens(
      view: { $0.heightAnchor },
      set: { $1 }
    )
  }

  public var hidden: Lens<Object, Bool> {
    return Lens(
      view: { $0.hidden },
      set: { $1.hidden = $0; return $1 }
    )
  }

  public var lastBaselineAnchor: Lens<Object, NSLayoutYAxisAnchor> {
    return Lens(
      view: { $0.lastBaselineAnchor },
      set: { $1 }
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

  public var topAnchor: Lens<Object, NSLayoutYAxisAnchor> {
    return Lens(
      view: { $0.topAnchor },
      set: { $1 }
    )
  }

  public var translatesAutoresizingMaskIntoConstraints: Lens<Object, Bool> {
    return Lens(
      view: { $0.translatesAutoresizingMaskIntoConstraints },
      set: { $1.translatesAutoresizingMaskIntoConstraints = $0; return $1 }
    )
  }

  public var userInteractionEnabled: Lens<Object, Bool> {
    return Lens(
      view: { $0.userInteractionEnabled },
      set: { $1.userInteractionEnabled = $0; return $1 }
    )
  }

  public var widthAnchor: Lens<Object, NSLayoutDimension> {
    return Lens(
      view: { $0.widthAnchor },
      set: { $1 }
    )
  }
}

public extension LensType where Whole: UIViewProtocol, Part == CGRect {
  public var origin: Lens<Whole, CGPoint> {
    return Whole.lens.frame • CGRect.lens.origin
  }
  public var size: Lens<Whole, CGSize> {
    return Whole.lens.frame • CGRect.lens.size
  }
}

public extension LensType where Whole: UIViewProtocol, Part == CGPoint {
  public var x: Lens<Whole, CGFloat> {
    return Whole.lens.frame.origin • CGPoint.lens.x
  }
  public var y: Lens<Whole, CGFloat> {
    return Whole.lens.frame.origin • CGPoint.lens.y
  }
}


public extension LensType where Whole: UIViewProtocol, Part == CGSize {
  public var width: Lens<Whole, CGFloat> {
    return Whole.lens.frame.size • CGSize.lens.width
  }
  public var height: Lens<Whole, CGFloat> {
    return Whole.lens.frame.size • CGSize.lens.height
  }
}

public extension LensType where Whole: UIViewProtocol, Part == CALayer {
  public var borderColor: Lens<Whole, CGColorRef?> {
    return Whole.lens.layer • Part.lens.borderColor
  }

  public var borderWidth: Lens<Whole, CGFloat> {
    return Whole.lens.layer • Part.lens.borderWidth
  }

  public var cornerRadius: Lens<Whole, CGFloat> {
    return Whole.lens.layer • Part.lens.cornerRadius
  }

  public var masksToBounds: Lens<Whole, Bool> {
    return Whole.lens.layer • Part.lens.masksToBounds
  }
}
