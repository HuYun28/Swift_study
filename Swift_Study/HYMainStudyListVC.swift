//
//  HYMainStudyListVC.swift
//  Swift_Study
//
//  Created by Atlantis on 2022/8/22.
//

import UIKit

class HYMainStudyListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

//    var tableView:UITableView?
    let array = ["Timer","Q","Q","Q","Q","Q"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view .addSubview(self.tableView)
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 88, width: self.view.frame.size.width, height: self.view.frame.size.height-88), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView .register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(format: "第%ld天-%@", indexPath.row+1,array[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row==0 {
            let timerVC = HYTimerVC.init(nibName: "HYTimerVC", bundle: nil)
            self.navigationController?.pushViewController(timerVC, animated: true)
        }
    }
}
