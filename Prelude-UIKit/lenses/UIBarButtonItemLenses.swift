// swiftlint:disable type_name
import Prelude
import UIKit

public protocol UIBarButtonItemProtocol: UIBarItemProtocol {
  var style: UIBarButtonItemStyle { get set }
  var width: CGFloat { get set }
  var possibleTitles: Set<String>? { get set }
  var customView: UIView? { get set }
  var action: Selector { get set }
  var target: AnyObject? { get set }
  func setBackgroundImage(backgroundImage: UIImage?, forState state: UIControlState, barMetrics: UIBarMetrics)
  func backgroundImageForState(state: UIControlState, barMetrics: UIBarMetrics) -> UIImage?
  func setBackgroundImage(backgroundImage: UIImage?, forState state: UIControlState,
                          style: UIBarButtonItemStyle, barMetrics: UIBarMetrics)
  func backgroundImageForState(state: UIControlState, style: UIBarButtonItemStyle, barMetrics: UIBarMetrics)
    -> UIImage?
  var tintColor: UIColor? { get set }
  func setBackgroundVerticalPositionAdjustment(adjustment: CGFloat, forBarMetrics barMetrics: UIBarMetrics)
  func backgroundVerticalPositionAdjustmentForBarMetrics(barMetrics: UIBarMetrics) -> CGFloat
  func setTitlePositionAdjustment(adjustment: UIOffset, forBarMetrics barMetrics: UIBarMetrics)
  func titlePositionAdjustmentForBarMetrics(barMetrics: UIBarMetrics) -> UIOffset
  func setBackButtonBackgroundImage(backgroundImage: UIImage?, forState state: UIControlState,
                                    barMetrics: UIBarMetrics)
  func backButtonBackgroundImageForState(state: UIControlState, barMetrics: UIBarMetrics) -> UIImage?
  func setBackButtonTitlePositionAdjustment(adjustment: UIOffset, forBarMetrics barMetrics: UIBarMetrics)
  func backButtonTitlePositionAdjustmentForBarMetrics(barMetrics: UIBarMetrics) -> UIOffset
  func setBackButtonBackgroundVerticalPositionAdjustment(adjustment: CGFloat,
                                                         forBarMetrics barMetrics: UIBarMetrics)
  func backButtonBackgroundVerticalPositionAdjustmentForBarMetrics(barMetrics: UIBarMetrics) -> CGFloat
}

extension UIBarButtonItem: UIBarButtonItemProtocol {}

public extension LensHolder where Object: UIBarButtonItem {
  public var style: Lens<Object, UIBarButtonItemStyle> {
    return Lens(
      view: { $0.style },
      set: { $1.style = $0; return $1 }
    )
  }

  public var width: Lens<Object, CGFloat> {
    return Lens(
      view: { $0.width },
      set: { $1.width = $0; return $1 }
    )
  }

  public var possibleTitles: Lens<Object, Set<String>?> {
    return Lens(
      view: { $0.possibleTitles },
      set: { $1.possibleTitles = $0; return $1 }
    )
  }

  public var customView: Lens<Object, UIView?> {
    return Lens(
      view: { $0.customView },
      set: { $1.customView = $0; return $1 }
    )
  }

  public var targetAction: Lens<Object, (AnyObject, Selector)?> {
    return Lens(
      view: { item in item.target.map { ($0, item.action) } },
      set: { $1.target = $0?.0; $1.action = $0?.1 ?? $1.action; return $1 }
    )
  }

  public func backgroundImage(forState state: UIControlState, barMetrics: UIBarMetrics)
    -> Lens<Object, UIImage?> {

      return Lens(
        view: { $0.backgroundImageForState(state, barMetrics: barMetrics) },
        set: { $1.setBackgroundImage($0, forState: state, barMetrics: barMetrics); return $1 }
      )
  }

  public func backgroundImage(forState state: UIControlState, style: UIBarButtonItemStyle,
                                       barMetrics: UIBarMetrics) -> Lens<Object, UIImage?> {
    return Lens(
      view: { $0.backgroundImageForState(state, style: style, barMetrics: barMetrics) },
      set: { $1.setBackgroundImage($0, forState: state, style: style, barMetrics: barMetrics); return $1 }
    )
  }

  public var tintColor: Lens<Object, UIColor?> {
    return Lens(
      view: { $0.tintColor },
      set: { $1.tintColor = $0; return $1 }
    )
  }

  public func backgroundVerticalPositionAdjustment(forBarMetrics barMetrics: UIBarMetrics)
    -> Lens<Object, CGFloat> {

      return Lens(
        view: { $0.backgroundVerticalPositionAdjustmentForBarMetrics(barMetrics) },
        set: { $1.setBackgroundVerticalPositionAdjustment($0, forBarMetrics: barMetrics); return $1 }
      )
  }

  public func titlePositionAdjustment(forBarMetrics barMetrics: UIBarMetrics) -> Lens<Object, UIOffset> {
    return Lens(
      view: { $0.titlePositionAdjustmentForBarMetrics(barMetrics) },
      set: { $1.setTitlePositionAdjustment($0, forBarMetrics: barMetrics); return $1 }
    )
  }

  public func backButtonBackgroundImage(forState state: UIControlState, barMetrics: UIBarMetrics)
    -> Lens<Object, UIImage?> {

      return Lens(
        view: { $0.backButtonBackgroundImageForState(state, barMetrics: barMetrics) },
        set: { $1.setBackButtonBackgroundImage($0, forState: state, barMetrics: barMetrics); return $1 }
      )
  }

  public func backButtonTitlePositionAdjustment(forBarMetrics barMetrics: UIBarMetrics)
    -> Lens<Object, UIOffset> {

      return Lens(
        view: { $0.backButtonTitlePositionAdjustmentForBarMetrics(barMetrics) },
        set: { $1.setBackButtonTitlePositionAdjustment($0, forBarMetrics: barMetrics); return $1 }
      )
  }

  public func backButtonBackgroundVerticalPositionAdjustment(forBarMetrics barMetrics: UIBarMetrics)
    -> Lens<Object, CGFloat> {

      return Lens(
        view: { $0.backButtonBackgroundVerticalPositionAdjustmentForBarMetrics(barMetrics) },
        set: {
          $1.setBackButtonBackgroundVerticalPositionAdjustment($0, forBarMetrics: barMetrics)
          return $1
        }
      )
  }
}
