import UIKit
import RxSwift
import RxCocoa

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let disposeBag = DisposeBag()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        mainStore.state
            .skip(1)
            .drive(onNext: { state in
                // save state to disk
                print(state)
            })
            .disposed(by: disposeBag)

        mainStore.dispatch(IncreaseCounter())
        mainStore.dispatch(IncreaseCounter())
        mainStore.dispatch(DecreaseCounter())

        return true
    }
}
