//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by Zdenko Čepan on 30/07/2021.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
