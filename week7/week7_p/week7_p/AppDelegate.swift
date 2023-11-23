//
//  AppDelegate.swift
//  week7_p
//
//  Created by 유철민 on 2023/11/21.
//

import UIKit
import KakaoSDKAuth//for kakao app development
import KakaoSDKCommon

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        KakaoSDK.initSDK(appKey: "208e03f838d726fa498298fd5053c073")
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
    /*
     카카오톡으로 로그인은 서비스 앱에서 카카오톡으로 이동한 후, 사용자가 [동의하고 계속하기] 버튼 또는
     로그인 취소 버튼을 누르면 다시 카카오톡에서 서비스 앱으로 이동하는 과정을 거칩니다. 카카오톡에서
     서비스 앱으로 돌아왔을 때 카카오 로그인 처리를 정상적으로 완료하기 위해
     AppDelegate.swift 파일에 handleOpenUrl()을 추가합니다.
     
     Deployment target이 iOS 13 이상으로 생성된 프로젝트라면 Info.plist 파일에 
     UIApplicationSceneManifest 설정이 추가되며, UISceneDelegate.swift를
     기본으로 사용하도록 설정됩니다. UISceneDelegate.swift를 기본으로 사용하는 경우,
     AppDelegate.swift 파일 대신 SceneDelegate.swift 파일에 handleOpenUrl()을 추가합니다.!!!!!!!

     */
    
//    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//            if (AuthApi.isKakaoTalkLoginUrl(url)) {
//                return AuthController.handleOpenUrl(url: url)
//            }
//            return false
//    }


}

