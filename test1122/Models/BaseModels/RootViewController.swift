
import UIKit


class RootViewController: UIViewController {
	private var current: UIViewController

	init() {
		self.current = SplashViewController()
        super.init(nibName: nil, bundle: nil)
	}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

	override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(current)                             // 1 add viewController
        current.view.frame = view.bounds              // 2 size settings
        view.addSubview(current.view)                 // 3
        current.didMove(toParent: self)               // 4
   	}

    func showCurrencyScreen() {
        let storyboard = UIStoryboard(name: "SelectCurrency", bundle: nil)
        let currencyViewController = storyboard.instantiateViewController(withIdentifier: "NavBar")
        let new = UINavigationController(rootViewController: currencyViewController)
        addChild(new)  // crash here                                // 2
        new.view.frame = view.bounds                   // 3
        view.addSubview(new.view)                      // 4
        new.didMove(toParent: self)                    // 5
        current.willMove(toParent: nil)                // 6 подготовка к удалению контроллера
        current.view.removeFromSuperview()             // 7 удаление контроллера из родительского
        current.removeFromParent()                     // 8 удаление из rootViewController
        current = new                                  // 9 refresh current viewController
        
        // TODO: open currency screen
        //                let storyboard = UIStoryboard(name: "SelectCurrency", bundle: nil)
        //                let viewController = storyboard.instantiateViewController(withIdentifier: "NavBar")
        //                self.window?.rootViewController = viewController
        //                self.window?.makeKeyAndVisible()
    }

   	func switchToCitysListScreen() {
        let cityListViewController = CitysListViewController()
   		let new = UINavigationController(rootViewController: cityListViewController)
        current.willMove(toParent: nil)
        addChild(new)                                  // 2
        self.current.removeFromParent()
        new.didMove(toParent: self)
        self.current = new
   	}
    
    func switchToCurrencyScreen() {
        let currencyViewController = SelectCurrencyViewController()
        let new = UINavigationController(rootViewController: currencyViewController)
        current.willMove(toParent: nil)
        addChild(new)                                  // 2
        self.current.removeFromParent()
        new.didMove(toParent: self)
        self.current = new
    }
    
    func showBanksListScreen() {
    }
    
    func showBankDetailsScreen() {
    }
}
