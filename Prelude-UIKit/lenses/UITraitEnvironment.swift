import Prelude
import UIKit

public protocol UITraitEnvironmentProtocol: NSObjectProtocol {
  var traitCollection: UITraitCollection { get }
}

extension UITraitEnvironmentProtocol {
  public static func displayScale(f: CGFloat -> (Self -> Self)) -> (Self -> Self) {
    return { f($0.traitCollection.displayScale)($0) }
  }

  public static func forceTouchCapability(f: UIForceTouchCapability -> (Self -> Self)) -> (Self -> Self) {
    return { f($0.traitCollection.forceTouchCapability)($0) }
  }

  public static func horizontalSizeClass(f: UIUserInterfaceSizeClass -> (Self -> Self)) -> (Self -> Self) {
    return { f($0.traitCollection.horizontalSizeClass)($0) }
  }

  public static func userInterfaceIdiom(f: UIUserInterfaceIdiom -> (Self -> Self)) -> (Self -> Self) {
    return { f($0.traitCollection.userInterfaceIdiom)($0) }
  }

  public static func verticalSizeClass(f: UIUserInterfaceSizeClass -> (Self -> Self)) -> (Self -> Self) {
    return {  f($0.traitCollection.verticalSizeClass)($0) }
  }
}
