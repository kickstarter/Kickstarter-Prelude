import UIKit

/**
 Creates a controller with a specified trait collection.

 - parameter traits: The traits to use for the controller.

 - returns: Two controllers: a root controller that can be set to the playground's live view, and a content
 controller which should have UI elements added to it
 */
public func traitsController(traits: UITraitCollection)
  -> (root: UIViewController, content: UIViewController) {

    let parent = UIViewController()
    parent.view.translatesAutoresizingMaskIntoConstraints = false

    let child = UIViewController()
    child.view.translatesAutoresizingMaskIntoConstraints = false

    parent.addChildViewController(child)
    parent.view.addSubview(child.view)

    child.view.topAnchor.constraintEqualToAnchor(parent.topLayoutGuide.topAnchor).active = true
    child.view.leadingAnchor.constraintEqualToAnchor(parent.view.leadingAnchor).active = true
    child.view.bottomAnchor.constraintEqualToAnchor(parent.topLayoutGuide.bottomAnchor).active = true
    child.view.trailingAnchor.constraintEqualToAnchor(parent.view.trailingAnchor).active = true

    switch traits.userInterfaceIdiom {
    case .Phone:
      parent.view.frame = .init(x: 0, y: 0, width: 375, height: 667)
    case .Pad:
      parent.view.frame = .init(x: 0, y: 0, width: 768, height: 1024)
    default:
      parent.view.frame = .zero
    }

    parent.view.backgroundColor = .whiteColor()
    child.view.backgroundColor = .whiteColor()

    parent.setOverrideTraitCollection(traits, forChildViewController: child)

    return (parent, child)
}
