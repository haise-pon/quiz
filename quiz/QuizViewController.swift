//
//  QuizViewController.swift
//  quiz
//
//  Created by 家族PC on 2020/01/22.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit
import AVFoundation

class QuizViewController: UIViewController {
    @IBOutlet var Label: UILabel!
    
    var count: Float = 100.0
    
    var timer: Timer = Timer()
    
    let seikaiplayer = try! AVAudioPlayer(data: NSDataAsset(name: "seikai")!.data)
    let fuseikaiplayer = try! AVAudioPlayer(data: NSDataAsset(name: "fuseikai")!.data)
    
    @IBOutlet var cicreButton1: UIButton!
    @IBOutlet var cicreButton2: UIButton!
    @IBOutlet var cicreButton3: UIButton!
    
    
    var quizArray = [Any]()
    
    var correctAnswer: Int = 0
    
    @IBOutlet var quizTextView: UITextView!
    
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    
    override func viewDidLoad() {
        choiceButton1.layer.cornerRadius = 10
        choiceButton2.layer.cornerRadius = 10
        choiceButton3.layer.cornerRadius = 10
        
        
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector:  #selector(self.up),
                                     userInfo: nil,
                                     repeats: true)
        
        
        
        super.viewDidLoad()
        var  tmpArray = [Any]()
        
        tmpArray.append(["exvsってどのくらい続いているの？","  10年  ","  ５年  ","  ３年  ",1])
        tmpArray.append(["何機体参戦しているの？",
                         "  30機体  ","  80機体  ","  180機体  ",3])
        tmpArray.append(["exvsの魅力って何？","  2on2  ","  全て   ","エクストリームバースト（覚醒）",2])
        tmpArray.append(["家庭用は出てないの？","最新作が出てる","出てない","アーケードの旧バージョンが出てる",3])
        tmpArray.append(["作成者がこのゲームをやってて一番楽しい時はどんな時？","  勝てた時  ","相手をはめた時","叫びながらがゲームしている時",3])
        tmpArray.append(["他のプレイヤーとのマッチはどういう仕方なの？","完全無差別","勝率が近い人同士","近い階級同士",3])
        tmpArray.append(
            ["大会はあるの？","オンライン大会のみ","オフライン大会のみ","  どっちも  ",2])
        tmpArray.append(
            ["アーケードの対戦相手はどこにいるの？","　店内　","店内とオンライン","世界中",2])
        tmpArray.append(
            ["コントローラーは何を使うの？","アーケードコントローラー","よくあるコントローラー","どっちも",3,])
        tmpArray.append(
            ["初めてやる人には難しい？","  簡単  ","操作が難しい","とても難しすぎる",2])
        tmpArray.append(
            ["オンライン対戦の時間は何秒？","  180秒  ","  210秒  ","  240秒  ",2])
        tmpArray.append(
            ["時間切れになるとどうなるの？","試合に一番貢献した人がいるチームの勝ち","  両チーム敗北  ","  両チーム勝利  ",2])
        tmpArray.append(
            ["キャラ同士の強さのバランスはどうなの？","差はあまりない","差が激しい","差はない",2])
        tmpArray.append(
            ["初心者は最初何を乗るべき？","  強機体  ","  弱機体  ","  何でも！  ",1])
        tmpArray.append(
            ["一人でも出来るの？","出来ない","  出来る  ","一人専用のモードだけ出来る",2])
        tmpArray.append(
            ["データは保存されるの？","  保存されない  ","  カードに保存される  ","  機械に保存される  ",2])
        tmpArray.append(
            ["アーケード版では離れている人ともチームを組めるの？","  出来ない  "," 出来る ","タッグを組んだ人だけできる",3])
        tmpArray.append(
            ["家庭版は好きな音楽をbgmに出来るの？"," 出来る "," 出来ない ","決められた音楽の中で決めれる",1])
        tmpArray.append(
            ["質問者はどのくらいの強さの機体を使うか？"," 弱機体 "," 中堅機体 "," 強機体 ",3])
        tmpArray.append(
            ["初心者が一番使いにくい機体の種類は？"," 格闘機 "," 射撃機 "," 万能機 ",1])
        tmpArray.append(
            ["上手いプレイヤーとは？","相手の沢を上手く捌くことができる","試合に勝つことが出来る","強気なプレイができる",1])
        tmpArray.append(
            ["強いプレイヤーとは？","強気なプレイができる","強い武装を相手に押し付けられる","強気に攻めれる",2])
        
        while (tmpArray.count > 0) {
            let  index = Int(arc4random()) % tmpArray.count
            quizArray.append(tmpArray[index])
            tmpArray.remove(at: index)
        }
        choiceQuiz()
    }
    
    
    func choiceQuiz() {
        
        let tmpArray = quizArray[0] as! [Any]
        
        quizTextView.text = (tmpArray[0] as! String)
        
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
        
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        
        let  tmpArray = quizArray[0] as! [Any]
        
        if tmpArray[4] as! Int == sender.tag {
            
            correctAnswer = correctAnswer + 1
            let alert: UIAlertController = UIAlertController(title: "正解！", message:"おめでとう",preferredStyle:.alert)
            let okaction: UIAlertAction = UIAlertAction(title:"OK", style: .default, handler:{
                (action: UIAlertAction!) -> Void in
                
                self.quizArray.remove(at: 0)
                
                if self.quizArray.count == 0 {
                    self.perfromSegueToResult()
                    
                }else{
                    self.choiceQuiz()
                    
                }
                
            }
            )
            alert.addAction(okaction)
            self.present(alert, animated: true, completion: nil)
            seikaiplayer.currentTime = 0
            seikaiplayer.play()
        }else{
            fuseikaiplayer.currentTime = 0
            fuseikaiplayer.play()
            let alert: UIAlertController = UIAlertController(title: "不正解！", message:"残念",preferredStyle:.alert)
            let okaction: UIAlertAction = UIAlertAction(title:"OK", style: .default, handler:{
                (action: UIAlertAction!) -> Void in
                
                self.quizArray.remove(at: 0)
                
                if self.quizArray.count == 0 {
                    self.perfromSegueToResult()
                    
                }else{
                    self.choiceQuiz()
                    
                }
                
            }
            )
            alert.addAction(okaction)
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    func  perfromSegueToResult() {
        if timer.isValid {
            timer.invalidate()
        }
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue,sender:Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnwer = self.correctAnswer
            
        }
    }
    @objc func up(){
        count = count - 1.0
        Label.text = String(count)
        
        
        if  count <= 0{
            if timer.isValid {
                timer.invalidate()
            }
            performSegue(withIdentifier: "toResultView", sender: nil)
        }
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


