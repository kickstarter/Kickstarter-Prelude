import Prelude
import UIKit

public protocol UITableViewProtocol: UIViewProtocol {
  var allowsMultipleSelection: Bool { get set }
  var allowsMultipleSelectionDuringEditing: Bool { get set }
  var allowsSelection: Bool { get set }
  var allowsSelectionDuringEditing: Bool { get set }
  var backgroundView: UIView? { get set }
  var estimatedRowHeight: CGFloat { get set }
  var rowHeight: CGFloat { get set }
  var separatorInset: UIEdgeInsets { get set }
  #if os(iOS)
  var separatorColor: UIColor? { get set }
  var separatorEffect: UIVisualEffect? { get set }
  var separatorStyle: UITableViewCell.SeparatorStyle { get set }
  #endif
}

extension UITableView: UITableViewProtocol {}

public extension LensHolder where Object: UITableViewProtocol {

  public var allowsMultipleSelection: Lens<Object, Bool> {
    return Lens(
      view: { $0.allowsMultipleSelection },
      set: { $1.allowsMultipleSelection = $0; return $1 }
    )
  }

  public var allowsMultipleSelectionDuringEditing: Lens<Object, Bool> {
    return Lens(
      view: { $0.allowsMultipleSelectionDuringEditing },
      set: { $1.allowsMultipleSelectionDuringEditing = $0; return $1 }
    )
  }

  public var allowsSelection: Lens<Object, Bool> {
    return Lens(
      view: { $0.allowsSelection },
      set: { $1.allowsSelection = $0; return $1 }
    )
  }

  public var allowsSelectionDuringEditing: Lens<Object, Bool> {
    return Lens(
      view: { $0.allowsSelectionDuringEditing },
      set: { $1.allowsSelectionDuringEditing = $0; return $1 }
    )
  }

  public var backgroundView: Lens<Object, UIView?> {
    return Lens(
      view: { $0.backgroundView },
      set: { $1.backgroundView = $0; return $1 }
    )
  }

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

  public var separatorInset: Lens<Object, UIEdgeInsets> {
    return Lens(
      view: { $0.separatorInset },
      set: { $1.separatorInset = $0; return $1 }
    )
  }

  #if os(iOS)
  public var separatorColor: Lens<Object, UIColor?> {
    return Lens(
      view: { $0.separatorColor },
      set: { $1.separatorColor = $0; return $1 }
    )
  }

  public var separatorEffect: Lens<Object, UIVisualEffect?> {
    return Lens(
      view: { $0.separatorEffect },
      set: { $1.separatorEffect = $0; return $1 }
    )
  }

  public var separatorStyle: Lens<Object, UITableViewCell.SeparatorStyle> {
    return Lens(
      view: { $0.separatorStyle },
      set: { $1.separatorStyle = $0; return $1 }
    )
  }
  #endif
}
