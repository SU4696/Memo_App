//
//  ComposeViewController.swift
//  SuMemo
//
//  Created by 조수연 on 2022/06/28.
//

import UIKit

class ComposeViewController: UIViewController {
    

    
    
    @IBAction func Close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var MemoTextView: UITextView!
    @IBAction func Save(_ sender: Any) {
        guard let memo=MemoTextView.text, memo.count > 0 else { alert(message: "Type a memo")
            return
        }
        let newMemo=Memo(content:memo)
        Memo.dummyMemoList.append(newMemo)
        
        NotificationCenter.default.post(name: ComposeViewController.newMemoDidInsert, object: nil)
        dismiss(animated: true, completion: nil)
        
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

extension ComposeViewController{
    static let newMemoDidInsert = Notification.Name (rawValue: "newMemoDidInsert")
}
