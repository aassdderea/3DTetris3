import UIKit
import WebKit

class GameViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // WKWebView 配置
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        
        webView = WKWebView(frame: self.view.bounds, configuration: config)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        webView.navigationDelegate = self
        webView.scrollView.isScrollEnabled = false
        webView.isOpaque = false
        webView.backgroundColor = UIColor(red: 0.039, green: 0.039, blue: 0.071, alpha: 1.0)
        
        self.view.addSubview(webView)
        
        // 加载本地 tetris3d.html
        if let path = Bundle.main.path(forResource: "tetris3d", ofType: "html") {
            let url = URL(fileURLWithPath: path)
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}