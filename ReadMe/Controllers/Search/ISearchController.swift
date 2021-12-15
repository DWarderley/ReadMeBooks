//
//  ISearchController.swift
//  ReadMe
//
//  Created by David Warderley on 15/12/2021.
//

import Foundation

protocol ISearchController {
    func search(query:String, onComplete:@escaping ([IBook]) -> Void)
}
