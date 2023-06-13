//
//  GalleryView.swift
//  Africa
//
//  Created by Leonardo Lazzari on 27/04/23.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES
    
    @State private var selectedAnimal: String = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // SIMPLE GRID DEFINITION
    // let gridLayout: [GridItem] = [
    //     GridItem(.flexible()),
    //     GridItem(.flexible()),
    //     GridItem(.flexible())
    // ]
    
    // EFFICIENT GRID DEFINITION
    // let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // DYNAMIC GRID LAYOUT
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    // MARK: - FUNCTIONS
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                // MARK: - Image
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(Color.white, lineWidth: 8)
                    }
                
                // MARK: - Slider
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { _ in
                        withAnimation(.easeIn) {
                            gridSwitch()
                        }
                    }
                
                // MARK: - Grid
                VStack {
                    LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                        ForEach(animals) { animal in
                            Image(animal.image)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .overlay {
                                    Circle()
                                        .stroke(Color.white, lineWidth: 1)
                                }
                                .onTapGesture {
                                    selectedAnimal = animal.image
                                    hapticImpact.impactOccurred()
                                }
                        } //: FOREACH
                    } //: GRID
                    .onAppear {
                        gridSwitch()
                    }
                } //: VSTACK
                .padding(.horizontal, 10)
                .padding(.vertical, 50)
            }
            
        } //: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
