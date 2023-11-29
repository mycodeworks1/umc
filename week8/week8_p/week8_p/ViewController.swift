//
//  ViewController.swift
//  week8_p
//
//  Created by 유철민 on 2023/11/29.
//

import UIKit

let defaults = UserDefaults.standard

class ViewController: UIViewController {
    
    @IBOutlet weak var Status: UILabel!
    @IBOutlet weak var IDTextfield: UITextField!
    @IBOutlet weak var PWTextfield: UITextField!
    
    @IBAction func LoginAction(_ sender: Any) {
        let ID = IDTextfield.text ?? "Nothing"
        let PW = PWTextfield.text
        let q_R : String? = defaults.string(forKey: ID)
        //쿼리 날려서 확인
        if(q_R != nil){//있으면
            if(q_R == PW){
                Status.text = "로그인 성공!"
            }
            else{
                Status.text = "비밀번호가 틀렸습니다."
            }
            IDTextfield.text = nil
            PWTextfield.text = nil
        }
        //ID 없음
        else{
            Status.text = "ID가 없습니다."
            IDTextfield.text = nil
            PWTextfield.text = nil
        }
    }
    
    @IBAction func RegisterAction(_ sender: Any) {
        let ID = IDTextfield.text ?? "Nothing"
        let PW = PWTextfield.text
        let q_R : String? = defaults.string(forKey: ID)
        
        //ID 존재한다면
        if(q_R != nil){
            Status.text = "이미 존재하는 ID"
            IDTextfield.text = nil
            PWTextfield.text = nil
            
        }else{//ID 없으면 새로 등록
            // 등록하는 과정
            defaults.setValue(PW, forKey: ID)
            Status.text = "회원 등록 성공!"
            IDTextfield.text = nil
            PWTextfield.text = nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
}

