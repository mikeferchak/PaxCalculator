//
//  TimeInputView.swift
//  PAX calculator (watchOS) WatchKit Extension
//
//  Created by Mike Ferchak on 3/16/22.
//

import SwiftUI

struct TimeInputView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @AppStorage("inputTime") var inputTime: Double = 60.000
    @AppStorage("inputClass") var inputClass: SoloClass = .SSC
    var selectedClass: SoloClass
    var initialTime: Double
    
    @State private var seconds: Int = 0;
    @State private var tenths: Int = 0;
    @State private var hundredths: Int = 0;
    @State private var thousandths: Int = 0;
    @State private var inputTimeTemp: Double?;
    
    var body: some View {
        VStack {
            Text(selectedClass.rawValue)
                .font(.title)
            
            HStack {
                Picker("Seconds", selection: $seconds) {
                    ForEach(0..<200) { number in
                        Text(String(number)).id(number)
                            .dynamicTypeSize(.small)
                    }
                }
                .onChange(of: seconds, perform: onChangeInputTime)
                .labelsHidden()
                
                Text(".").dynamicTypeSize(.small)
                
                Picker("Tenths", selection: $tenths) {
                    ForEach(0..<10) { number in
                        Text(String(number)).id(number)
                            .dynamicTypeSize(.small)
                    }
                }
                .onChange(of: tenths, perform: onChangeInputTime)
                .labelsHidden()
                
                Picker("Hundredths", selection: $hundredths) {
                    ForEach(0..<10) { number in
                        Text(String(number)).id(number)
                            .dynamicTypeSize(.small)
                    }
                }
                .onChange(of: hundredths, perform: onChangeInputTime)
                .labelsHidden()
                
                Picker("Thousandths", selection: $thousandths) {
                    ForEach(0..<10) { number in
                        Text(String(number)).id(number)
                            .dynamicTypeSize(.small)
                    }
                }
                .onChange(of: thousandths, perform: onChangeInputTime)
                .labelsHidden()
            }
        }
        .onAppear {
            var ms = Int((initialTime * 1000).rounded(.down))
            seconds = ms.quotientAndRemainder(dividingBy: 1000).quotient
            ms = ms - (seconds * 1000)
            tenths = ms.quotientAndRemainder(dividingBy: 100).quotient
            ms = ms - (tenths * 100)
            hundredths = ms.quotientAndRemainder(dividingBy: 10).quotient
            ms = ms - (hundredths * 10)
            thousandths = ms
            inputTime = initialTime
            inputClass = selectedClass
        }.onDisappear {
            commitInputTime()
        }
    }
    
    func updateInputTime() {
        inputTimeTemp = Double((seconds * 1000) + (tenths * 100) + (hundredths * 10) + thousandths) / 1000.0
    }
    
    func onChangeInputTime(_: Int) {
        updateInputTime()
    }
    
    func commitInputTime() {
        if let _time = inputTimeTemp {
            inputTime = _time
        }
    }
}

struct TimeInputView_Previews: PreviewProvider {
    static var previews: some View {
        TimeInputView(selectedClass: .SSC, initialTime: 123.456)
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
    }
}
