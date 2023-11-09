//
//  firstCollectionViewCell.swift
//  Week4_p
//
//  Created by 유철민 on 2023/11/10.
//

import UIKit

class firstCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - 데이터 모델과 연결
    public func configure(with model: Model){
         
        self.ImageView.image = UIImage(named: model.imageName)
        self.titleLabel.text = model.title
        
        self.priceLabel.text = model.price
        
    }

}
