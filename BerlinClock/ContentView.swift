//
//  ContentView.swift
//  BerlinClock
//
//  Created by Yessenali Zhanaidar on 13.12.2021.
//

import SwiftUI


struct ContentView: View {
    @State var date: Date = Date()
    @State var berlinClockArray: [String] = []
    
    var body: some View {
        ZStack {
            Color(red: 242/255, green: 242/255, blue: 238/255)
            VStack(alignment: .center, spacing: 20) {
                berlinClockView(date: $date)
                if berlinClockArray.count > 0 {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.white)
                        VStack {
                            Circle()
                                .fill(berlinClockArray[0] == "Y" ? Color.yellow : Color.yellow.opacity(0.2))
                            HStack {
                                ForEach((1..<5)) { i in
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(berlinClockArray[i] == "R" ? Color.red : Color.red.opacity(0.2))
                                }
                            }
                            HStack {
                                ForEach((5..<9)) { i in
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(berlinClockArray[i] == "R" ? Color.red : Color.red.opacity(0.2))
                                }
                            }
                            HStack {
                                Group {
                                    ForEach((9..<20)) { i in
                                        if berlinClockArray[i] == "R" {
                                            RoundedRectangle(cornerRadius: 4)
                                                .fill(Color.red)
                                        } else if berlinClockArray[i] == "Y" {
                                            RoundedRectangle(cornerRadius: 4)
                                                .fill(Color.yellow)
                                        } else if i % 3 == 0 && berlinClockArray[i] != "R" {
                                            RoundedRectangle(cornerRadius: 4)
                                                .fill(Color.red.opacity(0.2))
                                        } else {
                                            RoundedRectangle(cornerRadius: 4)
                                                .fill(Color.yellow.opacity(0.2))
                                        }
                                        
                                    }
                                }
                                
                            }
                            HStack {
                                ForEach((20..<24)) { i in
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(berlinClockArray[i] == "Y" ? Color.yellow : Color.yellow.opacity(0.2))
                                }
                            }
                        }
                        .padding([.leading, .trailing])
                        .padding([.top, .bottom], 32)
                    }
                    .frame(height: 312)
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.white)
                        pickerDate(date: $date)
                            .padding([.leading, .trailing])
                    }
                    .frame(height: 54)
                }
            }
            .padding([.leading, .trailing])
            
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear(perform: {
            displayDate()
        })
        
        
        
        
    }
    func displayDate() {
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block: {_ in
            let calendar = Calendar.current
            let hours = calendar.component(.hour, from: date)
            let minutes = calendar.component(.minute, from: date)
            let seconds = calendar.component(.second, from: date)
            let berlinClock = BerlinClock()
            berlinClockArray = berlinClock.rowBerlinClock(hours, minutes, seconds).map{String($0)}
        })
    }
   
}




struct berlinClockView: View {
    @Binding var date: Date
    var body: some View {
        let calendar = Calendar.current
        let hours = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        Text("Time is  \(hours):\(minutes):\(seconds)")
            .font(.system(size: 17, weight: .bold))
    }
}


struct pickerDate: View {
    @Binding var date: Date
    var body: some View {
        
        HStack {
            DatePicker("Insert time", selection: $date, displayedComponents:
                            .hourAndMinute)
                .environment(\.locale, Locale(identifier: "ru-RU"))
                .font(.system(size: 17, weight: .semibold))
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
