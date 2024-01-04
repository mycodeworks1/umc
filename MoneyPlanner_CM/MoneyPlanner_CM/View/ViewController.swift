//
//  ViewController.swift
//  MoneyPlanner_CM
//
//  Created by 유철민 on 1/3/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        
        let calendarButton = UIButton(type: .system)
        calendarButton.setTitle("Open Calendar", for: .normal)
        calendarButton.addTarget(self, action: #selector(openCalendar), for: .touchUpInside)
        
        calendarButton.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        view.addSubview(calendarButton)
    }
    
    @objc func openCalendar() {
        let calendarViewController = CalendarViewController()
        present(calendarViewController, animated: true, completion: nil)
    }
    
}

