//
//  PhaseTrafficLightView.swift
//  CUIDemoElements
//
//  Created by lizitao on 2023-09-20.
//

import SwiftUI

enum TrafficSignal: String, CaseIterable, Identifiable {
    case red
    case yellow
    case green

    var color: Color {
        switch self {
        case .red: return .red
        case .yellow: return .yellow
        case .green: return .green
        }
    }

    var id: TrafficSignal { self }
}

public struct PhaseTrafficLightView: View {
    
    public init() {}
    
    @State private var currentSignal: TrafficSignal = .red

    public var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 24) {
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(currentSignal == .red ? .red : .gray)
                    .opacity(currentSignal == .red ? 1.0 : 0.2)

                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(currentSignal == .yellow ? .yellow : .gray)
                    .opacity(currentSignal == .yellow ? 1.0 : 0.2)

                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(currentSignal == .green ? .green : .gray)
                    .opacity(currentSignal == .green ? 1.0 : 0.2)
            }
            Spacer()
            Spacer()
        }
      
        .onAppear {
            animateTrafficLight()
        }
    }

    func animateTrafficLight() {
        let signals = TrafficSignal.allCases

        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            withAnimation {
                currentSignal = signals[(signals.firstIndex(of: currentSignal)! + 1) % signals.count]
            }
        }
    }
}

struct PhaseTrafficLightView_Previews: PreviewProvider {
    static var previews: some View {
        PhaseTrafficLightView()
    }
}
