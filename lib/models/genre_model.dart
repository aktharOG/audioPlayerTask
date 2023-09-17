

import 'dart:convert';

GenreModel genreModelFromJson(String str) => GenreModel.fromJson(json.decode(str));

String genreModelToJson(GenreModel data) => json.encode(data.toJson());

class GenreModel {
    int genreCount;
    int genreOffset;
    List<Genre> genres;

    GenreModel({
        required this.genreCount,
        required this.genreOffset,
        required this.genres,
    });

    factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        genreCount: json["genre-count"],
        genreOffset: json["genre-offset"],
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "genre-count": genreCount,
        "genre-offset": genreOffset,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
    };
}

List<Genre> genreFromJson(String str) => List<Genre>.from(json.decode(str).map((x) => Genre.fromJson(x)));

String genreToJson(List<Genre> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Genre {
    String disambiguation;
    String id;
    String name;

    Genre({
        required this.disambiguation,
        required this.id,
        required this.name,
    });

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        disambiguation: json["disambiguation"],
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "disambiguation": disambiguation,
        "id": id,
        "name": name,
    };
}
