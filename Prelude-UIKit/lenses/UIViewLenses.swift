import Prelude
import UIKit

public protocol UIViewProtocol: KSObjectProtocol, UITraitEnvironmentProtocol, LensObject {
  var alpha: CGFloat { get set }
  var backgroundColor: UIColor? { get set }
  func contentCompressionResistancePriorityForAxis(axis: UILayoutConstraintAxis) -> UILayoutPriority
  func contentHuggingPriorityForAxis(axis: UILayoutConstraintAxis) -> UILayoutPriority
  var contentMode: UIViewContentMode { get set }
  var frame: CGRect { get set }
  var hidden: Bool { get set }
  var layer: CALayer { get }
  var layoutMargins: UIEdgeInsets { get set }
  var preservesSuperviewLayoutMargins: Bool { get set }
  func setContentCompressionResistancePriority(priority: UILayoutPriority,
                                               forAxis axis: UILayoutConstraintAxis)
  func setContentHuggingPriority(priority: UILayoutPriority,
                                 forAxis axis: UILayoutConstraintAxis)
  var tag: Int { get set }
  var tintColor: UIColor! { get set }
  var translatesAutoresizingMaskIntoConstraints: Bool { get set }
  var userInteractionEnabled: Bool { get set }
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

  public var frame: Lens<Object, CGRect> {
    return Lens(
      view: { $0.frame },
      set: { $1.frame = $0; return $1 }
    )
  }

  public var hidden: Lens<Object, Bool> {
    return Lens(
      view: { $0.hidden },
      set: { $1.hidden = $0; return $1 }
    )
  }

  public var layer: Lens<Object, CALayer> {
    return Lens(
      view: { $0.layer },
      set: { _, view in view }
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
