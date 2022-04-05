import Prelude
import UIKit

public protocol UITableViewCellProtocol: UIViewProtocol {
  var contentView: UIView { get }
  var selectionStyle: UITableViewCell.SelectionStyle { get set }
}

extension UITableViewCell: UITableViewCellProtocol {}

public extension LensHolder where Object: UITableViewCellProtocol {
  public var contentView: Lens<Object, UIView> {
    return Lens(
      view: { $0.contentView },
      set: { return $1 }
    )
  }

  public var selectionStyle: Lens<Object, UITableViewCell.SelectionStyle> {
    return Lens(
      view: { $0.selectionStyle },
      set: { $1.selectionStyle = $0; return $1 }
    )
  }
}

extension Lens where Whole: UITableViewCellProtocol, Part == UIView {
  public var layoutMargins: Lens<Whole, UIEdgeInsets> {
    return Whole.lens.contentView..Part.lens.layoutMargins
  }
}
