class Company {
  final int id;
  final String name;
  final String address;
  final String email;

  Company({
    required this.id,
    required this.name,
    required this.address,
    required this.email,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      email: json['email'],
    );
  }
}

class Bus {
  final int id;
  final String placa;
  final int maximumSeats;
  final Company company;

  Bus({
    required this.id,
    required this.placa,
    required this.maximumSeats,
    required this.company,
  });

  factory Bus.fromJson(Map<String, dynamic> json) {
    return Bus(
      id: json['id'],
      placa: json['placa'],
      maximumSeats: json['maximumSeats'],
      company: Company.fromJson(json['companyIdd']),
    );
  }
}

class TouristSite {
  final int id;
  final String name;
  final String location;
  final String map;

  TouristSite({
    required this.id,
    required this.name,
    required this.location,
    required this.map,
  });

  factory TouristSite.fromJson(Map<String, dynamic> json) {
    return TouristSite(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      map: json['map'],
    );
  }
}

class TravelPackage {
  final int id;
  final bool status;
  final double price;
  final String description;
  final DateTime departureDate;
  final DateTime returnDate;
  final String placeOfDeparture;
  final int availabilityNumber;
  final Bus bus;
  final TouristSite touristSite;

  TravelPackage({
    required this.id,
    required this.status,
    required this.price,
    required this.description,
    required this.departureDate,
    required this.returnDate,
    required this.placeOfDeparture,
    required this.availabilityNumber,
    required this.bus,
    required this.touristSite,
  });

  factory TravelPackage.fromJson(Map<String, dynamic> json) {
    final departureDateList = json['departureDate'] as List;
    final returnDateList = json['returnDate'] as List;

    return TravelPackage(
      id: json['id'],
      status: json['status'],
      price: json['precie'],
      description: json['description'],
      departureDate: DateTime(
        departureDateList[0], // year
        departureDateList[1], // month
        departureDateList[2], // day
        departureDateList[3], // hour
        departureDateList[4], // minute
      ),
      returnDate: DateTime(
        returnDateList[0], // year
        returnDateList[1], // month
        returnDateList[2], // day
        returnDateList[3], // hour
        returnDateList[4], // minute
      ),
      placeOfDeparture: json['placeOfDeparture'],
      availabilityNumber: json['availabilityNumber'],
      bus: Bus.fromJson(json['busId']),
      touristSite: TouristSite.fromJson(json['touristSiteId']),
    );
  }
}
