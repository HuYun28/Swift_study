//
//  HYTimerVC.swift
//  Swift_Study
//
//  Created by Atlantis on 2022/8/22.
//

import UIKit

class HYTimerVC: UIViewController {

    var topView:UIView?
    var timeLab:UILabel?
    var startBtn:UIButton?
    var timer = Timer()
    var count = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
    }
    func configUI(){
        self.topView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: HYWidth, height: HYHeight/2.0))
        self.topView?.backgroundColor = UIColor.red
        self.view.addSubview(self.topView!)
        
        self.timeLab = UILabel.init(frame: CGRect.init(x: 0, y: (self.topView!.frame.size.height-50)/2.0, width: HYWidth, height: 50))
        self.timeLab?.font = UIFont.systemFont(ofSize: 58)
        self.timeLab?.textColor = UIColor.white
        self.timeLab?.textAlignment = NSTextAlignment.center
        self.timeLab?.text = "0"
        self.view.addSubview(self.timeLab!)
        
        let startBtn = UIButton.init(type: .custom)
        startBtn.frame = CGRect.init(x: 0, y: HYHeight-self.topView!.frame.size.height, width: HYWidth/2.0, height: HYHeight/2.0)
        startBtn .setTitle("开始", for: .normal)
        startBtn.setTitleColor(UIColor.black, for: .normal)
        startBtn.backgroundColor = UIColor.yellow
        startBtn .addTarget(self, action: #selector(startBtnEvent(button:)), for:.touchUpInside)
        self.view.addSubview(startBtn)
        self.startBtn = startBtn
        
        let againBtn = UIButton.init(type: .custom)
        againBtn.frame = CGRect.init(x: HYWidth/2.0, y: HYHeight-self.topView!.frame.size.height, width: HYWidth/2.0, height: HYHeight/2.0)
        againBtn.setTitle("重置", for: .normal)
        againBtn.setTitleColor(UIColor.red, for: .normal)
        againBtn.backgroundColor = UIColor .orange
        againBtn.addTarget(self, action: #selector(againBtnEvent(button:)), for: .touchUpInside)
        self.view.addSubview(againBtn)
    }
    @objc func startBtnEvent(button:UIButton) {
        button.isSelected = !button.isSelected
        if !button.isSelected {
            button.setTitle("开始", for: .normal)
            self.timer.invalidate()
        }else{
            button .setTitle("暂停", for: .normal)
            self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateCountLabel), userInfo: nil, repeats: true)
        }
    }
    @objc func updateCountLabel() {
        self.count = count+0.1
        self.timeLab?.text = String(format: "%0.1f", count)
    }
    @objc func againBtnEvent(button:UIButton) {
        self.timer.invalidate()
        self.count = 0
        self.timeLab?.text = "0"
        self.startBtn?.setTitle("开始", for: .normal)
        self.startBtn?.isSelected = false
    }
}
