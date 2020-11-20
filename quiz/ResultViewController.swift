//
//  ResultViewController.swift
//  quiz
//
//  Created by 家族PC on 2020/01/22.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var circleButton4: UIButton!
    
    var correctAnwer: Int = 0
    
    @IBOutlet var KenteiLabel: UILabel!
    @IBOutlet var Label2: UILabel!
    @IBOutlet var Label: UILabel!
    @IBOutlet var rankLabel: UILabel!
    var rankNumber: String!
    
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        var top = UserDefaults.standard.integer(forKey: "top")
        var top2 = UserDefaults.standard.integer(forKey: "top2")
        var top3 = UserDefaults.standard.integer(forKey: "top3")
        
        if top < correctAnwer {
            UserDefaults.standard.set(correctAnwer, forKey: "top")
            UserDefaults.standard.set(top, forKey: "top2")
            UserDefaults.standard.set(top2, forKey: "top3")
        }else if top2 < correctAnwer {
            UserDefaults.standard.set(correctAnwer, forKey: "top2")
            UserDefaults.standard.set(top2, forKey: "top3")
        }else if top3 < correctAnwer {
            UserDefaults.standard.set(correctAnwer, forKey: "top3")
        }
        rankLabel.text = "1位: " + String(top)
        Label.text = "2位: " + String(top2)
        Label2.text = "3位: " + String(top3)
       // 
        
        circleButton4.layer.cornerRadius = 10
        super.viewDidLoad()
        
        resultLabel.text = String(correctAnwer)
        
        rankNumber = KenteiLabel.text
    
        if Int(rankNumber) == 23{
            KenteiLabel.text = String("大元帥")
        }else if Int(rankNumber) == 21{
            KenteiLabel.text = String("元帥")
        }else {
            KenteiLabel.text = "普通"
        }

        // Do any additional setup after loading the view.
    }
    @IBAction func back() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    @IBAction func share() {// 共有する項目の設定
        let shareText = "あなたは"+String(correctAnwer)+"点を獲得しました。"
        let activityItems = [shareText] as [Any]

        // 共有画面を作っているよ
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)

        // 共有画面を表示しているよ
        self.present(activityVC, animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
