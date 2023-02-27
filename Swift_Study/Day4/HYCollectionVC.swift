//
//  HYCollectionVC.swift
//  Swift_Study
//
//  Created by Atlantis on 2023/2/27.
//

import UIKit

class HYCollectionVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    var collectionView:UICollectionView!
    var listArray=HYCollectionModel.getModels()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createUI()
        
    }

    func createUI(){
        
        let bgImgV = UIImageView.init(frame: CGRect(x: 0, y: 0, width: HYWidth, height: HYHeight))
        bgImgV.image = UIImage.init(named: "blue")
        bgImgV.contentMode = .scaleAspectFill
        self.view .addSubview(bgImgV)
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize.init(width: 300, height: 400)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.scrollDirection = .horizontal
        self.collectionView = UICollectionView.init(frame: CGRect(x: 0, y: (HYHeight-500)/2, width: HYWidth, height: 500), collectionViewLayout: layout)
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        self.collectionView.backgroundColor = UIColor.clear
//        self.collectionView.center = view.center
        self.view .addSubview(self.collectionView)
        self.collectionView.register(UINib (nibName: "HYCollectionCell", bundle: nil), forCellWithReuseIdentifier: "HYCollectionCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:HYCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HYCollectionCell", for: indexPath) as! HYCollectionCell
        cell.model = self.listArray[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
