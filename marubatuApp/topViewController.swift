//
//  topViewController.swift
//  marubatuApp
//
//  Created by 高橋康之 on 2020/09/12.
//  Copyright © 2020 yasu.com. All rights reserved.
//

import UIKit

class topViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    
    
    @IBAction func questionButton(_ sender: Any) {
        
               // ①storyboardのインスタンス取得
               let storyboard: UIStoryboard = self.storyboard!
        
               // ②遷移先ViewControllerのインスタンス取得
               let nextView = storyboard.instantiateViewController(withIdentifier: "view3") as! QuestionViewController
        
               // ③画面遷移
               self.present(nextView, animated: true, completion: nil)
           }
        
    
    
    @IBAction func marubatuButton(_ sender: Any) {
        
        // ①storyboardのインスタンス取得
               let storyboard: UIStoryboard = self.storyboard!
        
               // ②遷移先ViewControllerのインスタンス取得
               let nextView = storyboard.instantiateViewController(withIdentifier: "view2") as! ViewController
        
               // ③画面遷移
               self.present(nextView, animated: true, completion: nil)
        
        
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
