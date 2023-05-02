import Prelude
import UIKit

public protocol UITraitEnvironmentProtocol: NSObjectProtocol {
  var traitCollection: UITraitCollection { get }
}
