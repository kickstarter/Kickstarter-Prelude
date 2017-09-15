#if os(iOS)
import Prelude
import WebKit

public protocol WKWebViewProtocol: UIViewProtocol {
  var scrollView: UIScrollView { get }
}

extension WKWebView: WKWebViewProtocol {}

public extension LensHolder where Object: WKWebViewProtocol {

  public var scrollView: Lens<Object, UIScrollView> {
    return Lens(
      view: { $0.scrollView },
      set: { $1 }
    )
  }
}

extension Lens where Whole: WKWebViewProtocol, Part == UIScrollView {
  public var delaysContentTouches: Lens<Whole, Bool> {
    return Whole.lens.scrollView..Part.lens.delaysContentTouches
  }
}
#endif
