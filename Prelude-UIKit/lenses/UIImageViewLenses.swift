import Prelude
import UIKit

public protocol UIImageViewProtocol: UIViewProtocol {
  var image: UIImage? { get set }
}

extension UIImageView: UIImageViewProtocol {}

extension LensHolder where Object: UIImageViewProtocol {
  public var image: Lens<Object, UIImage?> {
    return Lens(
      view: { $0.image },
      set: { $1.image = $0; return $1 }
    )
  }
}
