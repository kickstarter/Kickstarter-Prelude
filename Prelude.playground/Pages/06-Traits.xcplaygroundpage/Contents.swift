import Prelude
import Prelude_UIKit
import UIKit
import XCPlayground

let traits = UITraitCollection(traitsFromCollections: [
  .init(userInterfaceIdiom: .Pad),
  .init(verticalSizeClass: .Regular),
  .init(horizontalSizeClass: .Compact),
  .init(forceTouchCapability: .Available),
  ])
let (parent, child) = traitsController(traits)
XCPlaygroundPage.currentPage.liveView = parent

let button = UIButton()
child.view.addSubview(button)

button
  |> UIButton.lens.titleText(forState: .Normal) .~ "Hello world"
  |> UIButton.lens.frame.origin .~ .init(x: 50, y: 50)
  |> UIButton.lens.titleColor(forState: .Normal) .~ .whiteColor()
  |> UIButton.lens.backgroundColor(forState: .Normal) .~ .redColor()
  |> UIButton.lens.contentEdgeInsets .~ .init(all: 8.0)
  |> UIButton.lens.titleLabel.font .~ .preferredFontForTextStyle(UIFontTextStyleCaption2)
  |> UIButton.lens.layer.masksToBounds .~ true
  |> UIButton.horizontalSizeClass {
    switch $0 {
    case .Compact:
      return UIButton.lens.contentEdgeInsets %~ { .init(all: $0.left * 2.0) }
        <> UIButton.lens.titleLabel.font .~ .preferredFontForTextStyle(UIFontTextStyleBody)
        <> UIButton.lens.layer.cornerRadius .~ 3.0
    case .Regular, .Unspecified:
      return UIButton.lens.contentEdgeInsets %~ { .init(all: $0.left * 4.0) }
        <> UIButton.lens.titleLabel.font .~ .preferredFontForTextStyle(UIFontTextStyleTitle3)
        <> UIButton.lens.layer.cornerRadius .~ 8.0
    }
  }
  |> UIButton.forceTouchCapability {
    UIButton.lens.hidden .~ $0 != .Available
}
button.sizeToFit()
