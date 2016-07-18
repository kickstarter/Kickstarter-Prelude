import Prelude
import UIKit

public protocol NSTextContainerProtocol: KSObjectProtocol {
  var lineFragmentPadding: CGFloat { get set }
}

extension NSTextContainer: NSTextContainerProtocol {}

public extension LensHolder where Object: NSTextContainerProtocol {
  public var lineFragmentPadding: Lens<Object, CGFloat> {
    return Lens(
      view: { $0.lineFragmentPadding },
      set: { $1.lineFragmentPadding = $0; return $1 }
    )
  }
}
