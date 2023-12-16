//
//  HotelModel.swift
//  BookingHotelTestApp
//
//  Created by Муса Шогенов on 16.12.2023.
//

import Foundation

struct Hotel: Decodable {
    let id: Int
    let name: String
    let address: String
    let minimalPrice: Int
    let priceForIt: String
    let rating: Int
    let ratingName: String
    let imageUrls: [String]
    let aboutTheHotel: AboutTheHotel

    private enum CodingKeys: String, CodingKey {
        case id, name, address, minimalPrice, priceForIt, rating, ratingName, imageUrls, aboutTheHotel
    }
}

struct AboutTheHotel: Decodable {
    let description: String
    let peculiarities: [String]
}



struct MockHotel {
    
    static let hotel = Hotel(id: 1, name: "Лучший пятизвездочный отель в Хургаде, Египет", address: "Madinat Makadi, Safaga Road, Makadi Bay, Египет", minimalPrice: 134268, priceForIt: "За тур с перелётом", rating: 5, ratingName: "Превосходно", imageUrls: ["https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg", "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg", "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg"], aboutTheHotel: AboutTheHotel(description: "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!", peculiarities: ["Бесплатный Wifi на всей территории отеля", "1 км до пляжа", "Бесплатный фитнес-клуб", "20 км до аэропорта"]))
    
    
    
}
