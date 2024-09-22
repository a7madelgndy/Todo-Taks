//
//  Task.swift
//  IOS-Tasks-App
//
//  Created by Ahmed El Gndy on 22/09/2024.
//

import Foundation
import FirebaseFirestore

struct Task: Identifiable, Codable {
    @DocumentID var id: String? // this property wrapper is used in Firestore to automatically map a document’s ID to the id field in the struct.
    @ServerTimestamp var createdAt: Date?
    let title: String
}
