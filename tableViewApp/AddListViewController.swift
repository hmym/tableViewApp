//
//  AddListViewController.swift
//  tableViewApp
//
//  Created by 濱山知香 on 2019/08/16.
//  Copyright © 2019 hmym.com. All rights reserved.
//

import UIKit

class AddListViewController: UIViewController {
    // String型の空の配列を宣言
    var lists = [String]()
    @IBOutlet weak var addText: UITextField!
    
    @IBAction func addButton(_ sender: Any) {
        
        if UserDefaults.standard.object(forKey: "add") != nil {
            // 配列にその値を入れる
            lists = UserDefaults.standard.object(forKey: "add") as! [String]
        }
        // addTextに入力された値を配列に追加します
        lists.append(addText.text!)
        
        // 配列listsを保存する。キー値はaddとします。
        UserDefaults.standard.set(lists, forKey: "add")
        
        // 画面を一つ戻る
        self.navigationController?.popViewController(animated: true)
        print(lists)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
