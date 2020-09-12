//
//  QuestionViewController.swift
//  marubatuApp
//
//  Created by 高橋康之 on 2020/09/12.
//  Copyright © 2020 yasu.com. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        questionField.delegate = self
        
        
    }
    // userが保存した時に内容を入れる配列
    var questions:[[String:Any]] = []
    
    //問題出す
    @IBOutlet var questionField: UITextField!
    
    //○× 右が0左が1
    @IBOutlet var marubatuContrroller: UISegmentedControl!
    
    //保存
    @IBAction func tapSeveButton(_ sender: Any) {
        if questionField.text != ""{
            var marubatuAnswer:Bool = true
            
            if marubatuContrroller.selectedSegmentIndex == 0 {
                marubatuAnswer = false
            } else {
                marubatuAnswer = true
            }
            // UserDefaults,standardをuserDefaultsに短縮
            let userDefaults = UserDefaults.standard
            //
            if userDefaults.object(forKey:"questions") != nil{
                questions = userDefaults.object(forKey: "questions") as! [[String: Any]]
            }
            // 配列にアペンド
            questions.append(
                ["question" : questionField.text!,"answer":marubatuAnswer
                ])
            //保存
            userDefaults.set(questions,forKey: "questions")
            //ユーザーにアラートを表示
            showAlert(message: "問題が保存されました")
            //テキストフィールドを空にする
            questionField.text = ""
            
            print(questions)
            
            
        } else {
            
            showAlert(message: "問題を作成してください")
        }
    }
    
    //全て削除
    @IBAction func tapAllDeleteButton(_ sender: Any) {
        // UserDefaults,standardをuserDefaultsに短縮
        let userDefaults = UserDefaults.standard
        //保存している内容を削除
        userDefaults.removeObject(forKey: "questions")
        //保存
        userDefaults.set([], forKey: "questions")
        //アラート
        showAlert(message: "問題を全て削除しました")
        
        print(questions)
        
    }
    
    //戻る
    @IBAction func tapBackButton(_ sender: Any) {
        
//        //戻る
        self.dismiss(animated: true, completion: nil)
//        //2つ前に戻る
//        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    //アラート
    func showAlert(message : String){
        //決まり事項
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        
        alert.addAction(close)
        
        present(alert, animated: true, completion: nil)
        //決まり事項ここまで
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
