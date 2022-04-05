import Prelude
import UIKit

public protocol UILabelProtocol: UIViewProtocol {
  var adjustsFontSizeToFitWidth: Bool { get set }
  var attributedText: NSAttributedString? { get set }
  var font: UIFont! { get set }
  var lineBreakMode: NSLineBreakMode { get set }
  var minimumScaleFactor: CGFloat { get set }
  var numberOfLines: Int { get set }
  var text: String? { get set }
  var textAlignment: NSTextAlignment { get set }
  var textColor: UIColor! { get set }
}

extension UILabel: UILabelProtocol {}

public extension LensHolder where Object: UILabelProtocol {
  public var adjustsFontSizeToFitWidth: Lens<Object, Bool> {
    return Lens(
      view: { $0.adjustsFontSizeToFitWidth },
      set: { $1.adjustsFontSizeToFitWidth = $0; return $1; }
    )
  }

  public var attributedText: Lens<Object, NSAttributedString?> {
    return Lens(
      view: { $0.attributedText },
      set: { $1.attributedText = $0; return $1; }
    )
  }

  public var font: Lens<Object, UIFont> {
    return Lens(
      view: { $0.font },
      set: { $1.font = $0; return $1; }
    )
  }

  public var lineBreakMode: Lens<Object, NSLineBreakMode> {
    return Lens(
      view: { $0.lineBreakMode },
      set: { $1.lineBreakMode = $0; return $1; }
    )
  }

  public var minimumScaleFactor: Lens<Object, CGFloat> {
    return Lens(
      view: { $0.minimumScaleFactor },
      set: { $1.minimumScaleFactor = $0; return $1; }
    )
  }

  public var numberOfLines: Lens<Object, Int> {
    return Lens(
      view: { $0.numberOfLines },
      set: { $1.numberOfLines = $0; return $1; }
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
