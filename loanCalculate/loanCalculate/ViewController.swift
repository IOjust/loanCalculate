//
//  ViewController.swift
//  loanCalculate
//
//  Created by 月亮 on 2017/3/12.
//  Copyright © 2017年 月亮. All rights reserved.
//

import UIKit


class ViewController: UIViewController{
    //拉取连接时候，control + click
    @IBOutlet weak var loanAmountField: UITextField!
    @IBOutlet weak var loanTermField: UITextField!
    @IBOutlet weak var interestRateField: UITextField!
    @IBOutlet weak var result: UILabel!
    
    
    
    /// 加一个提醒框，提醒框只能通过代码实现
    func alert() {
        let alertView = UIAlertController(title: "警告", message: "输入格式不正确 ❌", preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "重新输入", style: .destructive, handler: nil))
        // 控制器的显示
        present(alertView, animated: true, completion: nil)

    }
    
    
    @IBAction func simpleBution(_ sender: Any) {
        //实例化
        let calculate1 = simpleCalculate()
        // !表示强制解析，有可能为nil。
        // Optional("") ,去掉optional 直接加 !
        print("textField的初始值 = \(loanAmountField.text)")
        // !表示强制解析，nil代表没有值
        print("textField ！的初始值 = \(loanAmountField.text!)")
        
        guard let loanTermField = loanTermField.text,let loanAmountField = loanAmountField.text,
        let interestRateField = interestRateField.text
        else {
            return
        }
        guard let loanTerm = Int(loanTermField),let loanAmount = Double(loanAmountField),let interestRate = Double(interestRateField) else {
            alert()
//            print("用户输入数据格式错误")
            return
        }
        
        
        // 看起来特别舒服
        result.text = calculate1.calculate(loanAmount: loanAmount, years: loanTerm, interestRate: interestRate).money
        
        
//        result.text = calculate1.calculate(loanAmount: Double( loanAmountField.text!)!, years:Int( loanTermField.text!)!, interestRate: Double( interestRateField.text!)!).money
        
    }
    
    @IBAction func compoundButtion(_ sender: Any) {
        //复利计算 实例化
        let calculate2 = compoundCalculate()
        guard let loanAmount = Double(loanAmountField.text!) ,
        let loanTerm = Int(loanTermField.text!),
        let interesrRate = Double(interestRateField.text!)
        else {
           
            let alertView = UIAlertController(title: "警告", message: "请输入数字", preferredStyle: .alert)
            alertView.addAction(UIAlertAction(title: "重新输入", style: .destructive, handler: nil))
            present(alertView, animated: true, completion: nil)
            return
        }
        result.text = calculate2.calculate(loanAmount: loanAmount, years: loanTerm, interestRate: interesrRate).money
//        result.text = calculate2.calculate(loanAmount: Double(loanAmountField.text!)!, years: Int(loanTermField.text!)!, interestRate: Double(interestRateField.text!)!).money
        
    }
    
    //shift + command + 0 调出官方的参考文档
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 文本框输入的时候，会成为  firstResponder
        loanAmountField.resignFirstResponder()
        loanTermField.resignFirstResponder()
        interestRateField.resignFirstResponder()
        
        

    }
    
    //guard 测试,有值为nil时才执行else，否则呢，继续往下执行， else里必须加 return
    func demo(name:String?,age:Int?){
        
        guard let name = name,let age = age else {
            print("name or age is nil")
            return
        }
        print("没有空值")
        print(name + String(age))
    }


    //MARK:视图加载完成
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        demo(name: nil, age: 100)
//        
//        demo(name: "tom", age: 18)
        
        

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

// 复利的计算方法
class compoundCalculate{
    func calculate(loanAmount:Double,years:Int,interestRate:Double) -> Double {
        let rate = interestRate / 100
        let compoundInterest = pow(1.0+rate, Double(years))
        return compoundInterest * loanAmount
    }
}
// extension 扩展，可以扩展功能，扩展对象包括class ，enum，struct
extension Double{
    var money:String{
        // 3.0 之前很多带NS前缀的函数，在3.0中都去掉了
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        // 定义一个可选类型 ？，表明它可以为nil
        let result:String?
        result = formatter.string(from: NSNumber(value:self))
        if result == nil{
            return "format error "
        }
        return result!
    }
}

