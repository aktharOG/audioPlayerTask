// To parse this JSON data, do
//
//     final artistModel = artistModelFromJson(jsonString);

import 'dart:convert';

ArtistModel artistModelFromJson(String str) => ArtistModel.fromJson(json.decode(str));

String artistModelToJson(ArtistModel data) => json.encode(data.toJson());

class ArtistModel {
    DateTime created;
    int count;
    int offset;
    List<ArtistM> artists;

    ArtistModel({
        required this.created,
        required this.count,
        required this.offset,
        required this.artists,
    });

    factory ArtistModel.fromJson(Map<String, dynamic> json) => ArtistModel(
        created: DateTime.parse(json["created"]),
        count: json["count"],
        offset: json["offset"],
        artists: List<ArtistM>.from(json["artists"].map((x) => ArtistM.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "created": created.toIso8601String(),
        "count": count,
        "offset": offset,
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
    };
}
List<ArtistM> artistFromJson(String str) => List<ArtistM>.from(json.decode(str).map((x) => ArtistM.fromJson(x)));

String artistToJson(List<ArtistM> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class ArtistM {
    String id;
    ArtistType? type;
    String? typeId;
    int score;
    String name;
    String sortName;
    String? disambiguation;
    ArtistLifeSpan lifeSpan;
    String? genderId;
    String? gender;
    String? country;
    Area? area;
    Area? beginArea;
    List<String>? isnis;
    List<Alias>? aliases;
    Area? endArea;
    List<Tag>? tags;

    ArtistM({
        required this.id,
        this.type,
        this.typeId,
        required this.score,
        required this.name,
        required this.sortName,
        this.disambiguation,
        required this.lifeSpan,
        this.genderId,
        this.gender,
        this.country,
        this.area,
        this.beginArea,
        this.isnis,
        this.aliases,
        this.endArea,
        this.tags,
    });

    factory ArtistM.fromJson(Map<String, dynamic> json) => ArtistM(
        id: json["id"]??"",
      //  type: artistTypeValues.map[json["type"]]??,
        typeId: json["type-id"],
        score: json["score"],
        name: json["name"],
        sortName: json["sort-name"],
        disambiguation: json["disambiguation"],
        lifeSpan: ArtistLifeSpan.fromJson(json["life-span"]),
        genderId: json["gender-id"],
       gender: json["gender"],
        country: json["country"],
      //  area: json["area"] == null ? null : Area.fromJson(json["area"]),
       // beginArea: json["begin-area"] == null ? null : Area.fromJson(json["begin-area"]),
      //  isnis: json["isnis"] == null ? [] : List<String>.from(json["isnis"]!.map((x) => x)),
        aliases: json["aliases"] == null ? [] : List<Alias>.from(json["aliases"]!.map((x) => Alias.fromJson(x))),
      //  endArea: json["end-area"] == null ? null : Area.fromJson(json["end-area"]),
      //  tags: json["tags"] == null ? [] : List<Tag>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": artistTypeValues.reverse[type],
        "type-id": typeId,
        "score": score,
        "name": name,
        "sort-name": sortName,
        "disambiguation": disambiguation,
        "life-span": lifeSpan.toJson(),
        "gender-id": genderId,
        "gender": gender,
        "country": country,
        "area": area?.toJson(),
        "begin-area": beginArea?.toJson(),
        "isnis": isnis == null ? [] : List<dynamic>.from(isnis!.map((x) => x)),
        "aliases": aliases == null ? [] : List<dynamic>.from(aliases!.map((x) => x.toJson())),
        "end-area": endArea?.toJson(),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x.toJson())),
    };
}

class Alias {
    String sortName;
    String? typeId;
    String name;
    dynamic locale;
    String? type;
    dynamic primary;
    dynamic beginDate;
    dynamic endDate;

    Alias({
        required this.sortName,
        this.typeId,
        required this.name,
        required this.locale,
        required this.type,
        required this.primary,
        required this.beginDate,
        required this.endDate,
    });

    factory Alias.fromJson(Map<String, dynamic> json) => Alias(
        sortName: json["sort-name"],
        typeId: json["type-id"],
        name: json["name"],
        locale: json["locale"],
        type: json["type"],
        primary: json["primary"],
        beginDate: json["begin-date"],
        endDate: json["end-date"],
    );

    Map<String, dynamic> toJson() => {
        "sort-name": sortName,
        "type-id": typeId,
        "name": name,
        "locale": locale,
        "type": type,
        "primary": primary,
        "begin-date": beginDate,
        "end-date": endDate,
    };
}

class Area {
    String id;
    AreaType type;
    String typeId;
    String name;
    String sortName;
    AreaLifeSpan lifeSpan;

    Area({
        required this.id,
        required this.type,
        required this.typeId,
        required this.name,
        required this.sortName,
        required this.lifeSpan,
    });

    factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        type: areaTypeValues.map[json["type"]]!,
        typeId: json["type-id"],
        name: json["name"],
        sortName: json["sort-name"],
        lifeSpan: AreaLifeSpan.fromJson(json["life-span"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": areaTypeValues.reverse[type],
        "type-id": typeId,
        "name": name,
        "sort-name": sortName,
        "life-span": lifeSpan.toJson(),
    };
}

class AreaLifeSpan {
    dynamic ended;

    AreaLifeSpan({
        required this.ended,
    });

    factory AreaLifeSpan.fromJson(Map<String, dynamic> json) => AreaLifeSpan(
        ended: json["ended"],
    );

    Map<String, dynamic> toJson() => {
        "ended": ended,
    };
}

enum AreaType {
    CITY,
    COUNTRY,
    MUNICIPALITY,
    SUBDIVISION
}

final areaTypeValues = EnumValues({
    "City": AreaType.CITY,
    "Country": AreaType.COUNTRY,
    "Municipality": AreaType.MUNICIPALITY,
    "Subdivision": AreaType.SUBDIVISION
});

enum Gender {
    MALE
}

final genderValues = EnumValues({
    "male": Gender.MALE
});

class ArtistLifeSpan {
    bool? ended;
    String? begin;
    String? end;

    ArtistLifeSpan({
        required this.ended,
        this.begin,
        this.end,
    });

    factory ArtistLifeSpan.fromJson(Map<String, dynamic> json) => ArtistLifeSpan(
        ended: json["ended"],
        begin: json["begin"],
        end: json["end"],
    );

    Map<String, dynamic> toJson() => {
        "ended": ended,
        "begin": begin,
        "end": end,
    };
}

class Tag {
    int count;
    String name;

    Tag({
        required this.count,
        required this.name,
    });

    factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        count: json["count"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "name": name,
    };
}

enum ArtistType {
    PERSON
}

final artistTypeValues = EnumValues({
    "Person": ArtistType.PERSON
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
