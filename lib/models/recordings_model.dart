// To parse this JSON data, do
//
//     final recordingModel = recordingModelFromJson(jsonString);

import 'dart:convert';

RecordingModel recordingModelFromJson(String str) =>
    RecordingModel.fromJson(json.decode(str));

String recordingModelToJson(RecordingModel data) => json.encode(data.toJson());

class RecordingModel {
  DateTime created;
  int count;
  int offset;
  List<Recording> recordings;

  RecordingModel({
    required this.created,
    required this.count,
    required this.offset,
    required this.recordings,
  });

  factory RecordingModel.fromJson(Map<String, dynamic> json) => RecordingModel(
        created: DateTime.parse(json["created"]),
        count: json["count"],
        offset: json["offset"],
        recordings: List<Recording>.from(
            json["recordings"].map((x) => Recording.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "created": created.toIso8601String(),
        "count": count,
        "offset": offset,
        "recordings": List<dynamic>.from(recordings.map((x) => x.toJson())),
      };
}

List<Recording> recordingsFromJson(String str) =>
    List<Recording>.from(json.decode(str).map((x) => Recording.fromJson(x)));

String recordingsToJson(List<Recording> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

    

class Recording {
  String id;
  int score;
  String title;
  int? length;
  dynamic video;
  List<ArtistCredit> artistCredit;
  String firstReleaseDate;
  List<Release> releases;
  // List<String>? isrcs;
  // List<Tag>? tags;
  // String? disambiguation;

  Recording({
    required this.id,
    required this.score,
    required this.title,
    this.length,
    required this.video,
    required this.artistCredit,
    required this.firstReleaseDate,
   required this.releases,
    // this.isrcs,
    // this.tags,
    // this.disambiguation,
  });

  factory Recording.fromJson(Map<String, dynamic> json) => Recording(
        id: json["id"] ?? "",
        score: json["score"] ?? 0,
        title: json["title"] ?? '',
        length: json["length"] ?? 0,
        video: json["video"] ?? '',
        artistCredit: artistCreditFromJson(jsonEncode(json["artist-credit"])),
        firstReleaseDate: json["first-release-date"] ?? '',
       releases: releaseFromJson(jsonEncode(json["releases"])),
        // isrcs: json["isrcs"] == null ? [] : List<String>.from(json["isrcs"]!.map((x) => x)),
        // tags: json["tags"] == null ? [] : List<Tag>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
        // disambiguation: json["disambiguation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "score": score,
        "title": title,
        "length": length,
        "video": video,
        "artist-credit": artistCreditToJson(artistCredit),
        "first-release-date": firstReleaseDate,
       "releases": releaseToJson(releases),
        // "isrcs": isrcs == null ? [] : List<dynamic>.from(isrcs!.map((x) => x)),
        // "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x.toJson())),
        // "disambiguation": disambiguation,
      };
}
//! artist credit


List<ArtistCredit> artistCreditFromJson(String str) =>
    List<ArtistCredit>.from(json.decode(str).map((x) => ArtistCredit.fromJson(x)));

String artistCreditToJson(List<ArtistCredit> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
   

class ArtistCredit {
  String name;
  Artist artist;
  Joinphrase? joinphrase;

  ArtistCredit({
    required this.name,
    required this.artist,
    this.joinphrase,
  });

  factory ArtistCredit.fromJson(Map<String, dynamic> json) => ArtistCredit(
        name: json["name"]??'',
        artist: singleArtistFromJson(jsonEncode(json["artist"])),
        joinphrase: joinphraseValues.map[json["joinphrase"]]??Joinphrase.GELESEN_VON,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "artist": singleArtistToJson(artist),
        "joinphrase": joinphraseValues.reverse[joinphrase],
      };
}



    Artist singleArtistFromJson(String str) =>
    Artist.fromJson(json.decode(str));

String singleArtistToJson(Artist data) => json.encode(data.toJson());

class Artist {
  String id;
  String name;
  String sortName;
  // List<Alias>? aliases;
  // String? disambiguation;
  // List<Country>? iso31661Codes;

  Artist({
    required this.id,
    required this.name,
    required this.sortName,
    // this.aliases,
    // this.disambiguation,
    // this.iso31661Codes,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        id: json["id"],
        name: json["name"],
        sortName: json["sort-name"],
        // aliases: json["aliases"] == null
        //     ? []
        //     : List<Alias>.from(json["aliases"]!.map((x) => Alias.fromJson(x))),
        // disambiguation: json["disambiguation"],
        // iso31661Codes: json["iso-3166-1-codes"] == null
        //     ? []
        //     : List<Country>.from(
        //         json["iso-3166-1-codes"]!.map((x) => countryValues.map[x]!)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sort-name": sortName,
        // "aliases": aliases == null
        //     ? []
        //     : List<dynamic>.from(aliases!.map((x) => x.toJson())),
        // "disambiguation": disambiguation,
        // "iso-3166-1-codes": iso31661Codes == null
        //     ? []
        //     : List<dynamic>.from(
        //         iso31661Codes!.map((x) => countryValues.reverse[x])),
      };
}

class Alias {
  String sortName;
  String? typeId;
  String name;
  Locale? locale;
  Type? type;
  bool? primary;
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
        locale: localeValues.map[json["locale"]]!,
        type: typeValues.map[json["type"]]!,
        primary: json["primary"],
        beginDate: json["begin-date"],
        endDate: json["end-date"],
      );

  Map<String, dynamic> toJson() => {
        "sort-name": sortName,
        "type-id": typeId,
        "name": name,
        "locale": localeValues.reverse[locale],
        "type": typeValues.reverse[type],
        "primary": primary,
        "begin-date": beginDate,
        "end-date": endDate,
      };
}

enum Locale {
  CY,
  DA,
  DE,
  EN,
  ES,
  ET,
  FI,
  FR,
  JA,
  LV,
  NB,
  NL,
  PL,
  RU,
  VI,
  ZH_HANT
}

final localeValues = EnumValues({
  "cy": Locale.CY,
  "da": Locale.DA,
  "de": Locale.DE,
  "en": Locale.EN,
  "es": Locale.ES,
  "et": Locale.ET,
  "fi": Locale.FI,
  "fr": Locale.FR,
  "ja": Locale.JA,
  "lv": Locale.LV,
  "nb": Locale.NB,
  "nl": Locale.NL,
  "pl": Locale.PL,
  "ru": Locale.RU,
  "vi": Locale.VI,
  "zh_Hant": Locale.ZH_HANT
});

enum Type { ARTIST_NAME, LEGAL_NAME, SEARCH_HINT }

final typeValues = EnumValues({
  "Artist name": Type.ARTIST_NAME,
  "Legal name": Type.LEGAL_NAME,
  "Search hint": Type.SEARCH_HINT
});

enum Country { CH, DE, FR, US, XW }

final countryValues = EnumValues({
  "CH": Country.CH,
  "DE": Country.DE,
  "FR": Country.FR,
  "US": Country.US,
  "XW": Country.XW
});

enum Joinphrase { GELESEN_VON }

final joinphraseValues = EnumValues({" gelesen von ": Joinphrase.GELESEN_VON});

List<Release> releaseFromJson(String str) =>
    List<Release>.from(json.decode(str).map((x) => Release.fromJson(x)));

String releaseToJson(List<Release> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Release {
  String id;
  String? statusId;
  int count;
  String title;
  Status? status;
 // ReleaseGroup releaseGroup;
  String? date;
  Country? country;
 // List<ReleaseEvent>? releaseEvents;
  int trackCount;
  //List<Media> media;
  //List<ArtistCredit>? artistCredit;
 // String? disambiguation;

  Release({
    required this.id,
    this.statusId,
    required this.count,
    required this.title,
    this.status,
   // required this.releaseGroup,
    this.date,
    this.country,
  //  this.releaseEvents,
    required this.trackCount,
   // required this.media,
   // this.artistCredit,
//this.disambiguation,
  });

  factory Release.fromJson(Map<String, dynamic> json) => Release(
        id: json["id"],
        statusId: json["status-id"],
        count: json["count"],
        title: json["title"],
       // status: statusValues.map[json["status"]]??,
      //  releaseGroup: ReleaseGroup.fromJson(json["release-group"]),
        date: json["date"],
      //  country: countryValues.map[json["country"]]??'',
        // releaseEvents: json["release-events"] == null
        //     ? []
        //     : List<ReleaseEvent>.from(
        //         json["release-events"]!.map((x) => ReleaseEvent.fromJson(x))),
        trackCount: json["track-count"]??'',
        // media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
        // artistCredit: json["artist-credit"] == null
        //     ? []
        //     : List<ArtistCredit>.from(
        //         json["artist-credit"]!.map((x) => ArtistCredit.fromJson(x))),
        // disambiguation: json["disambiguation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status-id": statusId,
        "count": count,
        "title": title,
        "status": statusValues.reverse[status],
       // "release-group": releaseGroup.toJson(),
        "date": date,
        "country": countryValues.reverse[country],
        // "release-events": releaseEvents == null
        //     ? []
        //     : List<dynamic>.from(releaseEvents!.map((x) => x.toJson())),
        "track-count": trackCount,
        // "media": List<dynamic>.from(media.map((x) => x.toJson())),
        // "artist-credit": artistCredit == null
        //     ? []
        //     : List<dynamic>.from(artistCredit!.map((x) => x.toJson())),
        // "disambiguation": disambiguation,
      };
}

class Media {
  int position;
  String? format;
  List<Track> track;
  int trackCount;
  int trackOffset;

  Media({
    required this.position,
    this.format,
    required this.track,
    required this.trackCount,
    required this.trackOffset,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        position: json["position"],
        format: json["format"],
        track: List<Track>.from(json["track"].map((x) => Track.fromJson(x))),
        trackCount: json["track-count"],
        trackOffset: json["track-offset"],
      );

  Map<String, dynamic> toJson() => {
        "position": position,
        "format": format,
        "track": List<dynamic>.from(track.map((x) => x.toJson())),
        "track-count": trackCount,
        "track-offset": trackOffset,
      };
}

class Track {
  String id;
  String number;
  String title;
  int? length;

  Track({
    required this.id,
    required this.number,
    required this.title,
    this.length,
  });

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        id: json["id"],
        number: json["number"],
        title: json["title"],
        length: json["length"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number": number,
        "title": title,
        "length": length,
      };
}

class ReleaseEvent {
  String date;
  Artist area;

  ReleaseEvent({
    required this.date,
    required this.area,
  });

  factory ReleaseEvent.fromJson(Map<String, dynamic> json) => ReleaseEvent(
        date: json["date"],
        area: Artist.fromJson(json["area"]),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "area": area.toJson(),
      };
}

class ReleaseGroup {
  String id;
  String typeId;
  String primaryTypeId;
  String title;
  PrimaryType primaryType;
  List<SecondaryType>? secondaryTypes;
  List<String>? secondaryTypeIds;

  ReleaseGroup({
    required this.id,
    required this.typeId,
    required this.primaryTypeId,
    required this.title,
    required this.primaryType,
    this.secondaryTypes,
    this.secondaryTypeIds,
  });

  factory ReleaseGroup.fromJson(Map<String, dynamic> json) => ReleaseGroup(
        id: json["id"],
        typeId: json["type-id"],
        primaryTypeId: json["primary-type-id"],
        title: json["title"],
        primaryType: primaryTypeValues.map[json["primary-type"]]!,
        secondaryTypes: json["secondary-types"] == null
            ? []
            : List<SecondaryType>.from(json["secondary-types"]!
                .map((x) => secondaryTypeValues.map[x]!)),
        secondaryTypeIds: json["secondary-type-ids"] == null
            ? []
            : List<String>.from(json["secondary-type-ids"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type-id": typeId,
        "primary-type-id": primaryTypeId,
        "title": title,
        "primary-type": primaryTypeValues.reverse[primaryType],
        "secondary-types": secondaryTypes == null
            ? []
            : List<dynamic>.from(
                secondaryTypes!.map((x) => secondaryTypeValues.reverse[x])),
        "secondary-type-ids": secondaryTypeIds == null
            ? []
            : List<dynamic>.from(secondaryTypeIds!.map((x) => x)),
      };
}

enum PrimaryType { ALBUM, OTHER }

final primaryTypeValues =
    EnumValues({"Album": PrimaryType.ALBUM, "Other": PrimaryType.OTHER});

enum SecondaryType { AUDIOBOOK, COMPILATION, LIVE, SOUNDTRACK }

final secondaryTypeValues = EnumValues({
  "Audiobook": SecondaryType.AUDIOBOOK,
  "Compilation": SecondaryType.COMPILATION,
  "Live": SecondaryType.LIVE,
  "Soundtrack": SecondaryType.SOUNDTRACK
});

enum Status { BOOTLEG, OFFICIAL }

final statusValues =
    EnumValues({"Bootleg": Status.BOOTLEG, "Official": Status.OFFICIAL});

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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
