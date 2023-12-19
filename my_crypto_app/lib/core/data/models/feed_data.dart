// To parse this JSON data, do
//
//     final Feed = FeedFromJson(jsonString);

import 'dart:convert';

Feed feedFromJson(String str) => Feed.fromJson(json.decode(str));

String feedToJson(Feed data) => json.encode(data.toJson());

class Feed {
    final String eventType;
    final int e;
    final String s;
    final int aggregateId;
    final String price;
    final String q;
    final int b;
    final int a;
    final int t;
    final bool marketBuyer;
    final bool m;

    Feed({
        required this.eventType,
        required this.e,
        required this.s,
        required this.aggregateId,
        required this.price,
        required this.q,
        required this.b,
        required this.a,
        required this.t,
        required this.marketBuyer,
        required this.m,
    });

    factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        eventType: json["e"],
        e: json["E"],
        s: json["s"],
        aggregateId: json["t"],
        price: json["p"],
        q: json["q"],
        b: json["b"],
        a: json["a"],
        t: json["T"],
        marketBuyer: json["m"],
        m: json["M"],
    );

    Map<String, dynamic> toJson() => {
        "e": eventType,
        "E": e,
        "s": s,
        "t": aggregateId,
        "p": price,
        "q": q,
        "b": b,
        "a": a,
        "T": t,
        "m": marketBuyer,
        "M": m,
    };
}
