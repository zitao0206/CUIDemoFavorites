//
//  SimpleSliderView.swift
//  CUIDemoElements
//
//  Created by zitao0206 on 2023/6/10.
//

import SwiftUI

public struct SimpleSliderView: View {
    public init() {}
    @State var sliderValue: Double = 3
    @State var color: Color = .red
    public var body: some View {
        VStack {
            Text("Rating:")
            Text(
                String(format: "%.0f", sliderValue)
                //"\(sliderValue)"
            )
            .foregroundColor(color)
            //Slider(value: $sliderValue)
            //Slider(value: $sliderValue, in: 1...5)
            //Slider(value: $sliderValue, in: 1...5, step: 1.0)
            Slider(
                value: $sliderValue,
                in: 1...5,
                step: 1.0,
                onEditingChanged: { (_) in
                    color = .green
                },
                minimumValueLabel:
                    Text("1")
                    .font(.largeTitle)
                    .foregroundColor(.orange)
                ,
                maximumValueLabel: Text("5"),
                label: {
                    Text("Title")
                })
                .accentColor(.red)
        }
    }
}
struct SimpleSliderView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleSliderView()
    }
}
