//
//  CommentViewController.swift
//  Instagram
//
//  Created by 新井美咲 on 2023/01/07.
//

import UIKit
import Firebase

class CommentViewController: UIViewController {
    
    var postData: PostData!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func handlePostButton(_ sender: Any) {
        var updateValue: FieldValue
        
        let commentText = textField.text!
        let name = Auth.auth().currentUser!.displayName!
        let comment = "\(name) : \(commentText)\n"
        
        updateValue = FieldValue.arrayUnion([comment])
        
        let postRef = Firestore.firestore().collection(Const.PostPath).document(postData.id)
        postRef.updateData(["comments": updateValue])
        
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func handleCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
