import CoreGraphics
import Prelude
import Prelude_UIKit
import UIKit

func rounded <A: UIViewProtocol> (radius: CGFloat) -> (A -> A) {
  return A.lens.layer.masksToBounds .~ true
    • A.lens.layer.cornerRadius .~ radius
}

// Hack to get around the fact that playgrounds dont render views that are
// initialized like `UIView()`
func createLabel() -> UILabel {
  return UILabel(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
}

let titleStyle = UILabel.lens.textAlignment .~ .Center
  <> UILabel.lens.font .~ .preferredFontForTextStyle(UIFontTextStyleTitle1)

let baseStyle = UILabel.lens.frame.size .~ .init(width: 160.0, height: 48.0)
  <> UILabel.lens.backgroundColor .~ .redColor()
  <> UILabel.lens.textColor .~ .whiteColor()
  <> rounded(6.0)

// Create some labels and style them.
let labels = ["Hello", "UIKit", "Lenses"]
  .map {
    createLabel()
      |> UILabel.lens.text .~ $0
      |> baseStyle
      |> titleStyle
}

labels

let button = UIButton()
  |> UIButton.lens.title(forState: .Normal) .~ "To lens"
  |> UIButton.lens.titleColor(forState: .Normal) .~ .whiteColor()
  |> UIButton.lens.title(forState: .Disabled) .~ "Or not to lens"
  |> UIButton.lens.titleColor(forState: .Disabled) .~ .init(white: 1.0, alpha: 0.5)
  |> UIButton.lens.titleLabel.font .~ .preferredFontForTextStyle(UIFontTextStyleHeadline)
  |> UIButton.lens.frame.size .~ .init(width: 200, height: 40)
  |> UIButton.lens.contentHorizontalAlignment .~ .Left
  |> UIButton.lens.contentEdgeInsets .~ UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
  |> UIButton.lens.backgroundColor(forState: .Normal) .~ .blueColor()
  |> UIButton.lens.backgroundColor(forState: .Disabled) .~ .grayColor()
  |> rounded(6.0)

button

button
  |> UIButton.lens.enabled %~ negate
  |> UIButton.lens.frame.size.width %~ { $0 + 50.0 }
