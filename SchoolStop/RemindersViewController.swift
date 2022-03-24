//
//  RemindersViewController.swift
//  SchoolStop
//
//  Created by Miro on 3/23/22.
//

import UIKit

import UserNotifications //get notifs features

class RemindersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var models = [AppReminder]()
    
    private func preventLargeTitleCollapsing() {
        
        let dummyView = UIView()
        
        view.addSubview(dummyView)
        
        view.sendSubviewToBack(dummyView)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        
        tableView.delegate = self
        
    }
    
    //go to add view controller
    
    @IBAction func didTapAddButton() {
        
        guard let vc = storyboard?.instantiateViewController(identifier: "add") as? AddViewController else {
            
            return
            
        }
        
        //set title + style
        
        vc.title = "New Reminder"
        
        vc.navigationItem.largeTitleDisplayMode = .never
        
        vc.completion = {title, body, date in
            
            DispatchQueue.main.async {
                self.navigationController?.popToRootViewController(animated: true)
                
                let new = AppReminder(title: title, date: date, reminderID: "id_\(title)")
                
                //add new reminder to table view
                
                self.models.append(new)
                
                self.tableView.reloadData()
                
                
                let content = UNMutableNotificationContent()
                    
                content.title = title
                
                content.sound = .default
                
                content.body = body
                
                //create one-time notif
                
                let targetDate = Date().addingTimeInterval(10) //creates 10 second buffer
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: targetDate), repeats: false)
                
                let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
                
                //schedule notif (must close app to test)
                
                UNUserNotificationCenter.current().add(request) { error in
                    
                    if error != nil {
                        
                        print("Error in scheduling notification")
                        
                    }
                    
                }
                
            }
            
        }
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    //go show reminder through notification
    
    @IBAction func didTapRemind() {
        
        //schedule notif
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { success, error in
            if success {
                
                //schedule test notif
                
                self.scheduleTest()
                
            } else if let error = error {
                
                print("Error occured: Sending notification")
                
            }
            
        })
        
    }
    
    
    //reminder helper feature
    
    func scheduleTest() {
        
        //will schedule reminder based on dates
        
        let content = UNMutableNotificationContent()
            
        content.title = title
        
        content.sound = .default
        
        content.body = body
        
        //create one-time notif
        
        let targetDate = date
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: targetDate), repeats: false)
        
        let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
        
        //schedule notif (must close app to test)
        
        UNUserNotificationCenter.current().add(request) { error in
            
            if error != nil {
                
                print("Error in scheduling notification")
                
            }
            
        }
        
        
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //set up cell with title + due date
        
        cell.textLabel?.text = models[indexPath.row].title
        
        let date = models[indexPath.row].date
        
        let formatter = DateFormatter()
            
        formatter.dateFormat = "MMM dd, YYYY at hh:mm a"
        
        cell.detailTextLabel?.text = formatter.string(for: date)
        
        return cell
        
    }
    
    
    //app reminder struct that holds all the data for a single reminder
    struct AppReminder {
        
        let title: String
        
        let date: Date
        
        let reminderID: String
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
