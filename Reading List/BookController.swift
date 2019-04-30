//
//  BookController.swift
//  Reading List
//
//  Created by Alex on 4/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class BookController{
    
    var books = [Book]()
    
    var readingListURL: URL? {
        let fileManager = FileManager.default
        let fileName = "ReadingList.plist"
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let location = documentDirectory.appendingPathComponent(fileName)
        return location
    }
    
    func saveToPersistantStore() {
        guard let url = readingListURL else { return }
        let encoder = PropertyListEncoder()
        do {
            let booksData = try encoder.encode(books)
            try booksData.write(to: url)
        } catch {
            print(error)
        }
    }
    
    func loadFromPersistantStore() {
        guard let url = readingListURL, FileManager.default.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedBooks = try decoder.decode([Book].self, from: data)
            books = decodedBooks
        } catch {
            print("Failed to load books from the file system. Error: \(error)")
        }
    }
    
    func createBook(title: String, reasonToRead: String) {
        let book = Book(title: title, reasonToRead: reasonToRead)
        
        books.append(book)
        saveToPersistantStore()
    }
    
    func deleteBook(book: Book) {
        guard let index = books.firstIndex(of: book) else { return }
        books.remove(at: index)

        saveToPersistantStore()
    }
    
    func updateHasBeenRead(for book: Book){
        
    }
    
    
}
