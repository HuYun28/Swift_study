//
//  HYTableVC.swift
//  Swift_Study
//
//  Created by Atlantis on 2022/8/23.
//

import UIKit

class HYTableVC: UIViewController,UITableViewDelegate,UITableViewDataSource  {

//    var tableView:UITableView?
    var array = NSMutableArray.init()
    func configArray() {
        let model1 = HYTableModel.init()
        model1.content = "本文介绍了二元运算符不能应用于Float和Float!类型的操作数的处理方法，对大家解决问题具有一定的参考价值，需要的朋友们下面随着小编来起学习吧！"
        model1.url = "https://img.jbzj.com/file_images/article/201709/2017918113735996.jpg?2017818113813"
        array.add(model1)
        
        let model2 = HYTableModel.init()
        model2.content = "本文介绍了二元运算符不能应用于Float和Float!类型的操作数的处理方法，对大家解决问题具有一定的参考价值，需要的朋友们下面随着小编来起学习吧！本文介绍了二元运算符不能应用于Float和Float!类型的操作数的处理方法，对大家解决问题具有一定的参考价值，需要的朋友们下面随着小编来起学习吧！"
        model2.url = "https://img.jbzj.com/file_images/article/201709/2017918113735996.jpg?2017818113813"
        array.add(model2)
        
        let model3 = HYTableModel.init()
        model3.content = "本文介绍了二元运算符不能应用于Float和Float!类型的操作数的处理方法，对大家解决问题具有一定的参考价值，需要的朋友们下面随着小编来起学习吧！本文介绍了二元运算符不能应用于Float和Float!类型的操作数的处理方法，对大家解决问题具有一定的参考价值，需要的朋友们下面随着小编来起学习吧！本文介绍了二元运算符不能应用于Float和Float!类型的操作数的处理方法，对大家解决问题具有一定的参考价值，需要的朋友们下面随着小编来起学习吧！本文介绍了二元运算符不能应用于Float和Float!类型的操作数的处理方法，对大家解决问题具有一定的参考价值，需要的朋友们下面随着小编来起学习吧！本文介绍了二元运算符不能应用于Float和Float!类型的操作数的处理方法，对大家解决问题具有一定的参考价值，需要的朋友们下面随着小编来起学习吧！"
        model3.url = "https://img.jbzj.com/file_images/article/201709/2017918113735996.jpg?2017818113813"
        array.add(model3)
        
        let model4 = HYTableModel.init()
        model4.content = "本文介绍了二元运算符不能应用于Float和Float!类型的操作数的处理方法，对大家解决问题具有一定的参考价值，需要的朋友们下面随着小编来起学习吧！本文介绍了二元运算符不能应用于Float和Float!类型的操作数的处理方法，对大家解决问题具有一定的参考价值，需要的朋友们下面随着小编来起学习吧！"
        model4.url = "https://img.jbzj.com/file_images/article/201709/2017918113735996.jpg?2017818113813"
        array.add(model4)
        
        let model5 = HYTableModel.init()
        model5.content = "本文介绍了二元运算符不能应用于Float和Float!类型的操作数的处理方法，对大家解决问题具有一定的参考价值，需要的朋友们下面随着小编来起学习吧！本文介绍了二元运算符不能应用于Float和Float!类型的操作数的处理方法，对大家解决问题具有一定的参考价值，需要的朋友们下面随着小编来起学习吧！本文介绍了二元运算符不能应用于Float和Float!类型的操作数的处理方法，对大家解决问题具有一定的参考价值，需要的朋友们下面随着小编来起学习吧！本文介绍了二元运算符不能应用于Float和Float!类型的操作数的处理方法，对大家解决问题具有一定的参考价值，需要的朋友们下面随着小编来起学习吧！本文介绍了二元运算符不能应用于Float和Float!类型的操作数的处理方法，对大家解决问题具有一定的参考价值，需要的朋友们下面随着小编来起学习吧！"
        model5.url = "https://img.jbzj.com/file_images/article/201709/2017918113735996.jpg?2017818113813"
        array.add(model5)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self .configArray()
        self.view .addSubview(self.tableView)
    }
    lazy var tableView:UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: HYSTATUS_AND_NAVIGATION_HEIGHT, width: Int(HYWidth), height: Int(HYHeight)-HYSTATUS_AND_NAVIGATION_HEIGHT-HYIPHONEX_COMPARE_TABHEIGHT), style:.plain)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 30
//        tableView.register(UINib.init(nibName: "HYListCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "HYListCell")
        tableView.register(UINib.init(nibName: "HYListCell", bundle: nil), forCellReuseIdentifier: "HYListCell")
        return tableView
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HYListCell", for: indexPath) as! HYListCell
        let model = array[indexPath.row] as!HYTableModel
        cell.imgV .sd_setImage(with: NSURL.init(string: model.url!) as URL?)
        cell.contentLab.text = model.content
        return cell;
    }
}
