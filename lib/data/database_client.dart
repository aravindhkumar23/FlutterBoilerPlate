import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseClient {
  final Sqflite sqflite;
  final String databaseName = 'sample.db';
  final String usersTableName = 'userTable';

  // open the database
  Database databaseInstance;

  DatabaseClient({this.sqflite});

  //gives directory for storing db
  Future<String> getDatabasePath() async {
    return join(await getDatabasesPath(), databaseName);
  }

  Future<void> create() async {
    try {
      await new Directory(dirname(await getDatabasePath()))
          .create(recursive: true);
    } catch (e) {
      print('Database path creation error $e');
    }
  }

  Future<void> openDatabaseInstance() async {
    databaseInstance ??= await openDatabase(await getDatabasePath(),
        singleInstance: false, readOnly: false);
  }

  Future<void> closeDatabaseInstance() async {
    // Close the database
    if (databaseInstance != null) {
      await databaseInstance.close();
    }
    databaseInstance = null;
  }

  // open database will be called on login success and then create table and close connection
  Future<void> open() async {
    // open the database
    databaseInstance = await openDatabase(await getDatabasePath(),
        version: 1,
        singleInstance: false, onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE $usersTableName (id INTEGER, creationDate TEXT, status INTEGER, inspectionType TEXT, inspectionData BLOB)');
    });
    // on create success close instance
    await closeDatabaseInstance();
  }

  void deleteLocalDatabase() async {
    await deleteDatabase(await getDatabasePath());
  }

//  //get attachments for reportId
//  Future<List<InspectionAttachment>> getAttachmentsById({int reportId}) async {
//    final String rawQuery =
//        'SELECT * FROM $attachmentTableName WHERE reportId=$reportId';
//    final List<Map<String, dynamic>> attachmentsList =
//        await databaseInstance.rawQuery(rawQuery);
//    final List<InspectionAttachment> localInspectionAttachments =
//        attachmentsList
//            .map((dynamic data) => serializers.deserializeWith(
//                InspectionAttachment.serializer, data))
//            .toList();
//    return localInspectionAttachments;
//  }

}
