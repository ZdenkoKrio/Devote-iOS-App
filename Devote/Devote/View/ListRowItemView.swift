//
//  ListRowItemView.swift
//  Devote
//
//  Created by Zdenko Čepan on 31/07/2021.
//

import SwiftUI

struct ListRowItemView: View {
    // MARK: - Properties
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item
    
    // MARK: - Body
    var body: some View {
        Toggle(isOn: $item.completion, label: {
            Text(item.task ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.completion ? .pink : .primary)
                .padding(.vertical, 12)
                .animation(.default)
        }) // TOGGLE
        .toggleStyle(CheckboxStyle())
        .onReceive(item.objectWillChange, perform: { _ in
            if self.viewContext.hasChanges {
                try? viewContext.save()
            }
        })
    }
}
