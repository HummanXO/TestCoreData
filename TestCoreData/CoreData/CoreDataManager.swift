import Foundation
import CoreData

class CoreDataManager {
    
    static var shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    init() {
        persistentContainer = NSPersistentContainer(name: "TestCoreDataModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func saveUser() {
        let user = UserEntity(context: viewContext)
        user.id = UUID().uuidString
        user.name = "Test"
        saveContext()
    }
    
    func fetchLastUser() {
        let fetchRequest: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        do {
            let result = try viewContext.fetch(fetchRequest)
            print(result.last?.id as Any)
        } catch {
            print("Error fetching users: \(error)")
        }
    }
    
    func fetchAllUsers() {
        let fetchRequest: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: false)]
        do {
            let result = try viewContext.fetch(fetchRequest)
            for i in result {
                print(i.id as Any)
            }
        } catch {
            print("Error fetching users: \(error)")
        }
    }
    
    func deleteLastUser() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = UserEntity.fetchRequest()
        let result = try? viewContext.fetch(fetchRequest)
        if result?.count ?? 0 > 0 {
            viewContext.delete(result?.last as! NSManagedObject)
            print("Secssfully deleted last user")
        } else {
            print("No users to delete.")
        }
    }
    
}
