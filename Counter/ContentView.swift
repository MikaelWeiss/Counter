//
//  ContentView.swift
//  Counter
//
//  Created by Mikael Weiss on 10/10/20.
//

import SwiftUI

struct ContentView: View {
    @State private var playerOne = 0
    @State private var playerTwo = 0
    @State private var color = false
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Rectangle()
                    .foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                    .frame(height: 66)
            }
            .onTapGesture {
                playerOne = 0
                playerTwo = 0
            }
            HStack(spacing: 0) {
                ZStack {
                    Rectangle()
                        .foregroundColor(color ? .white : .black)
                    Text("\(playerOne)")
                        .foregroundColor(color ? .black : .white)
                }
                .onTapGesture {
                    playerOne += 1
                    testColor(first: playerOne, second: playerTwo, value: &color)
                }
                ZStack {
                    Rectangle()
                        .foregroundColor(color ? .black : .white)
                    Text("\(playerTwo)")
                        .foregroundColor(color ? .white : .black)
                }
                .onTapGesture {
                    playerTwo += 1
                    testColor(first: playerOne, second: playerTwo, value: &color)
                }
            }
        }
        .font(.system(size: 80, weight: .bold, design: .rounded))
        .edgesIgnoringSafeArea(.all)
    }
}

func testColor(first: Int, second: Int, value: inout Bool) {
    if (first + second)%5 == 0 {
        value = !value
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
