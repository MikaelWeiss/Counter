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
        NavigationView {
            VStack(spacing: 0) {
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
            .font(.system(size: 100, weight: .bold, design: .rounded))
            .edgesIgnoringSafeArea([.horizontal, .bottom])
            .navigationBarTitle("Stepper")
            .navigationBarItems(
                leading: Button(action: {}, label: {
                    Text("")
                }),
                trailing: Button(action: {
                    playerOne = 0
                    playerTwo = 0
                }, label: {
                    Text("Reset")
                }))
        }
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
