import Foundation

struct sleepTimes {
    //Struct that contains the sleep times from the past week, month, and year
    var week: [Int]
    var month: [Int]
    var year: [Int]
}

class PersonalModel {
    //Personal Model for user
    //Should be singleton
    
    var totSleepTimes: sleepTimes
    var dayInit: Date //When was this personal model created
    var consistentSleep: Bool
    var goodSleepAmnt: Bool
    var avgSleepTime: Date
    
    static var initialized: Bool = false
    
    init(){
        assert(!PersonalModel.initialized, "ERROR: Personal model is already intialized")
        self.totSleepTimes = sleepTimes(week: [], month: [], year: [])
        self.dayInit = Date.now
        self.consistentSleep = false
        self.goodSleepAmnt = false
        self.avgSleepTime = Date.now
    }
    
    public func updateAll(data: SleepData) -> Void{
        //This function is called everyday when the user wakes up
        //Takes in the most recent SleepData and uses it to update members
        
        self.updateSleepTotals(data)
    }
    
    private func getAverageSleepTime(_ totals: [Int]) -> Float{
        //Helper function to get the average sleep of an array
        // Ex: getAverageSleepTime(self.totSleepTimes.week) to get average of week
        var count = 0
        var total = 0
        for time in totals{
            count += 1
            total += time
        }
        return Float(total)/Float(count)
    }
    
    private func updateSleepTotals(_ data: SleepData) -> Void{
        if (self.totSleepTimes.week.count == 7) {
            self.totSleepTimes.week.removeFirst(1)
        }
        self.totSleepTimes.week.append(data.Time)
        
        if (self.totSleepTimes.month.count == 31){
            self.totSleepTimes.month.removeFirst(1)
        }
        self.totSleepTimes.month.append(data.Time)
        
        if (self.totSleepTimes.year.count == 365){
            self.totSleepTimes.year.removeFirst(1)
        }
        self.totSleepTimes.year.append(data.Time)
    }
}
