import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DbProvider {
  static final DbProvider _instance = DbProvider._internal();
  factory DbProvider() => _instance;
  DbProvider._internal();

  Future<Database> get tikarDb async {
    print(" in the tikardb getter");
    return await _init();
  }

  Future<void> createTables(Database db) async {
    print("In the create method");
    String schema = '''
                    create table asset (is_active bit not null, added_by bigint, estimated_value bigint not null, id bigint not null, lessor_id bigint, matricule bigint, surface_area bigint not null, address varchar(255), asset_type varchar(255), description varchar(255), name varchar(255), ville varchar(255), image tinyblob, primary key (id)) engine=InnoDB;
create table basement (is_active bit not null, added_by bigint, building_id bigint, estimated_value bigint not null, id bigint not null, lessor_id bigint, matricule bigint, number_of_halls bigint not null, surface_area bigint not null, address varchar(255), asset_type varchar(255), description varchar(255), name varchar(255), type varchar(255), ville varchar(255), image tinyblob, primary key (id)) engine=InnoDB;
create table building (is_active bit not null, added_by bigint, estimated_value bigint not null, id bigint not null, lessor_id bigint, matricule bigint, number_of_floors bigint not null, surface_area bigint not null, address varchar(255), asset_type varchar(255), description varchar(255), name varchar(255), ville varchar(255), image tinyblob, primary key (id)) engine=InnoDB;

create table lessor (is_active bit not null, tel integer, id bigint not null auto_increment, fname varchar(255), lname varchar(255), picture tinyblob, primary key (id)) engine=InnoDB;
create table rent (end_at date, is_active bit not null, start_at date, asset_id bigint, cost bigint not null, id bigint not null auto_increment, renter_id bigint, primary key (id)) engine=InnoDB;
create table renter (is_active bit not null, tel integer, id bigint not null auto_increment, fname varchar(255), lname varchar(255), picture tinyblob, primary key (id)) engine=InnoDB;
create table residence (is_active bit not null, added_by bigint, estimated_value bigint not null, id bigint not null, lessor_id bigint, matricule bigint, number_of_halls bigint not null, surface_area bigint not null, address varchar(255), asset_type varchar(255), description varchar(255), name varchar(255), ville varchar(255), image tinyblob, primary key (id)) engine=InnoDB;
create table staff (is_active bit not null, tel integer, id bigint not null auto_increment, f_name varchar(255), l_name varchar(255), password varchar(255), role varchar(255), token varchar(255), picture tinyblob, primary key (id)) engine=InnoDB;
alter table rent add constraint UK_f318ay1qw6qle013mue2yorur unique (asset_id);
alter table rent add constraint UK_sq76u6ijcqb5fmcwrtqgiw2pd unique (renter_id);
alter table asset add constraint FKtpqbv06wc825y7u3dxyq4xuu2 foreign key (added_by) references staff (id);
alter table asset add constraint FKg3uxi2myrs54iuyga0pnylye6 foreign key (lessor_id) references lessor (id);
alter table basement add constraint FK26xqy61ud1fxiugmx9x4v9t6s foreign key (building_id) references building (id);
alter table basement add constraint FK_jnov0ta52o4l9dn060oy3q193 foreign key (added_by) references staff (id);
alter table basement add constraint FK_m92srpl52kjtl8t40j30bpae6 foreign key (lessor_id) references lessor (id);
alter table building add constraint FK_6g9sy8ifxdsejl5ob3f9e1tvx foreign key (added_by) references staff (id);
alter table building add constraint FK_fv7epv4kbrd026c8f1wywymfy foreign key (lessor_id) references lessor (id);
alter table rent add constraint FKra5u7g9gxuqphmj1a8t9h9fh9 foreign key (renter_id) references renter (id);
alter table residence add constraint FK_g5fiqkwmchc7r771ng65up126 foreign key (added_by) references staff (id);
alter table residence add constraint FK_lu53jtw5wts0i9ymxi5afohuy foreign key (lessor_id) references lessor (id);
                    ''';
    try {
      await db.execute(schema);
      print("database created ...");
      ;
    } catch (e) {
      print(e);
    }
  }

  Future<String> dbPath(String dbName) async {
    print('inside  db part');
    Directory dbUrl = await getApplicationSupportDirectory();
    String path = join(dbUrl.path, dbName);
    return path;
  }

  ///Error upon the the open database method and will come back too later.
  ///[ERROR:flutter/runtime/dart_vm_initializer.cc(41)] Unhandled Exception: SqfliteFfiException(sqlite_error: 1, , SqliteException(1): while preparing statement, no such table: lessor, SQL logic error (code 1)
  ///Causing statement: INSERT OR REPLACE INTO lessor (id, fname, lname, tel, picture, active) VALUES (?, ?, ?, ?, NULL, ?)}) DatabaseException(SqliteException(1): while preparing statement, no such table: lessor, SQL logic error (code 1)
  //Causing statement: INSERT OR REPLACE INTO lessor (id, fname, lname, tel, picture, active) VALUES (?, ?, ?, ?, NULL, ?)) sql 'INSERT OR REPLACE INTO lessor (id, fname, lname, tel, picture, active) VALUES (?, ?, ?, ?, NULL, ?)' args [1, Emmauel, Fitzgerard, 690462556, 1] {details: {database: {path: /home/fitzgerard/.local/share/tikar/tikar.db, id: 1, readOnly: false, singleInstance: true}}}

  Future<Database> _init() async {
    print(" in the _init method");
    //databaseFactory = databaseFactoryFfi;
    return await openDatabase(
      await dbPath("tikar.db"),
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int? version) async {
    print('inside oncreate');
    await createTables(db);
  }
}
