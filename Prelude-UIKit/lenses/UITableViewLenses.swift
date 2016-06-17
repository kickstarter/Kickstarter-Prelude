import Prelude
import UIKit

public protocol UITableViewProtocol: UIViewProtocol {
  var estimatedRowHeight: CGFloat { get set }
  var rowHeight: CGFloat { get set }
  var separatorStyle: UITableViewCellSeparatorStyle { get set }
}

extension UITableView: UITableViewProtocol {}

public extension LensHolder where Object: UITableViewProtocol {

  public var estimatedRowHeight: Lens<Object, CGFloat> {
    return Lens(
      view: { $0.estimatedRowHeight },
      set: { $1.estimatedRowHeight = $0; return $1 }
    )
  }

  public var rowHeight: Lens<Object, CGFloat> {
    return Lens(
      view: { $0.rowHeight },
      set: { $1.rowHeight = $0; return $1 }
    )
  }

  public var separatorStyle: Lens<Object, UITableViewCellSeparatorStyle> {
    return Lens(
      view: { $0.separatorStyle },
      set: { $1.separatorStyle = $0; return $1 }
    )
  }

}
