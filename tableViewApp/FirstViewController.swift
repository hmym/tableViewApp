//
//  FirstViewController.swift
//  tableViewApp
//
//  Created by 濱山知香 on 2019/08/16.
//  Copyright © 2019 hmym.com. All rights reserved.
//

import UIKit
// UITableViewDelegate, UITableViewDataSourceを宣言
class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // String型の空の配列を宣言
    var resultLists = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 配列の数分だけ行を生成
        return resultLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = resultLists[indexPath.row]
        return cell
    }
    

    @IBOutlet weak var listsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listsTable.delegate = self
        listsTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    // 再読み込みされる度に行われる処理
    override func viewWillAppear(_ animated: Bool) {
        // 定型文
        super.viewWillAppear(animated)
        // キー値；addに値が保存されていたら
        if UserDefaults.standard.object(forKey: "add") != nil {
            // 配列にその値を入れる
            resultLists = UserDefaults.standard.object(forKey: "add") as! [String]
        }
        // tableViewを更新する
        listsTable.reloadData()
    }
    
    // cellを編集したい時に呼び出す関数
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // cellの編集スタイルをdeleteに決める
        if editingStyle == .delete {
            // ユーザーが指定した行を配列から削除する
            resultLists.remove(at: indexPath.row)
            // UserDefaultsの値を保存
            UserDefaults.standard.set(resultLists, forKey: "add")
            // tableViewを再読み込み
            listsTable.reloadData()
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
