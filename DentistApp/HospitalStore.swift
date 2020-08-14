//
//  HospitalStore.swift
//  DentistApp
//
//  Created by user174340 on 8/13/20.
//  Copyright © 2020 Chaitanya Uttarwar. All rights reserved.
//

import Foundation

enum HospitalsResult {
    case success([Hospital])
    case failure(Error)
}

enum HospitalError : Error {
    case hospitalCreationError
}

enum JSONError : Error {
    case invalidJSONData
}

class HospitalStore {
    var result : HospitalsResult!
    
    let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func getAllHospitals(completion: @escaping(HospitalsResult)->Void) {
        let components = URLComponents(string: "http://localhost:3000/root")
        let url = components!.url
        let request = URLRequest(url: url!)
        let task = session.dataTask(with: request) {
            (data, response, error)->Void in
            if let jsonData = data {
                self.result = self.hospitalsCall(fromJSON: jsonData)
            }else if let requestError = error {
                print("Error in fetching data  \(requestError)")
            }else {
                print("Unexpected error with the request")
            }
            OperationQueue.main.addOperation {
                completion(self.result)
            }
        }
        task.resume()
    }
    
    func hospitalsCall(fromJSON data: Data)->HospitalsResult {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            guard
                let jsonDictionary = jsonObject as? [AnyHashable:Any],
                let hospitalsArray = jsonDictionary["hospitals"] as? [[String:Any]]
                else {
                    return .failure(JSONError.invalidJSONData)
            }
            var finalHospitals = [Hospital]()
            for hospitalJSON in hospitalsArray {
                if let hospital = hospital(fromJSON: hospitalJSON) {
                    finalHospitals.append(hospital)
                }
            }
            if finalHospitals.isEmpty && !hospitalsArray.isEmpty {
                return .failure(JSONError.invalidJSONData)
            }
            return .success(finalHospitals)
        } catch let error {
            return .failure(error)
        }
    }
    
    func hospital(fromJSON json: [String: Any])->Hospital? {
        guard
        let name = json["name"] as! String?,
        let location = json["location"] as! String?
            else {
                return nil
        }
        return Hospital(name: name, location: location, description: name)
    }
}
