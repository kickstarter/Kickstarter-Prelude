import Prelude
import UIKit

public protocol UITextViewProtocol: UIScrollViewProtocol, UITextInputTraitsProtocol {
  #if os(iOS)
  var dataDetectorTypes: UIDataDetectorTypes { get set }
  #endif
  var font: UIFont? { get set }
  var text: String! { get set }
  var textAlignment: NSTextAlignment { get set }
  var textColor: UIColor? { get set }
  var textContainer: NSTextContainer { get }
  var textContainerInset: UIEdgeInsets { get set }
}

extension UITextView: UITextViewProtocol {}

public extension LensHolder where Object: UITextViewProtocol {

  #if os(iOS)
  public var dataDetectorTypes: Lens<Object, UIDataDetectorTypes> {
    return Lens(
      view: { $0.dataDetectorTypes },
      set: { $1.dataDetectorTypes = $0; return $1 }
    )
  }
  #endif

  public var font: Lens<Object, UIFont?> {
    return Lens(
      view: { $0.font },
      set: { $1.font = $0; return $1 }
    )
  }

  public var text: Lens<Object, String> {
    return Lens(
      view: { $0.text ?? "" },
      set: { $1.text = $0; return $1 }
    )
  }

  public var textAlignment: Lens<Object, NSTextAlignment> {
    return Lens(
      view: { $0.textAlignment },
      set: { $1.textAlignment = $0; return $1 }
    )
  }

  public var textColor: Lens<Object, UIColor?> {
    return Lens(
      view: { $0.textColor },
      set: { $1.textColor = $0; return $1 }
    )
  }

  public var textContainer: Lens<Object, NSTextContainer> {
    return Lens(
      view: { $0.textContainer },
      set: { $1 }
    )
  }

  public var textContainerInset: Lens<Object, UIEdgeInsets> {
    return Lens(
      view: { $0.textContainerInset },
      set: { $1.textContainerInset = $0; return $1 }
    )
  }
}

extension Lens where Whole: UITextViewProtocol, Part == NSTextContainer {
  public var lineFragmentPadding: Lens<Whole, CGFloat> {
    return Whole.lens.textContainer..Part.lens.lineFragmentPadding
  }
}
