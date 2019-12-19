import Prelude
import UIKit

public protocol UITableViewControllerProtocol: UIViewControllerProtocol {
  var tableView: UITableView! { get set }
}

extension UITableViewController: UITableViewControllerProtocol {}

public extension LensHolder where Object: UITableViewControllerProtocol {

  public var tableView: Lens<Object, UITableView> {
    return Lens(
      view: { $0.tableView },
      set: { $1.tableView = $0; return $1 }
    )
  }
}

extension Lens where Whole: UITableViewControllerProtocol, Part == UITableView {

  public var rowHeight: Lens<Whole, CGFloat> {
    return Whole.lens.tableView..Part.lens.rowHeight
  }

  public var estimatedRowHeight: Lens<Whole, CGFloat> {
    return Whole.lens.tableView..Part.lens.estimatedRowHeight
  }

  #if os(iOS)
  public var separatorStyle: Lens<Whole, UITableViewCell.SeparatorStyle> {
    return Whole.lens.tableView..Part.lens.separatorStyle
  }
  #endif
}
