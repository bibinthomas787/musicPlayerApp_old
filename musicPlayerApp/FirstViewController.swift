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
       
    
    func gettingSongsName(){
        
        
        let folderURL = URL(fileURLWithPath: Bundle.main.resourcePath!)
        
        
        do {
            
            let songpath =  try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
           
           
           
            for song in songpath  {
                
                var mysong = song.absoluteString
               
               
               
                
                if mysong.contains(".mp3")
                
                {
                
                    let findString  = mysong.components(separatedBy: "/")
                    
                    print(findString[findString.count-1])
                   
                    
                    mysong = mysong.replacingOccurrences(of: "%20", with: " ")
                   
                    mysong = mysong.replacingOccurrences(of: ".mp3", with: " ")
                    
                    songs.append(mysong)
                    
                }
            }
            print(songs)
            myTableView.reloadData()
            
        }
        
        catch
        {
            
            
            
        }
    }

}

