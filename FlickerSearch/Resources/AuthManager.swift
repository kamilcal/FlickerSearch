//
//  AuthManager.swift
//  FlickerSearch
//
//  Created by kamilcal on 16.12.2022.
//

import Foundation
import FirebaseAuth

public class AuthManager {
    static var shared = AuthManager()
    
    
    public func logOut(completion: (Bool) -> Void){
        do {
           try! Auth.auth().signOut()
            completion(true)
            return
        }
        catch {
            print(error)
            completion(false)
            return
        }
    }
}
