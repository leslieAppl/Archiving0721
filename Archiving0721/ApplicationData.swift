//
//  ApplicationData.swift
//  Archiving0721
//
//  Created by leslie on 7/21/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import Foundation

//TODO: - 1 Archiving the model’s data
struct ApplicationData {
    private let manager = FileManager.default
    private var items: [String]
    private var filePath: String!
    
    init() {
        ///IMPORTANT:
        ///Notice that we have initialized the file with an empty array (items = []).
        ///This is not only allowed but also required because the methods provided by the NSKeyedArchiver and NSKeyedUnarchiver classes cannot work with empty data.
        items = []
        
        let documents = manager.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = documents.first!
        let fileURL = docURL.appendingPathComponent("items.dat")
        filePath = fileURL.path
        
        if manager.fileExists(atPath: filePath) {
            if let content = manager.contents(atPath: filePath) {
                if let result = try? NSKeyedUnarchiver.unarchivedObject(ofClass: NSArray.self, from: content) {
                    if let list = result as? [String] {
                        items = list
                    }
                }
            }
        } else {
            archiveItems()
        }
    }
    
    func getItem(atIndex: Int) -> String {
        return items[atIndex]
    }
    
    func getTotal() -> Int {
        return items.count
    }
    
    mutating func addNewItem(name: String) {
        items.append(name)
        archiveItems()
    }
    
    mutating func removeItem(index: Int) {
        items.remove(at: index)
        archiveItems()
    }
    
    mutating func updateItem(index: Int, name: String) {
        items[index] = name
        archiveItems()
    }
    
    func archiveItems() {
        if let fileData = try? NSKeyedArchiver.archivedData(withRootObject: items, requiringSecureCoding: false) {
            manager.createFile(atPath: filePath, contents: fileData, attributes: nil)
        }
    }
}

var AppData = ApplicationData()
