import Prelude
import UIKit

public protocol UIProgressViewProtocol: UIViewProtocol {
  var progressViewStyle: UIProgressView.Style { get set }
  var progress: Float { get set }
}

extension UIProgressView: UIProgressViewProtocol {}

public extension LensHolder where Object: UIProgressViewProtocol {

  public var progressViewStyle: Lens<Object, UIProgressView.Style> {
    return Lens(
      view: { $0.progressViewStyle },
      set: { $1.progressViewStyle = $0; return $1 }
    )
  }

  public var progress: Lens<Object, Float> {
    return Lens(
      view: { $0.progress },
      set: { $1.progress = $0; return $1 }
    )
  }
}
