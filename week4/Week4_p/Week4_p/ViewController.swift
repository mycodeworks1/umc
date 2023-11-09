//
//  ViewController.swift
//  Week4_p
//
//  Created by 유철민 on 2023/11/07.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet var tableView: UITableView!
    
    var models = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        // Do any additional setup after loading the view.
    }
    
    func setUpTableView(){
        models.append(Model(imageName:"얼음트레이", title:"얼음트레이" ,price:"1000"))
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CollectionTableViewCell", bundle: nil), forCellReuseIdentifier: "CollectionTableViewCell")
        tableView.separatorStyle = .none
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //cell의 갯수 설정
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //cell의 데이터 구성
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCollectionTableViewCell", for: indexPath) as! firstCollectionTableViewCell
        cell.ProductTitle.text = "이 상품 어때요?"
        cell.configure(with: models)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { //cell의 높이 설정
        return 240
    }
}

