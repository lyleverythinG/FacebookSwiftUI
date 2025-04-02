//
//  ImageUploader.swift
//  FacebookSwiftUI
//
//  Created by Lyle Dane Carcedo on 4/2/25.
//

import SwiftUI
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else {return nil}
        let fileName = UUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/profile_img/\(fileName)")
        do {
            let _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch {
            print("failed to upload image with error \(error)")
            return nil
        }
    }
    
    static func uploadCoverImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else {return nil}
        let fileName = UUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/profile_img/\(fileName)")
        do {
            let _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch {
            print("failed to upload image with error \(error)")
            return nil
        }
    }
}
