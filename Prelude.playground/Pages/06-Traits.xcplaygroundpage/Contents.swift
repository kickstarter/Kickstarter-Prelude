import Prelude
import Prelude_UIKit
import UIKit
import XCPlayground

/*:
 The prelude provides special functions for tapping into a UI transformation pipeline and providing
 custom styling based on `UITraitCollection` attributes. For example, one can provide different values
 of margins depending on whether the interface idiom is iPhone or iPad.

 The way you tap into the transformation pipeline is to use a new variation of the `%~` operator. It
 takes a closure that takes both the whole and part being operated on, which allows you to inspect
 the current traits in order to provide custom styling.

 For example, here is a transformation of `UIButton`s that that uses the button's interface idiom in
 order to set content edge insets, font and corner radius:
 */

let buttonStyle =
  UIButton.lens.contentEdgeInsets %~~ {
      $1.traitCollection.userInterfaceIdiom == .Phone ? .init(all: 8) : .init(all: 16)
    }
    <> UIButton.lens.titleLabel.font %~~ {
      $1.traitCollection.userInterfaceIdiom == .Phone ?
        .preferredFontForTextStyle(UIFontTextStyleCallout) :
        .preferredFontForTextStyle(UIFontTextStyleTitle2)
    }

/*:
 In order to use that we need to set up a view controller with some specified traits. We have a helper
 function called `traitsController` that creates a parent and child controller with a specified set
 of traits. We can then create a button and add it to the child controller's view:
 */
let (parent, child) = playgroundControllers(device: .pad, orientation: .landscape)
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


let frame = parent.view.frame
XCPlaygroundPage.currentPage.liveView = parent
parent.view.frame = frame
