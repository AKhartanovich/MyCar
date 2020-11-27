//
//  Utilities.swift
//  MyFavoriteCar
//
//  Created by Александр Хартанович on 25.10.20.
//

import UIKit
import CoreData

///Функция чтобы цвет было проще заносить
extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
      }
}

///Создает кастомную персонализацию текстфилда
func createCustomTextField(_ textField: UITextField) {
    textField.layer.borderWidth = 1.3
    textField.layer.borderColor = UIColor.rgb(red: 113, green: 134, blue: 255).cgColor
    textField.indent(size: 20)
    textField.layer.cornerRadius = 20
}

///Создает кастомную персонализацию вьюхи
func createCustomView(_ label: UIView) {
    label.layer.borderWidth = 1.3
    label.layer.borderColor = UIColor.rgb(red: 113, green: 134, blue: 255).cgColor
    label.layer.cornerRadius = 10
}

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


extension UITextField{
    
    ///Задает для текстфилда цвет шрифта и текст внутри его
    func setPlaceHolderWith(color: UIColor, text: String){
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor : color])
    }
    
    ///Отступ в текстфилдах
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}

extension UITabBar {
    
    ///В таббарвьюконтроллере делает прозрачным таббар
    static func setTransparentTabbar () {
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().clipsToBounds = true
    }
}

///Функция удаления из базы по условию
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
    catch {
        print(error)
    }
   } catch {
    print(error)
   }
}

///Создание пользователя в Core Data
func createData(name: String, surname: String, UUID: String, email: String) {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
    //context
    let context = appDelegate.persistentContainer.viewContext
    //Entity
    guard let entity = NSEntityDescription.entity(forEntityName: "Users", in: context) else {return}
    let user = Users(entity: entity, insertInto: context)
    user.email = email
    user.name = name
    user.surname = surname
    user.uuid = UUID
    do {
        try context.save()
    } catch let error as NSError {
        print("\(error), \(error.userInfo)")
    }
}

/// Получение информации о пользователях в CoreData
func retrieveDate(){
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
    let context = appDelegate.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
    do {
        let result = try context.fetch(request)
        for data in result as! [NSManagedObject] {
            print(data.value(forKey: "name") as! String)
            print(data.value(forKey: "surname") as! String)
            print(data.value(forKey: "email") as! String)
            print(data.value(forKey: "uuid") as! String)
        }
    } catch let error as NSError {
        print(error)
    }
}

///Запрос в кордату с условием, вывод заправок по данному пользователю
func getFuelingWithEmployee(username: String){
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
    //context
    let context = appDelegate.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Refueling")
    request.predicate = NSPredicate(format: "ANY users.uuid = %@", Person.instance.UUID)
    do {
        if let result = try context.fetch(request) as? [Refueling] {
            for data in result as [NSManagedObject] {
                print(data.value(forKey: "literes") as! Double)
            }
            print(result.count)
        }
    } catch { }
}
