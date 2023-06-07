//
//  ContentView.swift
//  Slots
//
//  Created by Kevin Savinovich on 4/5/23.
//

import SwiftUI
   
struct ContentView: View {
    @ObservedObject var viewModel = ModelOfTheView()
    
   
    var body: some View {
        VStack{
            showBalance()
            GeometryReader { geometry in
                HStack{
                    Spacer()
                    ForEach(viewModel.cards[0..<3], id: \.self) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .frame(width: (geometry.size.width / 4))
                    }
                    Spacer()
                }
            }
            HStack{
                newGame
                Spacer()
                spin
            }
            .padding(.horizontal)
            Spacer()

        }
    }
    
    func showBalance() -> Text {
        return Text("Balance $ \(viewModel.score)").font(.system(size:50 ))
    }
    
    var spin : some View {
        Button {
            viewModel.spinIntent()
        } label: {
            VStack {
                Image(systemName: "repeat.circle")
                    .font(.system(size: 40))
                Text("Spin")
                    .font(.system(size: 15))
            }
        }

    }
    
    var newGame : some View {
        Button {
            viewModel.newGameIntent()
        } label: {
            VStack {
                Image(systemName: "restart.circle")
                    .font(.system(size: 40))
                Text("New Game")
                    .font(.system(size: 15))
            }
        }
    }
}


struct CardView: View {
    var card: SlotsCard
    
    var body: some View {
        ZStack(alignment: .center) {
            let shape = RoundedRectangle(cornerRadius: 13.0)
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: 2.0)
            VStack {
                Text(getSymbol(for: card))
                    .font(.system(size: 50))
                    .foregroundColor(getColor(for: card))
                    .opacity(getShade(for: card))
            }
        }
    }
    
    func getSymbol(for card: SlotsCard) -> String {
        switch (card.shape, card.shade) {
        case (.triangleUp, .outlined):
            return "△"
        case (.triangleRight, .outlined):
            return "▷"
        case (.triangleDown, .outlined):
            return "▽"
        case (.triangleLeft, .outlined):
            return "◁"
        case (.triangleUp, _):
            return "▲"
        case (.triangleRight, _):
            return "▶"
        case (.triangleDown, _):
            return "▼"
        case (.triangleLeft, _):
            return "◀"
        }
    }
    
    func getColor(for card: SlotsCard) -> Color {
        switch card.color {
        case .red:
            return .red
        case .green:
            return .green
        case .purple:
            return .purple
        case .blue:
            return .blue
        }
    }
    
    func getShade(for card: SlotsCard) -> Double {
        switch card.shade {
        case .outlined:
            return 1.0
        case .striped:
            return 0.3
        case .filled:
            return 1.0
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = ModelOfTheView()
        Group {
            ContentView(viewModel: game)
        }
    }
}
