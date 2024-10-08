// To parse this JSON data, do
//
//     final songResponse = songResponseFromJson(jsonString);

import 'dart:convert';

import 'package:tembang_bali/model/lyric.dart';

SongResponse songResponseFromJson(String str) => SongResponse.fromJson(json.decode(str));

String songResponseToJson(SongResponse data) => json.encode(data.toJson());

class SongResponse {
    int? page;
    int? perPage;
    int? totalPages;
    int? totalItems;
    List<Song>? items;

    SongResponse({
        this.page,
        this.perPage,
        this.totalPages,
        this.totalItems,
        this.items,
    });

    factory SongResponse.fromJson(Map<String, dynamic> json) => SongResponse(
        page: json["page"],
        perPage: json["perPage"],
        totalPages: json["totalPages"],
        totalItems: json["totalItems"],
        items: json["items"] == null ? [] : List<Song>.from(json["items"]!.map((x) => Song.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "perPage": perPage,
        "totalPages": totalPages,
        "totalItems": totalItems,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    };
}

class Song {
    String? id;
    String? collectionId;
    String? collectionName;
    DateTime? created;
    DateTime? updated;
    String? songType;
    String? songSubtype;
    String? title;
    String? history;
    String? musicData;
    String? musicAdditonal;
    List<Lyric>? lyrics;
    String? lyricString;
    String? image;

    Song({
        this.id,
        this.collectionId,
        this.collectionName,
        this.created,
        this.updated,
        this.songType,
        this.songSubtype,
        this.title,
        this.history,
        this.musicData,
        this.musicAdditonal,
        this.lyrics,
        this.lyricString,
        this.image,
    });

    factory Song.fromJson(Map<String, dynamic> json) => Song(
        id: json["id"],
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        updated: json["updated"] == null ? null : DateTime.parse(json["updated"]),
        songType: json["song_type"],
        songSubtype: json["song_subtype"],
        title: json["title"],
        history: json["history"],
        musicData: json["music_data"],
        musicAdditonal: json["music_additonal"],
        lyrics: json["lyrics"] == null ? [] : List<Lyric>.from(json["lyrics"]!.map((x) => Lyric.fromJson(x))),
        lyricString: json["lyric_string"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "collectionId": collectionId,
        "collectionName": collectionName,
        "created": created?.toIso8601String(),
        "updated": updated?.toIso8601String(),
        "song_type": songType,
        "song_subtype": songSubtype,
        "title": title,
        "history": history,
        "music_data": musicData,
        "music_additonal": musicAdditonal,
        "lyrics": lyrics == null ? [] : List<dynamic>.from(lyrics!.map((x) => x.toJson())),
        "lyric_string": lyricString,
        "image": image,
    };
}