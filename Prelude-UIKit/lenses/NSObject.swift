import Prelude
import UIKit

public protocol KSObjectProtocol: NSObjectProtocol {
  var accessibilityElementsHidden: Bool { get set }
  var accessibilityElements: [Any]? { get set }
  var accessibilityHint: String? { get set }
  var accessibilityLabel: String? { get set }
  var accessibilityNavigationStyle: UIAccessibilityNavigationStyle { get set }
  var accessibilityTraits: UIAccessibilityTraits { get set }
  var accessibilityValue: String? { get set }
  var isAccessibilityElement: Bool { get set }
  var shouldGroupAccessibilityChildren: Bool { get set }
}
