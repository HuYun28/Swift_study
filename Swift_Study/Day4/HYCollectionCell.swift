//
//  HYCollectionCell.swift
//  Swift_Study
//
//  Created by Atlantis on 2023/2/27.
//

import UIKit

class HYCollectionCell: UICollectionViewCell {

    var logoView:UIImageView!
    var titleLabel:UILabel!
    var effectView:UIVisualEffectView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.width = 300
        self.height = 400
        createUI()
    }

    var model:HYCollectionModel! {
        didSet {
            logoView.image = UIImage.init(named: model.imageName)
            titleLabel.text = model.title
        }
    }

    func createUI(){
        logoView = UIImageView.init(frame: self.bounds)
        logoView.contentMode = .scaleAspectFill
        self.contentView .addSubview(logoView)
        
        let blurEffect = UIBlurEffect.init(style: .light)
        effectView = UIVisualEffectView.init(frame: CGRect.init(x: 0, y: 340, width: self.width, height: 60))
        effectView.effect = blurEffect
        contentView.addSubview(effectView)
        
        titleLabel = UILabel.init(frame: effectView.frame)
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = .center
        contentView .addSubview(titleLabel)
        
        self.contentView.layer.cornerRadius = 10
        self.contentView.clipsToBounds = true
    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}
