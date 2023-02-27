//
//  HYVideoListCell.swift
//  Swift_Study
//
//  Created by Atlantis on 2023/2/24.
//

import UIKit

class HYVideoListCell: UITableViewCell {

    var backgroundImageView :UIImageView?
    var playView : UIImageView?
    var titleLabel :UILabel?
    var descLabel:UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        self .configUI();
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI() {
        self.backgroundImageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: HYWidth, height: 220))
        self.contentView .addSubview(self.backgroundImageView!)
        self.playView = UIImageView.init(frame: CGRect(x: HYWidth/2-25, y: 220/2-25, width: 50, height: 50))
        self.playView?.image = UIImage.init(named: "playBtn")
        self.contentView.addSubview(self.playView!)
        
        self.titleLabel = UILabel.init(frame: CGRect(x: 0, y: 178, width: HYWidth, height: 20))
        self.titleLabel?.textColor = UIColor.white
        self.titleLabel?.font = UIFont .systemFont(ofSize: 15)
        self.titleLabel?.textAlignment = .center
        self.contentView.addSubview(self.titleLabel!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
