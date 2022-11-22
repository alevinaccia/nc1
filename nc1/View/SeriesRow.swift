//
//  SeriesRow.swift
//  nc1
//
//  Created by Alessandro Vinaccia on 19/11/22.
//

import SwiftUI

struct SeriesRow: View {
    let series : Series
    
    var body: some View {
        HStack(spacing: 0){
            Image(series.exe.image).resizable()
                .frame(width: 50, height: 50, alignment: .leading)
            
            Text(series.exe.name).font(.system(size: 13))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            GroupBox{
                HStack{
                    Text("\(series.exe.improvement)%").font(.system(size: 13))
                    Image(systemName: "arrow.up")
                }.frame(width: 55)
                .foregroundColor( series.exe.improvement > 0 ? .green : .red)
            }
            .frame(maxWidth: .infinity,alignment: .trailing)
        }.padding()
    }
}
