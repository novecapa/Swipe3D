//
//  ContentView.swift
//  Swipe3D
//
//  Created by Josep Cerdá Penadés on 5/11/24.
//

import SwiftUI

struct ContentView: View {

    private enum Constants {
        static let perspective: CGFloat = 2.5
        static let rotationAngle: CGFloat = 25
    }

    @State private var currentIndex = 0
    @GestureState private var dragOffset: CGFloat = 0

    private let mainViewWidth: CGFloat
    init(mainViewWidth: CGFloat = UIScreen.main.bounds.width) {
        self.mainViewWidth = mainViewWidth
    }
    
    private let pages = Array(repeating: "Page", count: 10)
    
    var body: some View {
        TabView {
            ForEach(0..<pages.count, id: \.self) { index in
                GeometryReader { geometry in
                    ZStack {
                        Color.pink.opacity(0.2 * Double(index + 1))
                        Text("\(pages[index]) \(index + 1)")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                    }
                    .frame(width: geometry.frame(in: .global).width,
                           height: geometry.frame(in: .global).height)
                    .rotation3DEffect(
                        .init(degrees: getAngle(geometry.frame(in: .global).minX)),
                        axis: (x: 0.00, y: 1.00, z: 0.00),
                        anchor: geometry.frame(in: .global).minX > 0 ? .leading : .trailing,
                        perspective: Constants.perspective
                    )
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }

    private func getAngle(_ xOffset: CGFloat) -> Double {
        let tempAngle = xOffset / (mainViewWidth / 2)
        let rotationAngle: CGFloat = Constants.rotationAngle
        return Double(tempAngle * rotationAngle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

