//
//  MainImageBoxView.swift
//  PhotoTrading
//
//  Created by Tate Mouser on 9/12/23.
//

import SwiftUI

struct DottedBoxView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 8) // Adjust cornerRadius as needed
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5])) // Adjust lineWidth and dash pattern as needed
            .frame(width: 65, height: 90)
            .colorInvert()
    }
}

struct CheckMarkStatusView: View {
    var body: some View {
        Text("✓")
            .font(.system(size: 30))
            .foregroundColor(.green)
    }
}

struct XMarkStatusView: View {
    var body: some View {
        Text("X")
            .font(.system(size: 30))
            .foregroundColor(.red)
    }
}

struct MainImageBoxView: View {
    var body: some View {
        VStack {
            HStack {
                DottedBoxView()
                DottedBoxView()
                DottedBoxView()
                DottedBoxView()
                
                CheckMarkStatusView()
                XMarkStatusView()
            }
            //.padding(.trailing, 50)
            
            HStack {
                DottedBoxView()
                DottedBoxView()
                DottedBoxView()
                DottedBoxView()
                
                CheckMarkStatusView()
                XMarkStatusView()
            }
            //.padding(.trailing, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}

struct MainImageBoxView_Previews: PreviewProvider {
    static var previews: some View {
        MainImageBoxView()
    }
}
