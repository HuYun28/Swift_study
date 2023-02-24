//
//  HYVideoListVC.swift
//  Swift_Study
//
//  Created by Atlantis on 2023/2/24.
//

import UIKit
import AVKit
import AVFoundation

struct videoModel {
    let name : String
    let title : String
    let desc : String
}

class HYVideoListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let listArray = [videoModel(name: "videoScreenshot01", title: "q", desc: "w"),
                     videoModel(name: "videoScreenshot02", title: "e", desc: "r"),
                     videoModel(name: "videoScreenshot03", title: "e", desc: "r"),
                     videoModel(name: "videoScreenshot04", title: "e", desc: "r"),
                     videoModel(name: "videoScreenshot05", title: "e", desc: "r"),
                     videoModel(name: "videoScreenshot06", title: "e", desc: "r")]
    
    var tableView:UITableView?
    var palyVC = AVPlayerViewController()
    var paly = AVPlayer()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "视频展示"
        self.view.backgroundColor = .black
        self.configUI()
    }

    func configUI() {
        self.tableView = UITableView.init(frame: CGRect(x: 0, y: 88, width: HYWidth, height: HYHeight-88), style: .plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.separatorStyle = .none
        self.tableView?.backgroundColor = .black
        self.view.addSubview(self.tableView!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView .dequeueReusableCell(withIdentifier: "HYVideoListCell") as? HYVideoListCell
        if(cell == nil){
            cell = HYVideoListCell.init(style: .default, reuseIdentifier: "HYVideoListCell")
        }
        let model = self.listArray[indexPath.row]
        cell?.backgroundImageView?.image = UIImage.init(named: model.name as String)
        cell?.titleLabel?.text = model.title
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let path = Bundle.main.path(forResource:"emoji zone", ofType: "mp4")
        self.paly = AVPlayer(url: URL(fileURLWithPath: path!))
        self.palyVC.player = self.paly
        self.present(self.palyVC, animated: true) {
            self.paly.play()
        }
    }
}
