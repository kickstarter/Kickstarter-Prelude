import Foundation
import Prelude

public protocol LensObject {}

extension NSObject: LensObject {}

public struct LensHolder <Object: LensObject> {}

public extension LensObject {
  public static var lens: LensHolder<Self> {
    return LensHolder()
  }
}
