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
                            .foregroundColor(color ? Color(#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)) : Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)))
                        Text("\(playerOne)")
                            .foregroundColor(color ? .white : .white)
                        VStack {
                            Text(color ? "Serve" : "").font(.system(size: 35, weight: .heavy, design: .rounded))
                                .padding()
                            Spacer()
                        }
                    }
                    .onTapGesture {
                        playerOne += 1
                        testColor(first: playerOne, second: playerTwo, value: &color)
                    }
                    ZStack {
                        Rectangle()
                            .foregroundColor(color ? Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)) : Color(#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)))
                        Text("\(playerTwo)")
                            .foregroundColor(color ? .white : .white)
                        VStack {
                            Text(color ? "" : "Serve").font(.system(size: 35, weight: .heavy, design: .rounded))
                                .padding()
                            Spacer()
                        }
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
