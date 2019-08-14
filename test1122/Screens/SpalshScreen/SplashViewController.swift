
class SplashViewController: UIViewController {

	private let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)

   	override func viewDidLoad() {
      	super.viewDidLoad()
      	view.backgroundColor = UIColor.white
      	view.addSubview(activityIndicator)
      	activityIndicator.frame = view.bounds
      	activityIndicator.backgroundColor = UIColor(white: 0, alpha: 0.4)
      	makeServiceCall()
   	}

   	private func makeServiceCall() {
   		activityIndicator.startAnimating()
   		DispatchQueue.main.asyncAfter(dedline: DispatchTime.now() + .seconds(3)) {
   			self.activityIndicator.stopAnimation()

   			// check first launch
   			let defaults = UserDefaults.standard
        	if defaults.object(forKey: "isFirstTime") == nil {
            	defaults.set("No", forKey:"isFirstTime")
            	let storyboard = UIStoryboard(name: "SelectCurrency", bundle: nil)
            	let viewController = storyboard.instantiateViewController(withIdentifier: "NavBar")
            	self.window?.rootViewController = viewController
            	self.window?.makeKeyAndVisible()
        	} else {
        		// do something crazy
        	}
   		}
   	}
}