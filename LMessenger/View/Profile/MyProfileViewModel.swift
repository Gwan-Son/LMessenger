//
//  MyProfileViewModel.swift
//  LMessenger
//
//  Created by 심관혁 on 2/7/24.
//

import Foundation

@MainActor
class MyProfileViewModel: ObservableObject {
    
    @Published var userInfo: User?
    @Published var isPresentedDescEditView: Bool = false
    
    private var container: DIContainer
    private let userId: String
    
    init(container: DIContainer, userId: String) {
        self.container = container
        self.userId = userId
    }
    
    func getUser() async {
        if let user = try? await container.services.userService.getUser(userId: userId){
            userInfo = user
        }
    }
    
    func updateDescription(_ description: String) async {
        do {
            try await container.services.userService.updateDescription(userId: userId, description: description)
            userInfo?.description = description
        } catch {
            
        }
    }
}
