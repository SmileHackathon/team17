import UIKit
import Foundation
import Firebase
import FirebaseFirestore

FirebaseApp.configure()

let db = Firestore.firestore()

let docRef = db.collection("大角亮介").document("リクエスト")

docRef.getDocument { (document, error) in
    if let document = document, document.exists {
        let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
        print("Document data: \(dataDescription)")
    } else {
        print("Document does not exist")
    }
}

