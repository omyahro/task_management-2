import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'const.dart';

class MongoDatabase {
  static connect() async {
    //connect to db
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);
    //open collection
    var collection = db.collection(COLLECTION_NAME);
    await collection.insertMany([
      {
        "category": "Love",
        "affirmation": "I am love",
      },
      {
        "category": "Career",
        "affirmation": "I gind ways to enjoy my career.",
      }
    ]);
    print(await collection.find().toList());

    //update info
    //await collection.updateMany(where.eq("username", "mp"), modify.set("name", "Kyla P"));

    //print(await collection.find().toList());

  }
}
