import CoreGraphics
import Prelude
import Prelude_UIKit
import UIKit
import PlaygroundSupport

func rounded <A: UIViewProtocol> (radius: CGFloat) -> ((A) -> A) {
  return A.lens.layer.masksToBounds .~ true
    • A.lens.layer.cornerRadius .~ radius
}

// Hack to get around the fact that playgrounds dont render views that are
// initialized like `UIView()`
func createLabel() -> UILabel {
  return UILabel(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
}

let titleStyle = UILabel.lens.textAlignment .~ .center
  <> UILabel.lens.font .~ .preferredFont(forTextStyle: .title1)

let baseStyle = UILabel.lens.frame.size .~ .init(width: 160.0, height: 48.0)
  <> UILabel.lens.backgroundColor .~ .red
  <> UILabel.lens.textColor .~ .white
  <> rounded(radius: 6)

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
  |> UIButton.lens.title(for: .normal) .~ "To lens"
  |> UIButton.lens.titleColor(for: .normal) .~ .white
  |> UIButton.lens.title(for: .disabled) .~ "Or not to lens"
  |> UIButton.lens.titleColor(for: .disabled) .~ .init(white: 1.0, alpha: 0.5)
  |> UIButton.lens.titleLabel.font .~ .preferredFont(forTextStyle: .headline)
  |> UIButton.lens.frame.size .~ .init(width: 200, height: 40)
  |> UIButton.lens.contentHorizontalAlignment .~ .left
  |> UIButton.lens.contentEdgeInsets .~ UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
  |> UIButton.lens.backgroundColor(for: .normal) .~ .blue
  |> UIButton.lens.backgroundColor(for: .disabled) .~ .gray
  |> rounded(radius: 6)
