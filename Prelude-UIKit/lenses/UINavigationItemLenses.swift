import Prelude
import UIKit

public protocol UINavigationItemProtocol: KSObjectProtocol {}

extension UINavigationItem: UINavigationItemProtocol {}

public extension LensHolder where Object: UINavigationItemProtocol {}
