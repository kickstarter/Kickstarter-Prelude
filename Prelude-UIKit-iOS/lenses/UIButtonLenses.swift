// swiftlint:disable type_name
import Prelude
import UIKit

public protocol UIButtonProtocol: UIViewProtocol {
  func setBackgroundColor(backgroundColor: UIColor, forState state: UIControlState)
  var contentEdgeInsets: UIEdgeInsets { get set }
  func setTitle(title: String?, forState: UIControlState)
  func setTitleColor(color: UIColor?, forState: UIControlState)
  func titleColorForState(state: UIControlState) -> UIColor?
  var titleEdgeInsets: UIEdgeInsets { get set }
  func titleForState(state: UIControlState) -> String?
  var titleLabel: UILabel? { get }
}

extension UIButton: UIButtonProtocol {}

public extension LensHolder where Object: UIButtonProtocol {

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

  public func titleColor(state: UIControlState) -> Lens<Object, UIColor> {
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
      set: { _, button in button }
    )
  }

  public func titleText(state: UIControlState) -> Lens<Object, String> {
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
  public var textColor: Lens<Whole, UIColor> {
    return Whole.lens.titleLabel • Part.lens.textColor
  }
}
