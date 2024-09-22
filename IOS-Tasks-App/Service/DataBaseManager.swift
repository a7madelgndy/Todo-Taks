//
//  DataBaseManager.swift
//  IOS-Tasks-App
//
//  Created by Ahmed El Gndy on 22/09/2024.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
//resposibilities to communicate with fireBase database
class DataBaseManager{
    private let db = Firestore.firestore()
    private lazy var tasksCollection = db.collection("tasks")
    
    func addTask(_ task: Task, completion: @escaping (Result<Void, Error>)->Void ){
        do {
            _ = try tasksCollection.addDocument(from: task ,completion: { (error) in
                if let error = error {
                    completion(.failure(error))
                }
                else  {
                    completion(.success(()))
                }
            })
        }catch (let error){
            completion(.failure(error))

        }
    }
}
