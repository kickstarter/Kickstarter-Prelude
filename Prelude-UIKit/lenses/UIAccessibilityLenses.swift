import Prelude
import UIKit

// UIAccessibility
public extension LensHolder where Object: KSObjectProtocol {
  public var isAccessibilityElement: Lens<Object, Bool> {
    return Lens(
      view: { $0.isAccessibilityElement },
      set: { $1.isAccessibilityElement = $0; return $1 }
    )
  }

  public var accessibilityElementsHidden: Lens<Object, Bool> {
    return Lens(
      view: { $0.accessibilityElementsHidden },
      set: { $1.accessibilityElementsHidden = $0; return $1 }
    )
  }

  public var accessibilityHint: Lens<Object, String?> {
    return Lens(
      view: { $0.accessibilityHint },
      set: { $1.accessibilityHint = $0; return $1 }
    )
  }

  public var accessibilityLabel: Lens<Object, String?> {
    return Lens(
      view: { $0.accessibilityLabel },
      set: { $1.accessibilityLabel = $0; return $1 }
    )
  }

  public var accessibilityTraits: Lens<Object, UIAccessibilityTraits> {
    return Lens(
      view: { $0.accessibilityTraits },
      set: { $1.accessibilityTraits = $0; return $1 }
    )
  }

  public var accessibilityValue: Lens<Object, String?> {
    return Lens(
      view: { $0.accessibilityValue },
      set: { $1.accessibilityValue = $0; return $1 }
    )
  }

  public var shouldGroupAccessibilityChildren: Lens<Object, Bool> {
    return Lens(
      view: { $0.shouldGroupAccessibilityChildren },
      set: { $1.shouldGroupAccessibilityChildren = $0; return $1 }
    )
  }

  public var accessibilityNavigationStyle: Lens<Object, UIAccessibilityNavigationStyle> {
    return Lens(
      view: { $0.accessibilityNavigationStyle },
      set: { $1.accessibilityNavigationStyle = $0; return $1 }
    )
  }
}

// UIAccessibilityContainer
public extension LensHolder where Object: NSObject {
  public var accessibilityElements: Lens<Object, [Any]?> {
    return Lens(
      view: { $0.accessibilityElements },
      set: { $1.accessibilityElements = $0; return $1 }
    )
  }
}
