//
//  OpponentImageBoxView.swift
//  PhotoTrading
//
//  Created by Tate Mouser on 9/12/23.
//

import SwiftUI

struct OpponentImageBoxView: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text("NAME HERE")
                    .font(.system(size: 26))
                    .bold()
                    .underline()
                    .padding(.leading, 30)
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
            }
        }
        .padding(.top, 40)
    }
    
}

struct OpponentImageBoxView_Previews: PreviewProvider {
    static var previews: some View {
        OpponentImageBoxView()
    }
}
