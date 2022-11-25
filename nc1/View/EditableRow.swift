//
//  EditableRow.swift
//  nc1
//
//  Created by Alessandro Vinaccia on 21/11/22.
//

import SwiftUI

struct EditableRow: View {
    
    @Binding var lr : Vector2
    @Binding var rec : Int
    @Binding var timerGoing : Bool
    @Binding var completedExe : Bool
    @Binding var count : Int
    @State var selected : Bool = true
    
    var body : some View{
        
        ZStack{
            if selected{
                HStack(spacing: 40){
                    Toggle("Done", isOn: $lr.done)
                        .toggleStyle(.button)
                        .tint(.mint)
                        .onChange(of: lr.done) { newValue in
                            lr.setVolume()
                            if timerGoing {
                                count = 0
                            }
                            timerGoing = true
                        }.disabled(lr.done)
                    Button {
                        withAnimation {
                            selected.toggle()
                        }
                    } label: {
                        HStack(spacing: 40){
                            Text("\(lr.x)")
                            Text("\(lr.y)")
                            Text("\(rec)")
                        }
                            Spacer()
                    }.padding(.leading)
                }
                
                    
            } else {
                VStack{
                    HStack{
                        Picker("Select a number", selection: $lr.x) {
                            ForEach(0..<151) {
                                if $0.isMultiple(of: 5){
                                    Text("\($0)")
                                }
                            }
                        }.pickerStyle(.wheel)
                        
                        Picker("Select a number", selection: $lr.y) {
                            ForEach(0..<21) {
                                Text("\($0)")
                            }
                        }.pickerStyle(.wheel)
                        
                        Picker("Select a number", selection: $rec) {
                            ForEach(0..<91) {
                                Text("\($0)")
                            }
                        }.pickerStyle(.wheel)
                        
                    }
                    Button {
                        withAnimation {
                            selected.toggle()
                        }
                    } label: {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.black)
                    }
                    
                }
            }
            
        }
    }
}
