//
//  Patient.swift
//  Doctor App
//
//  Created by David on 2/19/19.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class Patient: NSObject {
    
    init(first: String, last: String, status: Status, image: URL? = nil) {
        self.first = first
        self.last = last
        self.status = status
        self.image = image
    }
    
    init(patientData: [String: String]) throws {
        guard let first = patientData["first"] else {
            NSLog("no first name")
            throw NSError(domain: "pretend I defined a domain here", code: 0, userInfo: nil)
        }
        guard let last = patientData["last"] else {
            NSLog("no last name")
            throw NSError(domain: "pretend I defined a domain here", code: 0, userInfo: nil)
        }
        guard let status = patientData["status"] else {
            NSLog("no status name")
            throw NSError(domain: "pretend I defined a domain here", code: 0, userInfo: nil)
        }
        
        self.first = first
        self.last = last
        self.status = Status(rawValue: status)!
        
        if let imageURLString = patientData["image"] {
            self.image = URL(string: imageURLString)
        }
    }
    
    enum Status: String {
        case archived = "archived"
        case inTreatment = "in_treatment"
        case brandNew = "brand_new"
    }

    var first: String
    var last: String
    var status: Status
    var image: URL?
    
    class var allPatientsData: [[String: String]] {
        return [
            ["first":"Ada","last":"Wolf","status":"archived", "image": "https://images.ctfassets.net/3dypzlolv97m/6sPCK8DuA8Wm2iE2m8K0wM/d7e429f4acde68bc995c6cf3958a8e38/connecting_copy.png"],
            ["fist":"Ada","last":"Andrade","status":"brand_new","image":"https://images.ctfassets.net/3dypzlolv97m/6sPCK8DuA8Wm2iE2m8K0wM/d7e429f4acde68bc995c6cf3958a8e38/connecting_copy.png"],
            ["first":"Adela","last":"Valdez","status":"archived","image":"https://images.ctfassets.net/3dypzlolv97m/6sPCK8DuA8Wm2iE2m8K0wM/d7e429f4acde68bc995c6cf3958a8e38/connecting_copy.png"],
            ["first":"Adela","last":"Best","status":"archived","image":"https://images.ctfassets.net/3dypzlolv97m/6sPCK8DuA8Wm2iE2m8K0wM/d7e429f4acde68bc995c6cf3958a8e38/connecting_copy.png"],
            ["first":"Alden","last":"Singh","status":"brand_new","image":"https://images.ctfassets.net/3dypzlolv97m/6sPCK8DuA8Wm2iE2m8K0wM/d7e429f4acde68bc995c6cf3958a8e38/connecting_copy.png"],
            ["first":"Aldo","last":"Snow","status":"in_treatment","image":"https://images.ctfassets.net/3dypzlolv97m/6sPCK8DuA8Wm2iE2m8K0wM/d7e429f4acde68bc995c6cf3958a8e38/connecting_copy.png"],
            ["first":"Alexandria","last":"Mcdonald","status":"archived","image":"https://images.ctfassets.net/3dypzlolv97m/6sPCK8DuA8Wm2iE2m8K0wM/d7e429f4acde68bc995c6cf3958a8e38/connecting_copy.png"],
            ["first":"Alfredo","last":"Landry","status":"brand_new","image":"https://images.ctfassets.net/3dypzlolv97m/6sPCK8DuA8Wm2iE2m8K0wM/d7e429f4acde68bc995c6cf3958a8e38/connecting_copy.png"],
            ["first":"Alisha","last":"Barr","status":"in_treatment","image":"https://images.ctfassets.net/3dypzlolv97m/6sPCK8DuA8Wm2iE2m8K0wM/d7e429f4acde68bc995c6cf3958a8e38/connecting_copy.png"],
            ["first":"Allie","last":"Lambert","status":"archived","image":"https://images.ctfassets.net/3dypzlolv97m/6sPCK8DuA8Wm2iE2m8K0wM/d7e429f4acde68bc995c6cf3958a8e38/connecting_copy.png"],
            ["first":"Alta","last":"Melendez","status":"in_treatment","image":"https://images.ctfassets.net/3dypzlolv97m/6sPCK8DuA8Wm2iE2m8K0wM/d7e429f4acde68bc995c6cf3958a8e38/connecting_copy"],
            ["first":"Alvin","last":"Fletcher","status":"archived","image":"https://images.ctfassets.net/3dypzlolv97m/6sPCK8DuA8Wm2iE2m8K0wM/d7e429f4acde68bc995c6cf3958a8e38/connecting_copy.png"],
            ["first":"Ana","last":"Chavez","status":"archived","image":"https://images.ctfassets.net/3dypzlolv97m/6sPCK8DuA8Wm2iE2m8K0wM/d7e429f4acde68bc995c6cf3958a8e38/connecting_copy.png"],
            ["first":"Angelique","last":"Vargas","status":"brand_new","image":"https://images.ctfassets.net/3dypzlolv97m/6sPCK8DuA8Wm2iE2m8K0wM/d7e429f4acde68bc995c6cf3958a8e38/connecting_copy.png"],
            ["first":"Araceli","last":"Lawrence","status":"in_treatment","image":"https://images.ctfassets.net/3dypzlolv97m/6sPCK8DuA8Wm2iE2m8K0wM/d7e429f4acde68bc995c6cf3958a8e38/connecting_copy.png"],
            ["first":"Ashlee","last":"Garza","status":"archived","image":"https://images.ctfassets.net/3dypzlolv97m/6sPCK8DuA8Wm2iE2m8K0wM/d7e429f4acde68bc995c6cf3958a8e38/connecting_copy.png"],
            ["first":"Austin","last":"Mahoney","status":"brand_new","image":"https://images.ctfassets.net/3dypzlolv97m/6sPCK8DuA8Wm2iE2m8K0wM/d7e429f4acde68bc995c6cf3958a8e38/connecting_copy.png"],
            ["first":"Avis","last":"Anderson","status":"archived","image":"https://images.ctfassets.net/3dypzlolv97m/6sPCK8DuA8Wm2iE2m8K0wM/d7e429f4acde68bc995c6cf3958a8e38/connecting_copy.png"],
            ["first":"Bertha","last":"Jefferson","status":"archived","image":"https://images.ctfassets.net/3dypzlolv97m/6sPCK8DuA8Wm2iE2m8K0wM/d7e429f4acde68bc995c6cf3958a8e38/connecting_copy.png"],
            ["first":"Beryl","last":"Duncan","status":"brand_new","image":"https://images.ctfassets.net/3dypzlolv97m/6sPCK8DuA8Wm2iE2m8K0wM/d7e429f4acde68bc995c6cf3958a8e38/connecting_copy.png"],
            ["first":"Bethany","last":"Lane","status":"archived","image":"https://images.ctfassets.net/3dypzlolv97m/6sPCK8DuA8Wm2iE2m8K0wM/d7e429f4acde68bc995c6cf3958a8e38/connecting_copy.png"],
            ["first":"Bethany","last":"Petersen","status":"archived","image":"https://images.ctfassets.net/3dypzlolv97m/1EjZ45kSBuQ8EOaw6OGOqS/60ccf403eb726e5ee84036684718a5fb/yoga-for-stress-carousel.jpg?w=270&h=270&fit=thumb"],
            ["first":"Bettie","last":"Anthony","status":"archived","image":"https://images.ctfassets.net/3dypzlolv97m/6sPCK8DuA8Wm2iE2m8K0wM/d7e429f4acde68bc995c6cf3958a8e38/connecting_copy.png"],
            ["first":"Bettye","last":"Hart","status":"in_treatment","image":"https://images.ctfassets.net/3dypzlolv97m/6sPCK8DuA8Wm2iE2m8K0wM/d7e429f4acde68bc995c6cf3958a8e38/connecting_copy.png"],
            ["first":"Bonnie","last":"Figueroa","status":"archived","image":"https://images.ctfassets.net/3dypzlolv97m/1EjZ45kSBuQ8EOaw6OGOqS/60ccf403eb726e5ee84036684718a5fb/yoga-for-stress-carousel.jpg?w=270&h=270&fit=thumb"],
            ["first":"Bradly","last":"Lester","status":"brand_new"],
            ["first":"Brain","last":"Atkins","status":"archived"],
            ["first":"Brant","last":"Weiss","status":"in_treatment"],
            ["first":"Brenton","last":"Wyatt","status":"in_treatment"],
            ["first":"Brooke","last":"Waller","status":"in_treatment"],
            ["first":"Bruce","last":"Roy","status":"brand_new"],
            ["first":"Calvin","last":"Vaughan","status":"archived"],
            ["first":"Candy","last":"Duran","status":"archived"],
            ["first":"Carmen","last":"Joyce","status":"in_treatment"],
            ["first":"Carol","last":"Dixon","status":"in_treatment"],
            ["first":"Cecile","last":"Hoover","status":"in_treatment"],
            ["first":"Chauncey","last":"Levine","status":"brand_new"],
            ["first":"Chris","last":"Porter","status":"brand_new"],
            ["first":"Chris","last":"Ho","status":"archived"],
            ["first":"Clara","last":"Hartman","status":"in_treatment"],
            ["first":"Clara","last":"Cantrell","status":"brand_new"],
            ["first":"Clare","last":"Herring","status":"brand_new"],
            ["first":"Claudine","last":"Saunders","status":"in_treatment"],
            ["first":"Clayton","last":"Keith","status":"archived"],
            ["first":"Clement","last":"Pruitt","status":"archived"],
            ["first":"Cleo","last":"Richard","status":"archived"],
            ["first":"Cleo","last":"Stout","status":"brand_new"],
            ["first":"Clifford","last":"Cain","status":"brand_new"],
            ["first":"Cody","last":"Medina","status":"in_treatment"],
            ["first":"Conrad","last":"Trujillo","status":"archived"],
            ["first":"Cornell","last":"Zavala","status":"in_treatment"],
            ["first":"Cruz","last":"Hobbs","status":"in_treatment"],
            ["first":"Damien","last":"Church","status":"brand_new"],
            ["first":"Dan","last":"Anthony","status":"brand_new"],
            ["first":"Deanna","last":"Holland","status":"in_treatment"],
            ["first":"Delores","last":"Quinn","status":"archived"],
            ["first":"Denny","last":"Carroll","status":"in_treatment"],
            ["first":"Derek","last":"Mendoza","status":"brand_new"],
            ["first":"Diana","last":"Vaughan","status":"archived"],
            ["first":"Dirk","last":"Smith","status":"brand_new"],
            ["first":"Donna","last":"Huerta","status":"in_treatment"],
            ["first":"Doug","last":"Rodgers","status":"in_treatment"],
            ["first":"Ebony","last":"Hurley","status":"brand_new"],
            ["first":"Ed","last":"Lopez","status":"brand_new"],
            ["first":"Edward","last":"Pollard","status":"in_treatment"],
            ["first":"Eli","last":"Hayes","status":"in_treatment"],
            ["first":"Elliott","last":"Davis","status":"archived"],
            ["first":"Emerson","last":"Curtis","status":"brand_new"],
            ["first":"Enrique","status":"in_treatment"],
            ["first":"Erica","last":"David","status":"archived"],
            ["first":"Ernie","last":"Ashley","status":"in_treatment"],
            ["first":"Errol","last":"Hanson","status":"brand_new"],
            ["first":"Essie","last":"Montes","status":"in_treatment"],
            ["first":"Francis","last":"Villegas","status":"archived"],
            ["first":"Frank","last":"Bryant","status":"archived"],
            ["first":"Gabriel","last":"Scott","status":"archived"],
            ["first":"Garland","last":"Gardner","status":"in_treatment"],
            ["first":"Geraldine","last":"Vasquez","status":"in_treatment"],
            ["first":"Gladys","last":"Bradford","status":"brand_new"],
            ["first":"Glen","last":"Glass","status":"brand_new"],
            ["first":"Glenda","last":"Sexton","status":"in_treatment"],
            ["first":"Gonzalo","last":"Webster","status":"brand_new"],
            ["first":"Grace","last":"Watts","status":"brand_new"],
            ["first":"Grant","last":"Wilcox","status":"brand_new"],
            ["first":"Gretchen","last":"Cain","status":"brand_new"],
            ["first":"Guadalupe","last":"Mcknight","status":"in_treatment"],
            ["first":"Gustavo","last":"Mercado","status":"brand_new"],
            ["first":"Haley","last":"Mercado","status":"in_treatment"],
            ["first":"Hans","last":"Mckay","status":"archived"],
            ["first":"Harriett","last":"Deleon","status":"brand_new"],
            ["first":"Heidi","last":"Mclean","status":"in_treatment"],
            ["first":"Herminia","last":"May","status":"in_treatment"],
            ["first":"Hershel","last":"Randall","status":"in_treatment"],
            ["first":"Horace","last":"Buck","status":"in_treatment"],
            ["first":"Imelda","last":"Pham","status":"brand_new"],
            ["first":"Ivy","last":"Arias","status":"brand_new"],
            ["first":"Jaime","last":"Mcpherson","status":"brand_new"],
            ["first":"Jake","last":"Wilkerson","status":"brand_new"],
            ["first":"James","last":"Burnett","status":"in_treatment"],
            ["first":"Jamie","last":"Reed","status":"brand_new"],
            ["first":"Jean","last":"Hammond","status":"archived"],
            ["first":"Jeffery","last":"Davies","status":"in_treatment"],
            ["first":"Jennie","last":"Huerta","status":"brand_new"],
            ["first":"Jennie","last":"Mccarthy","status":"brand_new"],
            ["first":"Jeremiah","last":"Luna","status":"brand_new"],
            ["first":"Jerome","last":"Dorsey","status":"archived"],
            ["first":"Jimmie","last":"Frazier","status":"archived"],
            ["first":"Jimmy","last":"Velez","status":"brand_new"],
            ["first":"Jolene","last":"Acevedo","status":"brand_new"],
            ["first":"Jonas","last":"Mann","status":"brand_new"],
            ["first":"Josefa","last":"Norman","status":"brand_new"],
            ["first":"Judith","last":"Mcknight","status":"archived"],
            ["first":"Juliette","last":"Wilkins","status":"archived"],
            ["first":"Katharine","last":"Wheeler","status":"brand_new"],
            ["first":"Katherine","last":"Chambers","status":"in_treatment"],
            ["first":"Kaye","last":"Russo","status":"brand_new"],
            ["first":"Kermit","last":"Singleton","status":"brand_new"],
            ["first":"Kim","last":"Brock","status":"in_treatment"],
            ["first":"Kim","last":"Livingston","status":"brand_new"],
            ["first":"Lakeisha","last":"Stafford","status":"in_treatment"],
            ["first":"Lakisha","last":"Conner","status":"archived"],
            ["first":"Lanny","last":"Pineda","status":"archived"],
            ["first":"Laurence","last":"Hernandez","status":"archived"],
            ["first":"Lavonne","last":"Wolf","status":"in_treatment"],
            ["first":"Leopoldo","last":"Morales","status":"archived"],
            ["first":"Lesley","last":"Mcknight","status":"brand_new"],
            ["first":"Lester","last":"Simpson","status":"in_treatment"],
            ["first":"Liza","last":"Hogan","status":"brand_new"],
            ["first":"Lolita","last":"Soto","status":"archived"],
            ["first":"Lolita","last":"Jacobs","status":"in_treatment"],
            ["first":"Lorie","last":"Villa","status":"brand_new"],
            ["first":"Lorna","last":"Stein","status":"archived"],
            ["first":"Lucinda","last":"Mullen","status":"archived"],
            ["first":"Luther","last":"Murphy","status":"archived"],
            ["first":"Lynn","last":"Pearson","status":"brand_new"],
            ["first":"Malcolm","last":"Bautista","status":"archived"],
            ["first":"Manuel","last":"Green","status":"in_treatment"],
            ["first":"Marguerite","last":"Velez","status":"archived"],
            ["first":"Marian","last":"Francis","status":"brand_new"],
            ["first":"Marianne","last":"Fuller","status":"brand_new"],
            ["first":"Marisa","last":"Wise","status":"archived"],
            ["first":"Maritza","last":"Francis","status":"archived"],
            ["first":"Marva","last":"Payne","status":"archived"],
            ["first":"Mason","last":"Figueroa","status":"brand_new"],
            ["first":"Matilda","last":"Davila","status":"archived"],
            ["first":"Matthew","last":"Peck","status":"archived"],
            ["first":"Michael","last":"Stokes","status":"archived"],
            ["first":"Michele","last":"Dominguez","status":"in_treatment"],
            ["first":"Miles","last":"Lucero","status":"brand_new"],
            ["first":"Millard","last":"Dickerson","status":"in_treatment"],
            ["first":"Mohamed","last":"Andersen","status":"archived"],
            ["first":"Morgan","last":"Mcintyre","status":"brand_new"],
            ["first":"Myrna","last":"Carter","status":"in_treatment"],
            ["first":"Natasha","last":"Benjamin","status":"archived"],
            ["first":"Neal","last":"Dudley","status":"archived"],
            ["first":"Newton","last":"Parks","status":"archived"],
            ["first":"Nichole","last":"Hester","status":"in_treatment"],
            ["first":"Nina","last":"Oconnell","status":"archived"],
            ["first":"Numbers","last":"Pollard","status":"archived"],
            ["first":"Pat","last":"Hensley","status":"in_treatment"],
            ["first":"Paulette","last":"Charles","status":"archived"],
            ["first":"Pierre","last":"Berger","status":"in_treatment"],
            ["first":"Rachael","last":"Murray","status":"brand_new"],
            ["first":"Randell","last":"Mooney","status":"archived"],
            ["first":"Randy","last":"Alvarado","status":"archived"],
            ["first":"Randy","last":"Hansen","status":"archived"],
            ["first":"Raul","last":"Cole","status":"brand_new"],
            ["first":"Reid","last":"Hernandez","status":"in_treatment"],
            ["first":"Reyes","last":"Lam","status":"archived"],
            ["first":"Robbie","last":"Mccann","status":"in_treatment"],
            ["first":"Robin","last":"Odom","status":"brand_new"],
            ["first":"Rodrick","last":"Matthews","status":"in_treatment"],
            ["first":"Rupert","last":"Friedman","status":"in_treatment"],
            ["first":"Sabrina","last":"Meza","status":"brand_new"],
            ["first":"Sadie","last":"Finley","status":"brand_new"],
            ["first":"Sanford","last":"Garner","status":"archived"],
            ["first":"Santos","last":"Sampson","status":"in_treatment"],
            ["first":"Scottie","last":"Potts","status":"archived"],
            ["first":"Sean","last":"Ayers","status":"in_treatment"],
            ["first":"Shaun","last":"Shepherd","status":"brand_new"],
            ["first":"Shaun","last":"Powers","status":"brand_new"],
            ["first":"Shawna","last":"Heath","status":"in_treatment"],
            ["first":"Shelton","last":"Walsh","status":"in_treatment"],
            ["first":"Sheri","last":"Crane","status":"archived"],
            ["first":"Solomon","last":"Decker","status":"archived"],
            ["first":"Stacie","last":"Sanders","status":"brand_new"],
            ["first":"Sterling","last":"Christensen","status":"archived"],
            ["first":"Stevie","last":"Randolph","status":"archived"],
            ["first":"Susana","last":"Benjamin","status":"archived"],
            ["first":"Tameka","last":"Salas","status":"in_treatment"],
            ["first":"Theresa","last":"Cox","status":"archived"],
            ["first":"Tia","last":"Cochran","status":"archived"],
            ["first":"Ty","last":"Harper","status":"in_treatment"],
            ["first":"Tyree","last":"Klein","status":"in_treatment"],
            ["first":"Tyrone","last":"Boyer","status":"archived"],
            ["first":"Vito","last":"Skinner","status":"brand_new"],
            ["first":"Whitney","last":"Wong","status":"in_treatment"],
            ["first":"Wilford","last":"Steele","status":"brand_new"],
            ["first":"Willie","last":"Howard","status":"archived"],
            ["first":"Wilson","last":"Stuart","state":"in_treatment"]
        ]
    }
}
