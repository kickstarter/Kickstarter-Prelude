import Prelude
import UIKit

public protocol UIButtonProtocol: UIControlProtocol {
  var adjustsImageWhenDisabled: Bool { get set }
  var adjustsImageWhenHighlighted: Bool { get set }
  func attributedTitle(for state: UIControlState) -> NSAttributedString?
  func backgroundImage(for state: UIControlState) -> UIImage?
  var contentEdgeInsets: UIEdgeInsets { get set }
  var imageEdgeInsets: UIEdgeInsets { get set }
  func image(for state: UIControlState) -> UIImage?
  var imageView: UIImageView? { get }
  func setAttributedTitle(_ title: NSAttributedString?,
                          forState state: UIControlState)
  func setBackgroundColor(_ backgroundColor: UIColor, forState state: UIControlState)
  func setBackgroundImage(_ backgroundImage: UIImage?, forState state: UIControlState)
  func setImage(_ image: UIImage?, forState: UIControlState)
  func setTitle(_ title: String?, forState: UIControlState)
  func setTitleColor(_ color: UIColor?, forState: UIControlState)
  func titleColor(for state: UIControlState) -> UIColor?
  var titleEdgeInsets: UIEdgeInsets { get set }
  func title(for state: UIControlState) -> String?
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
      view: { $0.attributedTitle(for: state) ?? NSAttributedString(string: "") },
      set: { $1.setAttributedTitle($0, forState: state); return $1 }
    )
  }

  public func backgroundColor(forState state: UIControlState) -> Lens<Object, UIColor> {
    return Lens(
      view: { _ in .clear },
      set: { $1.setBackgroundColor($0, forState: state); return $1 }
    )
  }

  public func backgroundImage(forState state: UIControlState) -> Lens<Object, UIImage?> {
    return Lens(
      view: { $0.backgroundImage(for: state) },
      set: { $1.setBackgroundImage($0, forState: state); return $1 }
    )
  }

  public var contentEdgeInsets: Lens<Object, UIEdgeInsets> {
    return Lens(
      view: { $0.contentEdgeInsets },
      set: { $1.contentEdgeInsets = $0; return $1 }
    )
  }

  public var imageEdgeInsets: Lens<Object, UIEdgeInsets> {
    return Lens(
      view: { $0.imageEdgeInsets },
      set: { $1.imageEdgeInsets = $0; return $1 }
    )
  }

  public func image(forState state: UIControlState) -> Lens<Object, UIImage?> {
    return Lens(
      view: { $0.image(for: state) },
      set: { $1.setImage($0, forState: state); return $1 }
    )
  }

  public var imageView: Lens<Object, UIImageView?> {
    return Lens(
      view: { $0.imageView },
      set: { $1 }
    )
  }

  public func titleColor(forState state: UIControlState) -> Lens<Object, UIColor> {
    return Lens(
      view: { $0.titleColor(for: state) ?? .clear },
      set: { $1.setTitleColor($0, forState: state); return $1 }
    )
  }

  public var titleEdgeInsets: Lens<Object, UIEdgeInsets> {
    return Lens(
      view: { $0.titleEdgeInsets },
      set: { $1.titleEdgeInsets = $0; return $1 }
    )
  }

  public var titleLabel: Lens<Object, UILabel> {
    return Lens(
      view: { $0.titleLabel! },
      set: { $1 }
    )
  }

  public func title(forState state: UIControlState) -> Lens<Object, String?> {
    return Lens(
      view: { $0.title(for: state) },
      set: { $1.setTitle($0, forState: state); return $1 }
    )
  }
}

extension Lens where Whole: UIButtonProtocol, Part == UILabel {
  public var font: Lens<Whole, UIFont> {
    return Whole.lens.titleLabel..Part.lens.font
  }

  public var textAlignment: Lens<Whole, NSTextAlignment> {
    return Whole.lens.titleLabel..Part.lens.textAlignment
  }
}
