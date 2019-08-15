
import UIKit


class SplashViewController: UIViewController {

    private let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)

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
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
            self.activityIndicator.stopAnimating()

   			// check first launch
   			let defaults = UserDefaults.standard
        	if defaults.object(forKey: "isFirstTime") == nil {
            	defaults.set("No", forKey:"isFirstTime")
                AppDelegate.shared.rootViewController.showCurrencyScreen()
        	} else {
                AppDelegate.shared.rootViewController.switchToCitysListScreen()
        	}
   		}
   	}
}
