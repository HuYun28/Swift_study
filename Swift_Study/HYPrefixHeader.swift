//
//  HYPrefixHeader.swift
//  Swift_Study
//
//  Created by Atlantis on 2022/8/22.
//

import UIKit


//宏输出函数
//#ifdef DEBUG
//#define NSAllLog(fmt, ...) NSLog((@"%s," "[lineNum:%d]" fmt) , __FUNCTION__, __LINE__, ##__VA_ARGS__); //带函数名和行数
//#define NSLineLog(fmt, ...) NSLog((@"===[lineNum:%d]" fmt), __LINE__, ##__VA_ARGS__);  //带行数
//#define NSLog(fmt, ...) NSLog((fmt), ##__VA_ARGS__); //不带函数名和行数
//#else
//#define NSAllLog(fmt, ...)
//#define NSLineLog(fmt, ...)
//#define NSLog(fmt, ...)
//#endif

let HYWidth = UIScreen.main.bounds.size.width
let HYHeight = UIScreen.main.bounds.size.height
let HYBounds = UIScreen.main.bounds

//状态栏和导航栏高度
//#define IS_IPHONEXSYSTEM HYSTATUS_BAR_HEIGHT == 44 ? YES : NO
let HYSTATUS_BAR_HEIGHT = UIApplication.shared.statusBarFrame.size.height
let HYNAVIGATION_BAR_HEIGHT = 44          //NavBar高度
let HYSTATUS_AND_NAVIGATION_HEIGHT = Int(HYSTATUS_BAR_HEIGHT)+Int(HYNAVIGATION_BAR_HEIGHT)
let HYTABBAR_HEIGHT = (IS_IPHONEXSYSTEM ? 83 : 49)  //TabBar高度
let HYIPHONEX_COMPARE_TABHEIGHT = (IS_IPHONEXSYSTEM ? 34 : 0)  //iPhoneXTabBar高于的值
let IS_IPHONEXSYSTEM:Bool = {
    var isPhoneX = false
    if #available(iOS 11.0, *) {
        isPhoneX = (UIApplication.shared.delegate?.window??.safeAreaInsets.bottom ?? 0.0) > 0.0
    }
    return isPhoneX
}()

//弱引用
//#define HYWeakSelf(type)  __weak typeof(type) weak##type = type;
//#define HYBlockSelf(type) __block typeof(type) block##type = type;
