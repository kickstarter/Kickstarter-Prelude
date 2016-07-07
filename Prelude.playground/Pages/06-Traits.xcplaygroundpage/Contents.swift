import Prelude
import Prelude_UIKit
import UIKit
import XCPlayground

/*:
 The prelude provides special functions for tapping into a UI transformation pipeline and providing
 custom styling based on `UITraitCollection` attributes. For example, one can provide different values
 of margins depending on whether the interface idiom is iPhone or iPad.

 Every view that conforms to `UITraitEnvironment` gets a static function for each trait attribute. That
 static function takes a closure that maps the trait attribute to a view transformation. It is inside
 that closure that you would switch on the trait in order to figure out what styles to apply.

 For example, here is a transformation of `UIButton`s that that uses the button's interface idiom in 
 order to set content edge insets, font and corner radius:
 */

let buttonStyle = UIButton.userInterfaceIdiom {
  switch $0 {
  case .Phone:
    return UIButton.lens.contentEdgeInsets .~ .init(all: 8)
      <> UIButton.lens.titleLabel.font .~ .preferredFontForTextStyle(UIFontTextStyleCallout)
      <> UIButton.lens.layer.cornerRadius .~ 3.0
  default:
    return UIButton.lens.contentEdgeInsets .~ .init(all: 16)
      <> UIButton.lens.titleLabel.font .~ .preferredFontForTextStyle(UIFontTextStyleTitle2)
      <> UIButton.lens.layer.cornerRadius .~ 8.0
  }
}

/*:
 In order to use that we need to set up a view controller with some specified traits. We have a helper
 function called `traitsController` that creates a parent and child controller with a specified set
 of traits. We can then create a button and add it to the child controller's view:
 */
let (parent, child) = traitsController(.init(userInterfaceIdiom: .Phone))
XCPlaygroundPage.currentPage.liveView = parent
let button = UIButton()
child.view.addSubview(button)

/*:
 With that set up we can now perform a styling for a button:
 */
button
  |> UIButton.lens.titleText(forState: .Normal) .~ "Hello world"
  |> UIButton.lens.frame.origin .~ .init(x: 50, y: 50)
  |> UIButton.lens.titleColor(forState: .Normal) .~ .whiteColor()
  |> UIButton.lens.backgroundColor(forState: .Normal) .~ .redColor()
  |> UIButton.lens.layer.masksToBounds .~ true
  |> buttonStyle
button.sizeToFit()
