import Prelude
import UIKit

public protocol NSMutableParagraphStyleProtocol: NSObjectProtocol {
  var alignment: NSTextAlignment { get set }
}

extension NSMutableParagraphStyle: NSMutableParagraphStyleProtocol {}

extension LensHolder where Object: NSMutableParagraphStyleProtocol {
  public var alignment: Lens<Object, NSTextAlignment> {
    return Lens(
      view: { $0.alignment },
      set: { $1.alignment = $0; return $1 })
  }
}
