import Foundation

class UserSleepDataRetriever {
    private var currentDay: Date;
    private var HKStore: Int //Needs to be changed of HKHealthstore type once in actual app
    public typealias data = (Date, Bool);
    
    init(HKStore:Int){
        self.currentDay = Date.now;
        self.HKStore = HKStore;
    }
    
    private func checkPermissions() -> Bool{
        //Use HKStore item to check if we have permission to retrie data yet
        // return self.HKStore.authorizationStatus(?????)
        return true
    }
    
    private func createQuery() {
        //return type: HKSampleQuery
        //Create query to get sleep data of most recent sleep
    }
    
    public func retrieveData() -> Array<data>{
        //Get data from Apple health data
        assert(self.checkPermissions(), "App does not have permission to access health data")
        
        // Create query based on current day
        
        //Return an array of <data> type where  data[0] is the hour and data[1] indicates if the user was in bed or not
        return [(self.currentDay, true)] //PLACEHOLDER
        
        
    }
    
    
}
