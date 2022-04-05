import Prelude
import UIKit

public protocol UITextInputTraitsProtocol: NSObjectProtocol {
  var autocapitalizationType: UITextAutocapitalizationType { get set }
  var autocorrectionType: UITextAutocorrectionType { get set }
  var keyboardAppearance: UIKeyboardAppearance { get set }
  var keyboardType: UIKeyboardType { get set }
  var returnKeyType: UIReturnKeyType { get set }
  var isSecureTextEntry: Bool { get set }
  var spellCheckingType: UITextSpellCheckingType { get set }
}

public extension LensHolder where Object: UITextInputTraitsProtocol {
  public var autocapitalizationType: Lens<Object, UITextAutocapitalizationType> {
    return Lens(
      view: { $0.autocapitalizationType },
      set: { $1.autocapitalizationType = $0; return $1 }
    )
  }

  public var autocorrectionType: Lens<Object, UITextAutocorrectionType> {
    return Lens(
      view: { $0.autocorrectionType },
      set: { $1.autocorrectionType = $0; return $1 }
    )
  }

  public var keyboardAppearance: Lens<Object, UIKeyboardAppearance> {
    return Lens(
      view: { $0.keyboardAppearance },
      set: { $1.keyboardAppearance = $0; return $1 }
    )
  }

  public var keyboardType: Lens<Object, UIKeyboardType> {
    return Lens(
      view: { $0.keyboardType },
      set: { $1.keyboardType = $0; return $1 }
    )
  }

  public var returnKeyType: Lens<Object, UIReturnKeyType> {
    return Lens(
      view: { $0.returnKeyType },
      set: { $1.returnKeyType = $0; return $1 }
    )
  }

  public var secureTextEntry: Lens<Object, Bool> {
    return Lens(
      view: { $0.isSecureTextEntry },
      set: { $1.isSecureTextEntry = $0; return $1 }
    )
  }

  public var spellCheckingType: Lens<Object, UITextSpellCheckingType> {
    return Lens(
      view: { $0.spellCheckingType },
      set: { $1.spellCheckingType = $0; return $1 }
    )
  }
}
