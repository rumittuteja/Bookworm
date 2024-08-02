//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Rumit Singh Tuteja on 5/14/24.
//

import SwiftUI

struct EmojiRatingView: View {
    
    let rating: Int
    
    var body: some View {
        switch rating {
        case 1:
            Text("DLI")
        case 2:
            Text("DE")
        case 3:
            Text("M")
        case 4:
            Text("I!")
        case 5:
            Text("BBE!")
        default:
            Text("BBE!")
        }
    }
}

#Preview {
    EmojiRatingView(rating: 5)
}
