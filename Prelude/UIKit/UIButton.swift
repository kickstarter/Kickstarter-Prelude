// swiftlint:disable type_name
import UIKit

public protocol UIButtonProtocol: UIViewProtocol {
  var titleLabel: UILabel? { get }
}

extension UIButton: UIButtonProtocol {}



extension UIButton {
  public enum lens {
    public static let titleLabel = Lens<UIButton, UILabel>(
      view: { $0.titleLabel! },
      set: { _, button in button }
    )

    public static func titleText(state: UIControlState) -> Lens<UIButton, String> {
      return Lens(
        view: { $0.titleForState(state) ?? "" },
        set: { $1.setTitle($0, forState: state); return $1 }
      )
    }

    public static func titleColor(state: UIControlState) -> Lens<UIButton, UIColor> {
      return Lens(
        view: { $0.titleColorForState(state) ?? .clearColor() },
        set: { $1.setTitleColor($0, forState: state); return $1 }
      )
    }
  }
}
