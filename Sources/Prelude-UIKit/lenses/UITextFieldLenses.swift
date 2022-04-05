import Prelude
import UIKit

public protocol UITextFieldProtocol: UIControlProtocol, UITextInputTraitsProtocol {
  var borderStyle: UITextField.BorderStyle { get set }
  var font: UIFont? { get set }
  var placeholder: String? { get set }
  var textAlignment: NSTextAlignment { get set }
  var textColor: UIColor? { get set }
  var text: String? { get set }
}

extension UITextField: UITextFieldProtocol {}

public extension LensHolder where Object: UITextFieldProtocol {

  public var borderStyle: Lens<Object, UITextField.BorderStyle> {
    return Lens(
      view: { $0.borderStyle },
      set: { $1.borderStyle = $0; return $1 }
    )
  }

  public var font: Lens<Object, UIFont?> {
    return Lens(
      view: { $0.font },
      set: { $1.font = $0; return $1 }
    )
  }

  public var placeholder: Lens<Object, String?> {
    return Lens(
      view: { $0.placeholder },
      set: { $1.placeholder = $0; return $1 }
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

  public var text: Lens<Object, String?> {
    return Lens(
      view: { $0.text },
      set: { $1.text = $0; return $1 }
    )
  }
}
