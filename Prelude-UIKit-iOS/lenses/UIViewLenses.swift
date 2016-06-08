import Prelude
import UIKit

public protocol UIViewProtocol: NSObjectProtocol, LensObject {
  var backgroundColor: UIColor? { get set }
  var frame: CGRect { get set }
  var layer: CALayer { get }
}

extension UIView: UIViewProtocol {}

public extension LensHolder where Object: UIViewProtocol {
  public var backgroundColor: Lens<Object, UIColor> {
    return Lens(
      view: { $0.backgroundColor ?? .clearColor() },
      set: { $1.backgroundColor = $0; return $1 }
    )
  }

  public var frame: Lens<Object, CGRect> {
    return Lens(
      view: { $0.frame },
      set: { $1.frame = $0; return $1 }
    )
  }

  public var layer: Lens<Object, CALayer> {
    return Lens(
      view: { $0.layer },
      set: { _, view in view }
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
