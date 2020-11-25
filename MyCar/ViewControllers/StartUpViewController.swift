//
//  StartUpViewController.swift
//  MyFavoriteCar
//
//  Created by Александр Хартанович on 25.10.20.
//
import Foundation
import UIKit
import AVKit
import CoreData
//import RealmSwift

class StartUpViewController: UIViewController {
    
    var player:AVPlayer?
    
    var playerLayer: AVPlayerLayer?
    
    let rootView: UIView = {
        let rootView = UIView()
        rootView.translatesAutoresizingMaskIntoConstraints = false
        return rootView
    }()
    let singUpButton: UIButton = {
       let signUpbutton = UIButton()
        signUpbutton.translatesAutoresizingMaskIntoConstraints = false
        signUpbutton.backgroundColor = .rgb(red: 113, green: 134, blue: 255)
        signUpbutton.layer.cornerRadius = 20
        signUpbutton.setTitle("Sign Up", for: .normal)
        signUpbutton.addTarget(self, action: #selector(signUpButtonTap(_:)), for: .touchUpInside)
        return signUpbutton
    }()
    let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
//        loginButton.setTitleColor(.rgb(red: 113, green: 134, blue: 255), for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.borderWidth = 1.3
        loginButton.layer.borderColor = UIColor.rgb(red: 113, green: 134, blue: 255).cgColor
        loginButton.layer.cornerRadius = 20
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTap(_:)), for: .touchUpInside)
        return loginButton
    }()
    
    
    
    override func loadView() {
        super.loadView()
        
        setUpVideo()
        
        view.addSubview(rootView)
        view.backgroundColor = .white
        
        rootView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        rootView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        rootView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        
        rootView.addSubview(loginButton)
        loginButton.leadingAnchor.constraint(equalTo: rootView.leadingAnchor).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: rootView.trailingAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: rootView.topAnchor, constant: 20).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        rootView.addSubview(singUpButton)
        singUpButton.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor).isActive = true
        singUpButton.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor).isActive = true
        singUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20).isActive = true
        singUpButton.bottomAnchor.constraint(equalTo: rootView.bottomAnchor, constant: -20).isActive = true
        singUpButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let realm = try! Realm()
//        print(realm.configuration.fileURL?.absoluteString)
    }
    
    @objc func signUpButtonTap(_:UIButton){
//        deleteData()
        self.navigationController?.pushViewController(SignUpViewController.init(), animated: true)
    }
    
    @objc func loginButtonTap(_: UIButton){
        self.navigationController?.pushViewController(LoginViewController.init(), animated: true)
    }

    func setUpVideo() {
        
        //get the path to the resurce in the bundle
        guard let bundlePath = Bundle.main.path(forResource: "Preview", ofType: "mp4") else {return}
        
        //create URL for it
        let url = URL(fileURLWithPath: bundlePath)
        
        // create the video player item
        let item = AVPlayerItem(url: url)
        
        //create video player
        player = AVPlayer(playerItem: item)
        
        //create the layer
        playerLayer = AVPlayerLayer(player: player)
        
        //Size and frame
        playerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5, y: 0, width: self.view.frame.size.width*4, height: self.view.frame.size.height)
        view.layer.insertSublayer(playerLayer!, at: 0)
        
        //add it to the view and oplay it
        player?.isMuted = true
        player?.playImmediately(atRate: 1)
        
    }
    
    func deleteData(){
       
       //As we know that container is set up in the AppDelegates so we need to refer that container.
       guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
       
       //We need to create a context from this container
       let context = appDelegate.persistentContainer.viewContext
       
       let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
       request.predicate = NSPredicate(format: "email = %@", "khartanovichao@gmail.com")
      
       do
       {
           let test = try context.fetch(request)
           
           let objectToDelete = test[0] as! NSManagedObject
           context.delete(objectToDelete)
           
           do{
               try context.save()
           }
           catch
           {
               print(error)
           }
           
       }
       catch
       {
           print(error)
       }
   }
}
