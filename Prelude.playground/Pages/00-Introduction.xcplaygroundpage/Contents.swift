// swiftlint:disable type_name
import Prelude

/*:
# Prelude

A collection of tools that are used in the Kickstarter apps.

---

## Getting started

* Open `Prelude.xcworkspace` instead of the playground file directly.
* Build the `Prelude` framework (`cmd+B`).
* Render the markdown by going to Editor > Show Rendered Markup.

## Table of contents

* [Array.swift](Array.swift)
* [Function.swift](Function.swift)
*/


import UIKit

//public protocol UIViewProtocol: NSObjectProtocol {
//  var frame: CGRect { get set }
//  var layer: CALayer { get }
//}
//
//extension UIView: UIViewProtocol {}
//
//public protocol UILabelProtocol: UIViewProtocol {
//  var text: String? { get set }
//  var textColor: UIColor! { get set }
//}
//
//extension UILabel: UILabelProtocol {}



public struct LensHolder <Object: LensObject> {}
public protocol LensObject {}
extension NSObject: LensObject {}

public extension LensObject {
  public static var lens: LensHolder<Self> {
    return LensHolder()
  }
}

extension LensHolder where Object: UIView {
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

public extension LensHolder where Object: UILabel {
  public var font: Lens<Object, UIFont> {
    return Lens(
      view: { $0.font },
      set: { $1.font = $0; return $1; }
    )
  }

  public var text: Lens<Object, String> {
    return Lens(
      view: { $0.text ?? "" },
      set: { $1.text = $0; return $1; }
    )
  }

  public var textAlignment: Lens<Object, NSTextAlignment> {
    return Lens(
      view: { $0.textAlignment },
      set: { $1.textAlignment = $0; return $1; }
    )
  }

  public var textColor: Lens<Object, UIColor> {
    return Lens(
      view: { $0.textColor },
      set: { $1.textColor = $0; return $1; }
    )
  }
}

extension CGPoint {
  public enum lens {
    public static let x = Lens<CGPoint, CGFloat>(
      view: { $0.x },
      set: { CGPoint(x: $0, y: $1.y) }
    )

    public static let y = Lens<CGPoint, CGFloat>(
      view: { $0.y },
      set: { CGPoint(x: $1.x, y: $0) }
    )
  }
}

extension CGRect {
  public static let unit = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)

  public enum lens {
    public static let origin = Lens<CGRect, CGPoint>(
      view: { $0.origin },
      set: { CGRect(origin: $0, size: $1.size) }
    )

    public static let size = Lens<CGRect, CGSize>(
      view: { $0.size },
      set: { CGRect(origin: $1.origin, size: $0) }
    )
  }
}

extension CGSize {
  public enum lens {
    public static let width = Lens<CGSize, CGFloat>(
      view: { $0.width },
      set: { CGSize(width: $0, height: $1.height) }
    )

    public static let height = Lens<CGSize, CGFloat>(
      view: { $0.height },
      set: { CGSize(width: $1.width, height: $0) }
    )
  }
}

extension LensType where Whole == CGRect, Part == CGPoint {
  public static var x: Lens<CGRect, CGFloat> {
    return CGRect.lens.origin • CGPoint.lens.x
  }
  public static var y: Lens<CGRect, CGFloat> {
    return CGRect.lens.origin • CGPoint.lens.y
  }
}

extension LensType where Whole == CGRect, Part == CGSize {
  public static var width: Lens<CGRect, CGFloat> {
    return CGRect.lens.size • CGSize.lens.width
  }
  public static var height: Lens<CGRect, CGFloat> {
    return CGRect.lens.size • CGSize.lens.height
  }
}

extension LensType where Whole == UIView, Part == CGRect {
  public var origin: Lens<Whole, CGPoint> {
    return UIView.lens.frame • CGRect.lens.origin
  }
  public var size: Lens<Whole, CGSize> {
    return UIView.lens.frame • CGRect.lens.size
  }
}

extension LensType where Whole == UIView, Part == CGPoint {
  public var x: Lens<Whole, CGFloat> {
    return UIView.lens.frame.origin • CGPoint.lens.x
  }
  public var y: Lens<Whole, CGFloat> {
    return UIView.lens.frame.origin • CGPoint.lens.y
  }
}


extension LensType where Whole == UIView, Part == CGSize {
  public var width: Lens<Whole, CGFloat> {
    return UIView.lens.frame.size • CGSize.lens.width
  }
  public var height: Lens<Whole, CGFloat> {
    return UIView.lens.frame.size • CGSize.lens.height
  }
}

extension CALayer {
  public enum lens {
    public static let cornerRadius = Lens<CALayer, CGFloat>(
      view: { $0.cornerRadius },
      set: { $1.cornerRadius = $0; return $1 }
    )

    public static let masksToBounds = Lens<CALayer, Bool>(
      view: { $0.masksToBounds },
      set: { $1.masksToBounds = $0; return $1 }
    )
  }
}

extension LensType where Whole == UIView, Part == CALayer {
  public var cornerRadius: Lens<Whole, CGFloat> {
    return Whole.lens.layer • Part.lens.cornerRadius
  }

  public var masksToBounds: Lens<Whole, Bool> {
    return Whole.lens.layer • Part.lens.masksToBounds
  }
}

// Hack to get around the fact that playgrounds dont render views that are
// initialized like `UIView()`
func createLabel() -> UILabel {
  return UILabel(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
}

// Make any view rounded with a specified radius.
let rounded = {
  UIView.lens.layer.masksToBounds .~ true
    • UIView.lens.layer.cornerRadius .~ $0
}

// Default style for title labels.
let titleStyle = UILabel.lens.textAlignment .~ .Center
  • UILabel.lens.font .~ .preferredFontForTextStyle(UIFontTextStyleTitle1)

// Default style for labels.
let baseStyle = UIView.lens.frame.size .~ .init(width: 240.0, height: 48.0)
  • UIView.lens.backgroundColor .~ .redColor()
  • rounded(6.0)
  • titleStyle
  • UILabel.lens.textColor .~ .whiteColor()

// Create some labels and style them.
let labels = ["Hello", "UIKit", "Lenses"]
  .map {
    createLabel()
      |> UILabel.lens.text .~ $0
      |> baseStyle
}

labels


