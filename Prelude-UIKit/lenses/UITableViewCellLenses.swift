import Prelude
import UIKit

public protocol UITableViewCellProtocol: UIViewProtocol {
  var contentView: UIView { get }
  var selectionStyle: UITableViewCellSelectionStyle { get set }
}

extension UITableViewCell: UITableViewCellProtocol {}

public extension LensHolder where Object: UITableViewCellProtocol {
  public var contentView: Lens<Object, UIView> {
    return Lens(
      view: { $0.contentView },
      set: { return $1 }
    )
  }

  public var selectionStyle: Lens<Object, UITableViewCellSelectionStyle> {
    return Lens(
      view: { $0.selectionStyle },
      set: { $1.selectionStyle = $0; return $1 }
    )
  }
}
