//
//  ListAnimation.swift
//  Lessons
//
//  Created by Muhammed Taha Çağlar on 15.06.2023.
//

import SwiftUI

struct ArchivesView: View {
    @State var Contacts: [String] = [
        "Taha", "ahmet", "Emirhan", "Doga","Canberk"
    ]
    @State var archivedContacts: [String] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Contacts, id: \.self) { contact in
                    Text(contact.capitalized)
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button("Archive") {
                                archive(contact: contact)
                            }
                            .tint(.green)
                        }
                       
                }
                .onDelete(perform: delete)
            }
            .navigationBarItems(trailing: NavigationLink(destination: ArchivedView(archivedContact: archivedContacts, restoreContact: restoreContact)) {
                Text("Archive")
            })
            .navigationBarTitle("Contacts")
        }
    }
    
    func delete(at offsets: IndexSet) {
        Contacts.remove(atOffsets: offsets)
    }
    
    func archive(contact: String) {
        if let index = Contacts.firstIndex(of: contact) {
            let archivedContact = Contacts.remove(at: index)
            archivedContacts.append(archivedContact)
        }
    }
    
 
    func restoreContact(contact: String) {
        if let index = archivedContacts.firstIndex(of: contact) {
            let restoredContact = archivedContacts.remove(at: index)
            Contacts.append(restoredContact)
        }
    }
}

struct ArchivedView: View {
    var archivedContact: [String]
    var restoreContact: (String) -> Void
    
    var body: some View {
        List(archivedContact, id: \.self) { contact in
            Text(contact.capitalized)
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button("Remove") {
                        restoreContact(contact)
                    }
                    .tint(.red)
                }
                
        }
        .navigationBarTitle("Archived Contacts")
    }
}

struct ArchivesView_Previews: PreviewProvider {
    static var previews: some View {
        ArchivesView()
    }
}
