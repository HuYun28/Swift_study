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

//弱引用
//#define HYWeakSelf(type)  __weak typeof(type) weak##type = type;
//#define HYBlockSelf(type) __block typeof(type) block##type = type;
