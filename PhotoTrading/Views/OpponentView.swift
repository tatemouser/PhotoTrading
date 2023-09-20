//
//  OpponentView.swift
//  PhotoTrading
//
//  Created by Tate Mouser on 9/19/23.
//

import SwiftUI

struct OpponentView: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text("NAME HERE")
                    .font(.system(size: 26))
                    .bold()
                    .underline()
                    .frame(maxWidth: .infinity, alignment: .center)
                Spacer()
            }
            ZStack {
                HStack {
                    DottedBoxView()
                    DottedBoxView()
                    DottedBoxView()
                    DottedBoxView()
                    DottedBoxView()
                }
                .padding(.bottom, 15)
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .frame(width: .infinity, height: .infinity)
        .background(Color.black)
    }
}

struct OpponentView_Previews: PreviewProvider {
    static var previews: some View {
        OpponentView()
    }
}
