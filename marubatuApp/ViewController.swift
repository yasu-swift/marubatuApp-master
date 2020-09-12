//
//  ViewController.swift
//  marubatuApp
//
//  Created by 高橋康之 on 2020/09/12.
//  Copyright © 2020 yasu.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //最初の画面
        showQuestion()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //空にしとくのが安全
        questions = []
        
        let userDefaults = UserDefaults.standard
        //Data取ってくる
        if userDefaults.object(forKey: "questions") != nil{
            
            questions = userDefaults.object(forKey: "questions") as! [[String:Any]]
            
        }
        //最初の画面
        showQuestion()
        //ここまで
    }
    
    @IBOutlet weak var questionLabel: UILabel!
    //ここから追加
    var trueAnswer = 0
    var falseAnswer = 0
    var currentQuestionNum = 0
    var questions : [[String:Any]] = []
    
//    let questions: [[String:Any]] = [
//        [
//         "question":"iphoneの開発環境はxcodeである",
//         "answer":true
//        ],
//        ["question":"パクチーは美味しい",
//         "answer":false
//        ],
//        ["question":"鶏肉は美味い",
//         "answer":true
//        ]
//    ]
    
    //問題を表示する
    func showQuestion(){
        
        if (questions.count > currentQuestionNum){
            
          let question = questions[currentQuestionNum]
            
          if let que = question["question"] as? String {
            //問題文が有る時
            
            //問題文の表示
            questionLabel.text = que
            //ボタン押せる
            falseButton.isEnabled = true
            trueButton.isEnabled = true
           
            }
        } else {
            //問題文が無い時
            
            //問題文の表示
            questionLabel.text = "問題を作ってください"
            //ボタン押せない
            falseButton.isEnabled = false
            trueButton.isEnabled = false
        
        }
    }
    
    
    @IBAction func questionMove(_ sender: Any) {
        // ①storyboardのインスタンス取得
               let storyboard: UIStoryboard = self.storyboard!
        
               // ②遷移先ViewControllerのインスタンス取得
               let nextView = storyboard.instantiateViewController(withIdentifier: "view3") as! QuestionViewController
        
               // ③画面遷移
               self.present(nextView, animated: true, completion: nil)
         
    }
    
    
    //回答のチェック
    func checkAnswer(userAnswer:Bool){
        
        
        
        
        
        let question = questions[currentQuestionNum]
        if let ans = question["answer"] as? Bool {
            //正解
            if userAnswer == ans {
                //1進める
                currentQuestionNum += 1
                showAlert(message: "正解")
                 //ここから追加
                trueAnswer += 1
                print(trueAnswer)
                print(falseAnswer)
                 
                
            } else {
                //不正解
                showAlert(message: "不正解")
                //1進める
                currentQuestionNum += 1
                 //ここから追加
                falseAnswer += 1
                print(trueAnswer)
                print(falseAnswer)
            }
        } else {
            
            
            print("答えがありません")
            return
        }
        
        
        
        if currentQuestionNum >= questions.count {
            
//ループする
//            currentQuestionNum = 0
        }
        
        //問題の表示
        //正解だったら次の問題が表示される
        //不正解だったら、そのまま同じ問題が表示される
        showQuestion()
        
        
        
        
  }
    //アラート
    func showAlert(message : String){
        
        
        if currentQuestionNum >= questions.count{
        // ①storyboardのインスタンス取得
               let storyboard: UIStoryboard = self.storyboard!
        
               // ②遷移先ViewControllerのインスタンス取得
               let nextView = storyboard.instantiateViewController(withIdentifier: "view4") as! AnswerViewController
        
               // ③画面遷移
               self.present(nextView, animated: true, completion: nil)
        }
        
        //決まり事項
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        
        alert.addAction(close)
        
        present(alert, animated: true, completion: nil)
        //決まり事項ここまで
    }
    
    
    @IBOutlet var falseButton: UIButton!
    
    @IBOutlet var trueButton: UIButton!
    
    
    @IBAction func falseButton(_ sender: Any) {
        checkAnswer(userAnswer: false)
        
    }
    
    
    @IBAction func trueButton(_ sender: Any) {
        checkAnswer(userAnswer: true)
        
    }
    
    
    
    @IBAction func tapModoru(_ sender: Any) {
        //戻る
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
}

