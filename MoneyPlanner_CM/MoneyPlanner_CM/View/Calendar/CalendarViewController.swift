//
//  CalendarViewController.swift
//  MoneyPlanner_CM
//
//  Created by 유철민 on 1/3/24.
//

import Foundation
import UIKit

class CalendarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        view.backgroundColor = .systemGreen
        
        let closeButton = UIButton(type: .system)
        closeButton.setTitle("Close", for: .normal)
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        
        closeButton.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        view.addSubview(closeButton)
        // 다른 설정들...
    }
    
    @objc func close() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupCollectionView() {
        // UICollectionView 초기화 및 레이아웃 설정
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 50, height: 50)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        view.addSubview(collectionView)
        // UICollectionView의 오토레이아웃 설정
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 달력의 셀 개수 반환
        return 30 // 예시
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        // 셀 커스터마이징
        return cell
    }
}
