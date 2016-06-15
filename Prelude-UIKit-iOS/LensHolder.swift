import Foundation

public protocol LensObject: class {}

extension NSObject: LensObject {}

public struct LensHolder <Object: LensObject> {}

public extension LensObject {
  public static var lens: LensHolder<Self> {
    return LensHolder()
  }
}
