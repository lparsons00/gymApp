import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  /* old
   func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    let contentView = WorkoutList()

    if let windowScene = scene as? UIWindowScene {
      let window = UIWindow(windowScene: windowScene)
      window.rootViewController = UIHostingController(rootView: contentView)
      self.window = window
      window.makeKeyAndVisible()
    }
  }*/
  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
    ){
      guard let _ = (scene as? UIWindowScene) else { return }
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
      //window?.rootViewController = mainTabBarController
      let contentView = WorkoutList()
      if let windowScene = scene as? UIWindowScene {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = mainTabBarController
        self.window = window
        window.makeKeyAndVisible()
      }
  }
}
