//
//  FirstViewController.swift
//  musicPlayerApp
//
//  Created by MacStudent on 2019-11-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit


var songs:[String] = []
class FirstViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gettingSongsName()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
       {
           let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
           cell.textLabel?.text = songs[indexPath.row]
           return cell
       }
       
     override func didReceiveMemoryWarning()
       {
           super.didReceiveMemoryWarning()
       }
    
    func gettingSongsName(){
        
         let folderURL = URL(fileURLWithPath:Bundle.main.resourcePath!)
               
               do
               {
                   let songPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
                   
                   //loop through the found urls
                   for song in songPath
                   {
                       var mySong = song.absoluteString
                       
                       if mySong.contains(".mp3")
                       {
                           let findString = mySong.components(separatedBy: "/")
                           mySong = findString[findString.count-1]
                           mySong = mySong.replacingOccurrences(of: "%20", with: " ")
                           mySong = mySong.replacingOccurrences(of: ".mp3", with: "")
                           songs.append(mySong)
                       }
                       
                   }
                   
                   myTableView.reloadData()
               }
               catch
               {
                   print ("ERROR")
               }
        
       
    }

}

