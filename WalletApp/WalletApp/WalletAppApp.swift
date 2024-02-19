//
//  WalletAppApp.swift
//  WalletApp
//
//  Created by Sameera Shah on 2/14/24.
//

import SwiftUI

@main
struct WalletAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(usernames: .constant([""]), passwords: .constant([""]), firstNames: .constant([""]), lastNames: .constant([""]))
        }
    }
}
