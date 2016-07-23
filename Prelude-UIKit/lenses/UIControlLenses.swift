// swiftlint:disable type_name
import Prelude
import UIKit

public typealias TargetSelectorControlEvent = (NSObject, Selector, UIControlEvents)

public protocol UIControlProtocol: UIViewProtocol {
  func actions(forTarget target: AnyObject?, forControlEvent controlEvent: UIControlEvents) -> [String]?
  func addTarget(_ target: AnyObject?, action: Selector, forControlEvents controlEvents: UIControlEvents)
  func allControlEvents() -> UIControlEvents
  func allTargets() -> Set<NSObject>
  var contentHorizontalAlignment: UIControlContentHorizontalAlignment { get set }
  var contentVerticalAlignment: UIControlContentVerticalAlignment { get set }
  var enabled: Bool { get set }
  var highlighted: Bool { get set }
  func removeTarget(_ target: AnyObject?, action: Selector?, for controlEvents: UIControlEvents)
  var selected: Bool { get set }
}

extension UIControl: UIControlProtocol {}

public extension LensHolder where Object: UIControlProtocol {

  public var targets: Lens<Object, [TargetSelectorControlEvent]> {
    return Lens(
      view: allTargetsSelectorsAndEvents(forControl:),
      set: { targets, control in
        control.removeTarget(nil, action: nil, for: .allEvents)
        targets.forEach(control.addTarget(_:action:forControlEvents:))
        return control
      }
    )
  }

  public var contentHorizontalAlignment: Lens<Object, UIControlContentHorizontalAlignment> {
    return Lens(
      view: { $0.contentHorizontalAlignment },
      set: { $1.contentHorizontalAlignment = $0; return $1 }
    )
  }

  public var contentVerticalAlignment: Lens<Object, UIControlContentVerticalAlignment> {
    return Lens(
      view: { $0.contentVerticalAlignment },
      set: { $1.contentVerticalAlignment = $0; return $1 }
    )
  }

  public var enabled: Lens<Object, Bool> {
    return Lens(
      view: { $0.enabled },
      set: { $1.enabled = $0; return $1 }
    )
  }

  public var highlighted: Lens<Object, Bool> {
    return Lens(
      view: { $0.highlighted },
      set: { $1.highlighted = $0; return $1 }
    )
  }

  public var selected: Lens<Object, Bool> {
    return Lens(
      view: { $0.selected },
      set: { $1.selected = $0; return $1 }
    )
  }
}

/**
 Recovers a full list of targets, actions and events for a control.

 - parameter control: The control.

 - returns: An array of a tuple of target, selector and event.
 */
private func allTargetsSelectorsAndEvents(forControl control: UIControlProtocol)
  -> [TargetSelectorControlEvent] {

    return control.allControlEvents().rawValue.bitComponents()
      .map(UIControlEvents.init(rawValue:))
      .flatMap { event in
        control.allTargets()
          .flatMap { target in
            (control.actions(forTarget: target, forControlEvent: event) ?? [])
              .map { action in
                return (target, Selector(action), event)
            }
        }
    }
}

extension UInt {
  /**
   - returns: An array of bitmask values for an integer.
   */
  private func bitComponents() -> [UInt] {
    let range: CountableRange<UInt> = 0 ..< UInt(8 * sizeof(UInt))
    return range
      .map { 1 << $0 }
      .filter { self & $0 != 0 }
  }
}
