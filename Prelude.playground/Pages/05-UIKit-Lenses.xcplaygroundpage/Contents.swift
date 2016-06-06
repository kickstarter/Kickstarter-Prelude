import Prelude
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
  • UILabel.lens.font .~ .preferredFontForTextStyle(UIFontTextStyleTitle1)

let baseStyle = UIView.lens.frame.size .~ .init(width: 160.0, height: 48.0)
  • UIView.lens.backgroundColor .~ .redColor()
  • UILabel.lens.textColor .~ .whiteColor()
  • rounded(6.0)
  • titleStyle

// Create some labels and style them.
let labels = ["Hello", "UIKit", "Lenses"]
  .map {
    createLabel()
      |> UILabel.lens.text .~ $0
      |> baseStyle
}

labels
