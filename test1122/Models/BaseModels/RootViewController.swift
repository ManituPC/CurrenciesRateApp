

class RootViewController: UIViewController {
	private var current: UIViewController

	init() {
		self.current = SplashViewController()
		super.init(nibName: nil, bundel: nil)
	}


	override func viewDidLoad() {
      super.viewDidLoad()
      
      addChildViewController(current)               // 1 add viewController
      current.view.frame = view.bounds              // 2 size settings            
      view.addSubview(current.view)                 // 3 
      current.didMove(toParentViewController: self) // 4
   }
}