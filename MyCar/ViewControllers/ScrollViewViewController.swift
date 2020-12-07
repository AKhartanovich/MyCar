
import UIKit

class ScrollViewViewController: UIViewController, UIScrollViewDelegate {
    
    lazy var image = UIImage(named: "loginWalper.jpg")
    lazy var imageView = UIImageView(image: image)
    lazy var scrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        
//        scrollView.contentSize = CGSize(width: 2000, height: 2000)
        
//        scrollView.bounces = false
        
//        scrollView.showsVerticalScrollIndicator = false
        
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 2.0
        
        
        scrollView.addSubview(imageView)
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
        
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate  = self
        
        scrollView.zoomScale = 0.5
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
//        scrollView.backgroundColor = .systemPink
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
    
}
