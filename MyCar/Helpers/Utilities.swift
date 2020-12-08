//
//  Utilities.swift
//  MyFavoriteCar
//
//  Created by Александр Хартанович on 25.10.20.
//

import UIKit
import CoreData
import AVKit

///Проверка на валидность емейла
func validEmailId(inputText: String)-> Bool {
    let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    let result = emailTest.evaluate(with: inputText)
    return result
}

///Проверка на валидность пароля
func validPassword(inputPassword: String) -> Bool {
    let passwordRegEx = "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{8,}$"
    let passwordTest = NSPredicate(format: "SELF MATCHES %@ ", passwordRegEx)
    let result = passwordTest.evaluate(with: inputPassword)
    return result
}



///Add video on custom view
func setUpVideo(view: UIView, resourse: String, type: String) {
    var player:AVPlayer?
    var playerLayer: AVPlayerLayer?
    //get the path to the resurce in the bundle
    guard let bundlePath = Bundle.main.path(forResource: resourse, ofType: type) else {return}
    //create URL for it
    let url = URL(fileURLWithPath: bundlePath)
    // create the video player item
    let item = AVPlayerItem(url: url)
    //create video player
    player = AVPlayer(playerItem: item)
    //create the layer
    playerLayer = AVPlayerLayer(player: player)
    //Size and frame
    playerLayer?.frame = CGRect(x: -view.frame.size.width*1.5, y: 0, width: view.frame.size.width*4, height: view.frame.size.height)
    view.layer.insertSublayer(playerLayer!, at: 0)
    //add it to the view and oplay it
    player?.isMuted = true
    player?.playImmediately(atRate: 1)
}



///Запрос в кордату с условием, вывод заправок по данному пользователю
//func getFuelingWithEmployee(username: String){
//    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
//    //context
//    let context = appDelegate.persistentContainer.viewContext
//    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Refueling")
//    request.predicate = NSPredicate(format: "ANY users.uuid = %@", Person.instance.UUID)
//    do {
//        if let result = try context.fetch(request) as? [Refueling] {
//            for data in result as [NSManagedObject] {
//                print(data.value(forKey: "literes") as! Double)
//            }
//            print(result.count)
//        }
//    } catch { }
//}







