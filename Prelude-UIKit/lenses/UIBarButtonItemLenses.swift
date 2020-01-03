import Prelude
import UIKit

public protocol UIBarButtonItemProtocol: UIBarItemProtocol {
  var style: UIBarButtonItem.Style { get set }
  var width: CGFloat { get set }
  var possibleTitles: Set<String>? { get set }
  var customView: UIView? { get set }
  var action: Selector? { get set }
  var target: AnyObject? { get set }
  func setBackgroundImage(_ backgroundImage: UIImage?, for state: UIControl.State, barMetrics: UIBarMetrics)
  func backgroundImage(for state: UIControl.State, barMetrics: UIBarMetrics) -> UIImage?
  func setBackgroundImage(_ backgroundImage: UIImage?, for state: UIControl.State,
                          style: UIBarButtonItem.Style, barMetrics: UIBarMetrics)
  func backgroundImage(for state: UIControl.State, style: UIBarButtonItem.Style, barMetrics: UIBarMetrics)
    -> UIImage?
  var tintColor: UIColor? { get set }
  func setBackgroundVerticalPositionAdjustment(_ adjustment: CGFloat, for barMetrics: UIBarMetrics)
  func backgroundVerticalPositionAdjustment(for barMetrics: UIBarMetrics) -> CGFloat
  func setTitlePositionAdjustment(_ adjustment: UIOffset, for barMetrics: UIBarMetrics)
  func titlePositionAdjustment(for barMetrics: UIBarMetrics) -> UIOffset
  func setBackButtonBackgroundImage(_ backgroundImage: UIImage?, for state: UIControl.State,
                                    barMetrics: UIBarMetrics)
  func backButtonBackgroundImage(for state: UIControl.State, barMetrics: UIBarMetrics) -> UIImage?
  func setBackButtonTitlePositionAdjustment(_ adjustment: UIOffset, for barMetrics: UIBarMetrics)
  func backButtonTitlePositionAdjustment(for barMetrics: UIBarMetrics) -> UIOffset
  func setBackButtonBackgroundVerticalPositionAdjustment(_ adjustment: CGFloat, for barMetrics: UIBarMetrics)
  func backButtonBackgroundVerticalPositionAdjustment(for barMetrics: UIBarMetrics) -> CGFloat
}

extension UIBarButtonItem: UIBarButtonItemProtocol {}

public extension LensHolder where Object: UIBarButtonItemProtocol {
  public var style: Lens<Object, UIBarButtonItem.Style> {
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
      view: { item in
        guard let target = item.target, let action = item.action else { return nil }
        return (target, action)
      },
      set: { $1.target = $0?.0; $1.action = $0?.1 ?? $1.action; return $1 }
    )
  }

  public func backgroundImage(forState state: UIControl.State, barMetrics: UIBarMetrics)
    -> Lens<Object, UIImage?> {

      return Lens(
        view: { $0.backgroundImage(for: state, barMetrics: barMetrics) },
        set: { $1.setBackgroundImage($0, for: state, barMetrics: barMetrics); return $1 }
      )
  }

  public func backgroundImage(forState state: UIControl.State,
                              style: UIBarButtonItem.Style,
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

  public func backButtonBackgroundImage(forState state: UIControl.State, barMetrics: UIBarMetrics)
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
