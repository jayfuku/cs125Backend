import Foundation

struct SleepData {
    var Time: Int
    var slept: Date
    var woke: Date
}

class UserSleepDatabase{
    var dateDict: [Int: [Int: [Int:SleepData]]]
    
    public func getData(date: Date) -> Int{
        //Get data from Apple health data
        let date = dateDict[Date];
        
        // Create query based on current day
        
        //Return an array of <data> type where  data[0] is the hour and data[1] indicates if the user was in bed or not
        return nil //PLACEHOLDER
        
        
    }
    
    public func addDate()
}
