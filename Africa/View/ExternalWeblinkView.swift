//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Leonardo Lazzari on 27/04/23.
//

import SwiftUI

struct ExternalWeblinkView: View {
    // MARK: - PROPERTIES
    let animal: Animal
    
    // MARK: - BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Link(destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!) {
                        HStack {
                            Image(systemName: "arrow.up.right.square")
                            Text(animal.name)
                        }
                    }
                }
            } //: HSTACK
        } //: BOX
    }
}

// MARK: - PREVIEW
struct ExternalWeblinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalWeblinkView(animal: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
