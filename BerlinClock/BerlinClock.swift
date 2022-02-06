//
//  BerlinClock.swift
//  BerlinClock
//
//  Created by Yessenali Zhanaidar on 13.12.2021.
//

import Foundation

struct BerlinClock {
    
    func getResult(_ hours: Int, _ minutes: Int, _ seconds: Int) -> String{
        let result = getSeconds(seconds: seconds) + "-" + getFiveHoursLamps(hours: hours) + "-" + getOneHourLamps(hours: hours) + "-" + getFiveMinutesLamps(minutes: minutes) + "-" + getOneMinuteLamps(minutes: minutes)
        
        return result
    }
    
    func rowBerlinClock(_ hours: Int, _ minutes: Int, _ seconds: Int) -> String {
        getSeconds(seconds: seconds) + getFiveHoursLamps(hours: hours) + getOneHourLamps(hours: hours) + getFiveMinutesLamps(minutes: minutes) + getOneMinuteLamps(minutes: minutes)
    }
    
    func getSeconds(seconds: Int) -> String {
        if seconds % 2 == 0 {
            return "Y"
        }else {
            return "O"
        }
    }
    
    func getFiveHoursLamps(hours: Int) -> String {
        var lamps = ["O", "O", "O", "O"]
        let hourLamps = hours / 5
        if hourLamps >= 1 {
            for i in 0...hourLamps - 1{
                lamps[i] = "R"
            }
        }
        let result = lamps.joined(separator: "")
        
        return result
        
    }
    
    func getOneHourLamps(hours: Int) -> String {
        var lamps = ["O", "O", "O", "O"]
        let hourLamps = hours % 5
        if hourLamps >= 1  {
            for i in 0...hourLamps - 1{
                lamps[i] = "R"
            }
        }
        let result = lamps.joined(separator: "")
        return result
    }
    
    func getFiveMinutesLamps(minutes: Int) -> String {
        var lamps = ["O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O", "O" ]
        let minutesLamps = minutes / 5
        if minutesLamps >= 1{
            for i in 1...minutesLamps {
                if i % 3 == 0{
                    lamps[i] = "R"
                }else {
                    lamps[i] = "Y"
                }
            }
        }
        
        lamps.remove(at: 0)
        let result = lamps.joined(separator: "")
        return result
    }
    
    func getOneMinuteLamps(minutes: Int) -> String {
        var lamps = ["O", "O", "O", "O"]
        let minuteLamps = minutes % 5
        
        if minuteLamps >= 1 {
            for i in 0...minuteLamps - 1{
                lamps[i] = "Y"
            }
        }
        
        let result = lamps.joined(separator: "")
        return result
    }
    
}

