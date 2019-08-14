

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


   	func showCitysListScreen() {
   		let new = UINavigationController(rootViewController: CitysListViewController())
   		addChildViewController(new)                    // 2
   		new.view.frame = view.bounds                   // 3
      	view.addSubview(new.view)                      // 4
      	new.didMove(toParentViewController: self)      // 5 
      	current.willMove(toParentViewController: nil)  // 6 подготовка к удалению контроллера
      	current.view.removeFromSuperview()             // 7 удаление контроллера из родительского
      	current.removeFromParentViewController()       // 8 удаление из rootViewController
      	current = new								   // 9 refresh current viewController
   	}
}