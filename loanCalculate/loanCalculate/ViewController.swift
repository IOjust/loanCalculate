//
//  ViewController.swift
//  loanCalculate
//
//  Created by 月亮 on 2017/3/12.
//  Copyright © 2017年 月亮. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //拉取连接时候，control + click
    @IBOutlet weak var loanAmountField: UITextField!
    @IBOutlet weak var loanTermField: UITextField!
    @IBOutlet weak var interestRateField: UITextField!
    @IBOutlet weak var result: UILabel!
    @IBAction func simpleBution(_ sender: Any) {
        //实例化
        let calculate1 = simpleCalculate()
        // !表示强制解析，有可能为nil。
        result.text = calculate1.calculate(loanAmount: Double( loanAmountField.text!)!, years:Int( loanTermField.text!)!, interestRate: Double( interestRateField.text!)!).description
        
    }
    
    
    //MARK:视图加载完成
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //MARK:接到内存警告
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


class simpleCalculate {
    //变量命令是小驼峰命名法：驼峰式命名，第一个英文单词小写，后面的所有单词首字母大写
    func calculate(loanAmount:Double,years:Int,interestRate:Double) -> Double {
        //定义一个常量 let,定义一个变量 var
        //option + click 查看元素的介绍
        //command + click 查看源码
        //struct :结构体，是copy，值传递
        //class :类，是引用，址传递
        
        let rate = interestRate / 100
        let interest = loanAmount * rate * Double(years)
        return loanAmount + interest
    }
}


