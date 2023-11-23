//
//  ViewController.swift
//  week7_p
//
//  Created by 유철민 on 2023/11/21.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class ViewController: UIViewController {
    
    @IBOutlet weak var nickname: UILabel!
    @IBOutlet weak var email: UILabel!
    
    @IBAction func loginToKakao(_ sender: Any) {
        //카카오톡 있을 경우에
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("로그인 성공")
                    
                    //do something
                    //사용자 정보 불러옴
                    UserApi.shared.me { [self] user, error in
                        if let error = error {
                            print(error)
                        } else {
                            
                            guard let email = user?.kakaoAccount?.email,
                                  let name = user?.kakaoAccount?.profile?.nickname else{
                                print("token/email/name is nil")
                                return
                            }
                            
                            self.nickname.text = name
                            self.email.text = email
                            
                        }
                    }
                    _ = oauthToken
                }
            }
        }else{
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print("찾았다")
                    print(error)
                } else {
                    print("카카오 계정으로 로그인 성공")
                    _ = oauthToken
                    // 관련 메소드 추가
                    UserApi.shared.me { [self] user, error in
                        if let error = error {
                            print(error)
                        } else {
                            
                            guard
                                let name = user?.kakaoAccount?.profile?.nickname else{
                                print("token/email/name is nil")
                                return
                            }
                            
                            self.nickname.text = name
                            print("hey!")
                            
                        }
                    }
                }
            }
        }
        
        //        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else{
        //            return
        //        }
        //
        //        nextVC.previousViewController = self
        //        nextVC.modalPresentationStyle = .fullScreen
        //        present(nextVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
