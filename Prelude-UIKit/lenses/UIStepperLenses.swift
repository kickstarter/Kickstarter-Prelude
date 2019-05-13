#if os(iOS)
import Prelude
import UIKit

public protocol UIStepperProtocol: UIControlProtocol {
  func decrementImage(for state: UIControl.State) -> UIImage?
  func incrementImage(for state: UIControl.State) -> UIImage?
  func setDecrementImage(_ image: UIImage?, for: UIControl.State)
  func setIncrementImage(_ image: UIImage?, for: UIControl.State)
}

extension UIStepper: UIStepperProtocol { }

public extension LensHolder where Object: UIStepperProtocol {
  public func decrementImage(for state: UIControl.State) -> Lens<Object, UIImage?> {
    return Lens(
      view: { $0.decrementImage(for: state) },
      set: { $1.setDecrementImage($0, for: state); return $1 }
    )
  }

  public func incrementImage(for state: UIControl.State) -> Lens<Object, UIImage?> {
    return Lens(
      view: { $0.incrementImage(for: state) },
      set: { $1.setIncrementImage($0, for: state); return $1 }
    )
  }
}
#endif
