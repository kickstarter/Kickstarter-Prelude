// swiftlint:disable type_name
import Prelude
import UIKit

public protocol UIButtonProtocol: UIControlProtocol {
  var adjustsImageWhenDisabled: Bool { get set }
  var adjustsImageWhenHighlighted: Bool { get set }
  func attributedTitleForState(state: UIControlState) -> NSAttributedString?
  var contentEdgeInsets: UIEdgeInsets { get set }
  func setAttributedTitle(title: NSAttributedString?,
                          forState state: UIControlState)
  func setBackgroundColor(backgroundColor: UIColor, forState state: UIControlState)
  func setTitle(title: String?, forState: UIControlState)
  func setTitleColor(color: UIColor?, forState: UIControlState)
  func titleColorForState(state: UIControlState) -> UIColor?
  var titleEdgeInsets: UIEdgeInsets { get set }
  func titleForState(state: UIControlState) -> String?
  var titleLabel: UILabel? { get }
}

extension UIButton: UIButtonProtocol {}

public extension LensHolder where Object: UIButtonProtocol {
  public var adjustsImageWhenDisabled: Lens<Object, Bool> {
    return Lens(
      view: { $0.adjustsImageWhenDisabled },
      set: { $1.adjustsImageWhenDisabled = $0; return $1 }
    )
  }

  public var adjustsImageWhenHighlighted: Lens<Object, Bool> {
    return Lens(
      view: { $0.adjustsImageWhenHighlighted },
      set: { $1.adjustsImageWhenHighlighted = $0; return $1 }
    )
  }

  public func attributedTitle(forState state: UIControlState) -> Lens<Object, NSAttributedString> {
    return Lens(
      view: { $0.attributedTitleForState(state) ?? NSAttributedString(string: "") },
      set: { $1.setAttributedTitle($0, forState: state); return $1 }
    )
  }

  public func backgroundColor(forState state: UIControlState) -> Lens<Object, UIColor> {
    return Lens(
      view: { _ in .clearColor() },
      set: { $1.setBackgroundColor($0, forState: state); return $1 }
    )
  }

  public var contentEdgeInsets: Lens<Object, UIEdgeInsets> {
    return Lens(
      view: { $0.contentEdgeInsets },
      set: { $1.contentEdgeInsets = $0; return $1 }
    )
  }

  public func titleColor(forState state: UIControlState) -> Lens<Object, UIColor> {
    return Lens(
      view: { $0.titleColorForState(state) ?? .clearColor() },
      set: { $1.setTitleColor($0, forState: state); return $1 }
    )
  }

  public var titleEdgeInsets: Lens<Object, UIEdgeInsets> {
    return Lens(
      view: { $0.contentEdgeInsets },
      set: { $1.contentEdgeInsets = $0; return $1 }
    )
  }

  public var titleLabel: Lens<Object, UILabel> {
    return Lens(
      view: { $0.titleLabel! },
      set: { $1 }
    )
  }

  public func titleText(forState state: UIControlState) -> Lens<Object, String> {
    return Lens(
      view: { $0.titleForState(state) ?? "" },
      set: { $1.setTitle($0, forState: state); return $1 }
    )
  }
}

extension LensType where Whole: UIButtonProtocol, Part == UILabel {
  public var font: Lens<Whole, UIFont> {
    return Whole.lens.titleLabel • Part.lens.font
  }

  public var textAlignment: Lens<Whole, NSTextAlignment> {
    return Whole.lens.titleLabel • Part.lens.textAlignment
  }
}
