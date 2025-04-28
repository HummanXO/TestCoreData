//
//  UserEntity+CoreDataProperties.swift
//  TestCoreData
//
//  Created by Aleksandr on 28.04.2025.
//
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?

}

extension UserEntity : Identifiable {

}
