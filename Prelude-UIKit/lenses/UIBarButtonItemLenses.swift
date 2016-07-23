// swiftlint:disable type_name
import Prelude
import UIKit

public protocol UIBarButtonItemProtocol: UIBarItemProtocol {
  var style: UIBarButtonItemStyle { get set }
  var width: CGFloat { get set }
  var possibleTitles: Set<String>? { get set }
  var customView: UIView? { get set }
  var action: Selector? { get set }
  var target: AnyObject? { get set }
  func setBackgroundImage(_ backgroundImage: UIImage?, forState state: UIControlState, barMetrics: UIBarMetrics)
  func backgroundImageForState(_ state: UIControlState, barMetrics: UIBarMetrics) -> UIImage?
  func setBackgroundImage(_ backgroundImage: UIImage?, forState state: UIControlState,
                          style: UIBarButtonItemStyle, barMetrics: UIBarMetrics)
  func backgroundImageForState(_ state: UIControlState, style: UIBarButtonItemStyle, barMetrics: UIBarMetrics)
    -> UIImage?
  var tintColor: UIColor? { get set }
  func setBackgroundVerticalPositionAdjustment(_ adjustment: CGFloat, forBarMetrics barMetrics: UIBarMetrics)
  func backgroundVerticalPositionAdjustmentForBarMetrics(_ barMetrics: UIBarMetrics) -> CGFloat
  func setTitlePositionAdjustment(_ adjustment: UIOffset, forBarMetrics barMetrics: UIBarMetrics)
  func titlePositionAdjustmentForBarMetrics(_ barMetrics: UIBarMetrics) -> UIOffset
  func setBackButtonBackgroundImage(_ backgroundImage: UIImage?, forState state: UIControlState,
                                    barMetrics: UIBarMetrics)
  func backButtonBackgroundImageForState(_ state: UIControlState, barMetrics: UIBarMetrics) -> UIImage?
  func setBackButtonTitlePositionAdjustment(_ adjustment: UIOffset, forBarMetrics barMetrics: UIBarMetrics)
  func backButtonTitlePositionAdjustmentForBarMetrics(_ barMetrics: UIBarMetrics) -> UIOffset
  func setBackButtonBackgroundVerticalPositionAdjustment(_ adjustment: CGFloat,
                                                         forBarMetrics barMetrics: UIBarMetrics)
  func backButtonBackgroundVerticalPositionAdjustmentForBarMetrics(_ barMetrics: UIBarMetrics) -> CGFloat
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

  public var action: Lens<Object, Selector?> {
    return Lens(
      view: { $0.action },
      set: { $1.action = $0; return $1 }
    )
  }

  public var target: Lens<Object, AnyObject?> {
    return Lens(
      view: { $0.target },
      set: { $1.target = $0; return $1 }
    )
  }

  public func backgroundImage(forState state: UIControlState, barMetrics: UIBarMetrics)
    -> Lens<Object, UIImage?> {

      return Lens(
        view: { $0.backgroundImage(for: state, barMetrics: barMetrics) },
        set: { $1.setBackgroundImage($0, for: state, barMetrics: barMetrics); return $1 }
      )
  }

  public func backgroundImage(forState state: UIControlState, style: UIBarButtonItemStyle,
                                       barMetrics: UIBarMetrics) -> Lens<Object, UIImage?> {
    return Lens(
      view: { $0.backgroundImage(for: state, style: style, barMetrics: barMetrics) },
      set: { $1.setBackgroundImage($0, for: state, style: style, barMetrics: barMetrics); return $1 }
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
        view: { $0.backgroundVerticalPositionAdjustment(for: barMetrics) },
        set: { $1.setBackgroundVerticalPositionAdjustment($0, for: barMetrics); return $1 }
      )
  }

  public func titlePositionAdjustment(forBarMetrics barMetrics: UIBarMetrics) -> Lens<Object, UIOffset> {
    return Lens(
      view: { $0.titlePositionAdjustment(for: barMetrics) },
      set: { $1.setTitlePositionAdjustment($0, for: barMetrics); return $1 }
    )
  }

  public func backButtonBackgroundImage(forState state: UIControlState, barMetrics: UIBarMetrics)
    -> Lens<Object, UIImage?> {

      return Lens(
        view: { $0.backButtonBackgroundImage(for: state, barMetrics: barMetrics) },
        set: { $1.setBackButtonBackgroundImage($0, for: state, barMetrics: barMetrics); return $1 }
      )
  }

  public func backButtonTitlePositionAdjustment(forBarMetrics barMetrics: UIBarMetrics)
    -> Lens<Object, UIOffset> {

      return Lens(
        view: { $0.backButtonTitlePositionAdjustment(for: barMetrics) },
        set: { $1.setBackButtonTitlePositionAdjustment($0, for: barMetrics); return $1 }
      )
  }

  public func backButtonBackgroundVerticalPositionAdjustment(forBarMetrics barMetrics: UIBarMetrics)
    -> Lens<Object, CGFloat> {

      return Lens(
        view: { $0.backButtonBackgroundVerticalPositionAdjustment(for: barMetrics) },
        set: {
          $1.setBackButtonBackgroundVerticalPositionAdjustment($0, for: barMetrics)
          return $1
        }
      )
  }
}
