import Foundation
import Prelude

public protocol LensObject: class {}

extension NSObject: LensObject {}

public struct LensHolder <Object: LensObject> {}

public extension LensObject {
  public static var lens: LensHolder<Self> {
    return LensHolder()
  }
}

public extension LensHolder where Object: NSObjectProtocol {
  public var reflect: Lens<Object, Object> {
    return Lens(view: { $0 }, set: { part, _ in part })
  }
}
