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
    let child = UIViewController()

    parent.addChildViewController(child)
    parent.view.addSubview(child.view)

    child.view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]

    switch traits.userInterfaceIdiom {
    case .Phone:
      parent.view.frame = .init(x: 0, y: 0, width: 375, height: 667)
    case .Pad:
      parent.view.frame = .init(x: 0, y: 0, width: 768, height: 1024)
    default:
      parent.view.frame = .zero
    }
    child.view.frame = parent.view.frame

    parent.view.backgroundColor = .whiteColor()
    child.view.backgroundColor = .whiteColor()

    parent.setOverrideTraitCollection(traits, forChildViewController: child)

    return (parent, child)
}

public enum Device {
  case phone4inch
  case phone4_7inch
  case phone5_5inch
  case pad
}

public enum Orientation {
  case portrait
  case landscape
}

public func playgroundControllers(device device: Device = .phone4_7inch,
                                         orientation: Orientation = .portrait,
                                         child: UIViewController = UIViewController(),
                                         additionalTraits: UITraitCollection = .init())
  -> (parent: UIViewController, child: UIViewController) {

    let parent = UIViewController()
    parent.addChildViewController(child)
    parent.view.addSubview(child.view)

    child.view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]

    let traits: UITraitCollection
    switch (device, orientation) {
    case (.phone4inch, .portrait):
      parent.view.frame = .init(x: 0, y: 0, width: 320, height: 575)
      traits = .init(traitsFromCollections: [
        .init(horizontalSizeClass: .Compact),
        .init(verticalSizeClass: .Regular),
        .init(userInterfaceIdiom: .Phone)
        ])
    case (.phone4inch, .landscape):
      parent.view.frame = .init(x: 0, y: 0, width: 575, height: 320)
      traits = .init(traitsFromCollections: [
        .init(horizontalSizeClass: .Compact),
        .init(verticalSizeClass: .Compact),
        .init(userInterfaceIdiom: .Phone)
        ])
    case (.phone4_7inch, .portrait):
      parent.view.frame = .init(x: 0, y: 0, width: 375, height: 667)
      traits = .init(traitsFromCollections: [
        .init(horizontalSizeClass: .Compact),
        .init(verticalSizeClass: .Regular),
        .init(userInterfaceIdiom: .Phone)
        ])
    case (.phone4_7inch, .landscape):
      parent.view.frame = .init(x: 0, y: 0, width: 667, height: 375)
      traits = .init(traitsFromCollections: [
        .init(horizontalSizeClass: .Compact),
        .init(verticalSizeClass: .Compact),
        .init(userInterfaceIdiom: .Phone)
        ])
    case (.phone5_5inch, .portrait):
      parent.view.frame = .init(x: 0, y: 0, width: 540, height: 960)
      traits = .init(traitsFromCollections: [
        .init(horizontalSizeClass: .Compact),
        .init(verticalSizeClass: .Regular),
        .init(userInterfaceIdiom: .Phone)
        ])
    case (.phone5_5inch, .landscape):
      parent.view.frame = .init(x: 0, y: 0, width: 960, height: 540)
      traits = .init(traitsFromCollections: [
        .init(horizontalSizeClass: .Regular),
        .init(verticalSizeClass: .Compact),
        .init(userInterfaceIdiom: .Phone)
        ])
    case (.pad, .portrait):
      parent.view.frame = .init(x: 0, y: 0, width: 768, height: 1024)
      traits = .init(traitsFromCollections: [
        .init(horizontalSizeClass: .Regular),
        .init(verticalSizeClass: .Regular),
        .init(userInterfaceIdiom: .Pad)
        ])
    case (.pad, .landscape):
      parent.view.frame = .init(x: 0, y: 0, width: 1024, height: 768)
      traits = .init(traitsFromCollections: [
        .init(horizontalSizeClass: .Regular),
        .init(verticalSizeClass: .Regular),
        .init(userInterfaceIdiom: .Pad)
        ])
    }

    child.view.frame = parent.view.frame

    parent.view.backgroundColor = .whiteColor()
    child.view.backgroundColor = .whiteColor()

    let allTraits = UITraitCollection.init(traitsFromCollections: [traits, additionalTraits])
    parent.setOverrideTraitCollection(allTraits, forChildViewController: child)

    return (parent, child)
}
