// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'singletons/api/driver/model/driver_model.dart';
import 'singletons/api/employee/model/employee_model.dart';
import 'singletons/api/order_3/model/order_azam_model.dart';
import 'singletons/api/order_3/model/order_falcon_model.dart';
import 'singletons/api/quoted_orders/model/quoted_order_model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 8563048727312214487),
      name: 'DriverModel',
      lastPropertyId: const IdUid(26, 2494356094576118804),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7727009537203147339),
            name: 'id',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 5487233191977415570),
            name: 'firstName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 753079045522273860),
            name: 'lastName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 1147022052183496714),
            name: 'mail',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 2683282570240122732),
            name: 'phone',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 4055661278711982137),
            name: 'license',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 8761119631022609240),
            name: 'driverId',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 2154500223935631385),
            name: 'licenseNumber',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 2219946450766712718),
            name: 'truckType',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 8507284966860324244),
            name: 'status',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(11, 6098538415874064206),
            name: 'latitude',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(12, 2078387570378363681),
            name: 'longitude',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(13, 2063036347732619674),
            name: 'location',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(14, 737317921177770567),
            name: 'appVersion',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(15, 3175951970215001042),
            name: 'lastActive',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(16, 385526233244652940),
            name: 'canGetLoadOffers',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(17, 7410592138732890327),
            name: 'carrier',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(18, 172596167086031869),
            name: 'token',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(19, 3838821978540713103),
            name: 'height',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(20, 337875405772755824),
            name: 'weight',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(21, 4703551657823098298),
            name: 'length',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(22, 5979604024263407485),
            name: 'width',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(23, 8858288398173435559),
            name: 'notes',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(24, 664707347327949444),
            name: 'company',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(25, 7885683126806610351),
            name: 'employeeName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(26, 2494356094576118804),
            name: 'employeeId',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 7238157587406243009),
      name: 'EmployeeModel',
      lastPropertyId: const IdUid(14, 5905836093002038228),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3862983615460970047),
            name: 'id',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 1708660783389964336),
            name: 'fullName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 6046721886586587951),
            name: 'status',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 8247078083204659577),
            name: 'mail',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 6582774366283037566),
            name: 'login',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 5569008955374625199),
            name: 'password',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 7257788307711802377),
            name: 'role',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 5554192191752527847),
            name: 'aMail',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 6953074296103138783),
            name: 'aPassword',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 6725929553898232180),
            name: 'fMail',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(11, 2212232565551836484),
            name: 'fPassword',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(12, 2396136078813061655),
            name: 'isRoot',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(13, 3326198744182604960),
            name: 'isAccessDriver',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(14, 5905836093002038228),
            name: 'isAccessEmployee',
            type: 1,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 6370935516019419664),
      name: 'OrderAzamModel',
      lastPropertyId: const IdUid(17, 5709259440731330235),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 664751760077526124),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3327925752294373023),
            name: 'postedBy',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 7605334862471695064),
            name: 'orderId',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 3396398253556127944),
            name: 'pickUpAt',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 6507885083745748249),
            name: 'pickUpDate',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 2750278027664825923),
            name: 'deliverTo',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 1662282360870686337),
            name: 'deliverDate',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 3135841584980068590),
            name: 'postDate',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 22953829749806073),
            name: 'expiresDate',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 8156663443500832516),
            name: 'vehicle',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(11, 1337854969494371220),
            name: 'miles',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(12, 7712637853740463283),
            name: 'pieces',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(13, 4656462624420579872),
            name: 'weight',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(14, 7253355807752925415),
            name: 'orderLink',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(15, 1392306245203148546),
            name: 'writeTime',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(16, 2580902934417028271),
            name: 'seen',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(17, 5709259440731330235),
            name: 'owner',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(4, 4282642146361892702),
      name: 'OrderFalconModel',
      lastPropertyId: const IdUid(17, 551977969975243032),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7198128908497029494),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3183998283149842374),
            name: 'postedBy',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 686153708486808191),
            name: 'orderId',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 1906799589614240361),
            name: 'pickUpAt',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 1438533295689918041),
            name: 'pickUpDate',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 1340282330909377184),
            name: 'deliverTo',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 6811859748038911250),
            name: 'deliverDate',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 2699253977485661492),
            name: 'postDate',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 6584390031936932469),
            name: 'expiresDate',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 2082738588683250499),
            name: 'vehicle',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(11, 179337263272782077),
            name: 'miles',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(12, 9093042482512021272),
            name: 'pieces',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(13, 408967481907532129),
            name: 'weight',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(14, 4654285895078638526),
            name: 'orderLink',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(15, 2628328611955426958),
            name: 'writeTime',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(16, 641312573716763147),
            name: 'seen',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(17, 551977969975243032),
            name: 'owner',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(5, 8603504529864601161),
      name: 'QuotedOrderModel',
      lastPropertyId: const IdUid(14, 1078960092477801114),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6502545152051271580),
            name: 'id',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 3161296033713218953),
            name: 'requestRef',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 6311487844808369719),
            name: 'postedBy',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 2192443125490843584),
            name: 'vehicleType',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 8478680805244668825),
            name: 'origin',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 2540279295479137389),
            name: 'destination',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 68375814488599503),
            name: 'totalMiles',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 7284420246801028838),
            name: 'weight',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 1900218152477182138),
            name: 'price',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 4800430597455447129),
            name: 'seenAt',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(11, 5990792838739449157),
            name: 'notificationCount',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(12, 6936338575331337675),
            name: 'mail',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(13, 736805714924887390),
            name: 'subject',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(14, 1078960092477801114),
            name: 'createdDate',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(5, 8603504529864601161),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    DriverModel: EntityDefinition<DriverModel>(
        model: _entities[0],
        toOneRelations: (DriverModel object) => [],
        toManyRelations: (DriverModel object) => {},
        getId: (DriverModel object) => object.id,
        setId: (DriverModel object, int id) {
          object.id = id;
        },
        objectToFB: (DriverModel object, fb.Builder fbb) {
          final firstNameOffset = object.firstName == null
              ? null
              : fbb.writeString(object.firstName!);
          final lastNameOffset = object.lastName == null
              ? null
              : fbb.writeString(object.lastName!);
          final mailOffset =
              object.mail == null ? null : fbb.writeString(object.mail!);
          final phoneOffset =
              object.phone == null ? null : fbb.writeString(object.phone!);
          final licenseOffset =
              object.license == null ? null : fbb.writeString(object.license!);
          final driverIdOffset = object.driverId == null
              ? null
              : fbb.writeString(object.driverId!);
          final licenseNumberOffset = object.licenseNumber == null
              ? null
              : fbb.writeString(object.licenseNumber!);
          final locationOffset = object.location == null
              ? null
              : fbb.writeString(object.location!);
          final appVersionOffset = object.appVersion == null
              ? null
              : fbb.writeString(object.appVersion!);
          final lastActiveOffset = object.lastActive == null
              ? null
              : fbb.writeString(object.lastActive!);
          final carrierOffset =
              object.carrier == null ? null : fbb.writeString(object.carrier!);
          final tokenOffset =
              object.token == null ? null : fbb.writeString(object.token!);
          final notesOffset =
              object.notes == null ? null : fbb.writeString(object.notes!);
          final companyOffset =
              object.company == null ? null : fbb.writeString(object.company!);
          final employeeNameOffset = object.employeeName == null
              ? null
              : fbb.writeString(object.employeeName!);
          fbb.startTable(27);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, firstNameOffset);
          fbb.addOffset(2, lastNameOffset);
          fbb.addOffset(3, mailOffset);
          fbb.addOffset(4, phoneOffset);
          fbb.addOffset(5, licenseOffset);
          fbb.addOffset(6, driverIdOffset);
          fbb.addOffset(7, licenseNumberOffset);
          fbb.addInt64(8, object.truckType);
          fbb.addInt64(9, object.status);
          fbb.addFloat64(10, object.latitude);
          fbb.addFloat64(11, object.longitude);
          fbb.addOffset(12, locationOffset);
          fbb.addOffset(13, appVersionOffset);
          fbb.addOffset(14, lastActiveOffset);
          fbb.addBool(15, object.canGetLoadOffers);
          fbb.addOffset(16, carrierOffset);
          fbb.addOffset(17, tokenOffset);
          fbb.addFloat64(18, object.height);
          fbb.addFloat64(19, object.weight);
          fbb.addFloat64(20, object.length);
          fbb.addFloat64(21, object.width);
          fbb.addOffset(22, notesOffset);
          fbb.addOffset(23, companyOffset);
          fbb.addOffset(24, employeeNameOffset);
          fbb.addInt64(25, object.employeeId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = DriverModel(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              firstName: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6),
              lastName: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 8),
              mail: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 10),
              phone: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 12),
              license: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 14),
              driverId: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 16),
              licenseNumber: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 18),
              truckType: const fb.Int64Reader().vTableGet(buffer, rootOffset, 20, 0),
              status: const fb.Int64Reader().vTableGet(buffer, rootOffset, 22, 0),
              latitude: const fb.Float64Reader().vTableGet(buffer, rootOffset, 24, 0),
              longitude: const fb.Float64Reader().vTableGet(buffer, rootOffset, 26, 0),
              location: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 28),
              appVersion: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 30),
              lastActive: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 32),
              canGetLoadOffers: const fb.BoolReader().vTableGet(buffer, rootOffset, 34, false),
              carrier: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 36),
              token: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 38),
              height: const fb.Float64Reader().vTableGet(buffer, rootOffset, 40, 0),
              weight: const fb.Float64Reader().vTableGet(buffer, rootOffset, 42, 0),
              length: const fb.Float64Reader().vTableGet(buffer, rootOffset, 44, 0),
              notes: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 48),
              width: const fb.Float64Reader().vTableGet(buffer, rootOffset, 46, 0),
              company: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 50),
              employeeName: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 52),
              employeeId: const fb.Int64Reader().vTableGet(buffer, rootOffset, 54, 0));

          return object;
        }),
    EmployeeModel: EntityDefinition<EmployeeModel>(
        model: _entities[1],
        toOneRelations: (EmployeeModel object) => [],
        toManyRelations: (EmployeeModel object) => {},
        getId: (EmployeeModel object) => object.id,
        setId: (EmployeeModel object, int id) {
          object.id = id;
        },
        objectToFB: (EmployeeModel object, fb.Builder fbb) {
          final fullNameOffset = fbb.writeString(object.fullName);
          final mailOffset = fbb.writeString(object.mail);
          final loginOffset = fbb.writeString(object.login);
          final passwordOffset = fbb.writeString(object.password);
          final aMailOffset = fbb.writeString(object.aMail);
          final aPasswordOffset = fbb.writeString(object.aPassword);
          final fMailOffset = fbb.writeString(object.fMail);
          final fPasswordOffset = fbb.writeString(object.fPassword);
          fbb.startTable(15);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, fullNameOffset);
          fbb.addBool(2, object.status);
          fbb.addOffset(3, mailOffset);
          fbb.addOffset(4, loginOffset);
          fbb.addOffset(5, passwordOffset);
          fbb.addInt64(6, object.role);
          fbb.addOffset(7, aMailOffset);
          fbb.addOffset(8, aPasswordOffset);
          fbb.addOffset(9, fMailOffset);
          fbb.addOffset(10, fPasswordOffset);
          fbb.addBool(11, object.isRoot);
          fbb.addBool(12, object.isAccessDriver);
          fbb.addBool(13, object.isAccessEmployee);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = EmployeeModel(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              fullName: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              status:
                  const fb.BoolReader().vTableGet(buffer, rootOffset, 8, false),
              mail: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, ''),
              login: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 12, ''),
              password: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 14, ''),
              role: const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0),
              aMail: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 18, ''),
              aPassword: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 20, ''),
              fMail: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 22, ''),
              fPassword: const fb.StringReader(asciiOptimization: true).vTableGet(buffer, rootOffset, 24, ''),
              isRoot: const fb.BoolReader().vTableGet(buffer, rootOffset, 26, false),
              isAccessDriver: const fb.BoolReader().vTableGet(buffer, rootOffset, 28, false),
              isAccessEmployee: const fb.BoolReader().vTableGet(buffer, rootOffset, 30, false));

          return object;
        }),
    OrderAzamModel: EntityDefinition<OrderAzamModel>(
        model: _entities[2],
        toOneRelations: (OrderAzamModel object) => [],
        toManyRelations: (OrderAzamModel object) => {},
        getId: (OrderAzamModel object) => object.id,
        setId: (OrderAzamModel object, int id) {
          object.id = id;
        },
        objectToFB: (OrderAzamModel object, fb.Builder fbb) {
          final postedByOffset = object.postedBy == null
              ? null
              : fbb.writeString(object.postedBy!);
          final orderIdOffset =
              object.orderId == null ? null : fbb.writeString(object.orderId!);
          final pickUpAtOffset = object.pickUpAt == null
              ? null
              : fbb.writeString(object.pickUpAt!);
          final pickUpDateOffset = object.pickUpDate == null
              ? null
              : fbb.writeString(object.pickUpDate!);
          final deliverToOffset = object.deliverTo == null
              ? null
              : fbb.writeString(object.deliverTo!);
          final deliverDateOffset = object.deliverDate == null
              ? null
              : fbb.writeString(object.deliverDate!);
          final postDateOffset = object.postDate == null
              ? null
              : fbb.writeString(object.postDate!);
          final expiresDateOffset = object.expiresDate == null
              ? null
              : fbb.writeString(object.expiresDate!);
          final vehicleOffset =
              object.vehicle == null ? null : fbb.writeString(object.vehicle!);
          final milesOffset =
              object.miles == null ? null : fbb.writeString(object.miles!);
          final piecesOffset =
              object.pieces == null ? null : fbb.writeString(object.pieces!);
          final weightOffset =
              object.weight == null ? null : fbb.writeString(object.weight!);
          final orderLinkOffset = object.orderLink == null
              ? null
              : fbb.writeString(object.orderLink!);
          fbb.startTable(18);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, postedByOffset);
          fbb.addOffset(2, orderIdOffset);
          fbb.addOffset(3, pickUpAtOffset);
          fbb.addOffset(4, pickUpDateOffset);
          fbb.addOffset(5, deliverToOffset);
          fbb.addOffset(6, deliverDateOffset);
          fbb.addOffset(7, postDateOffset);
          fbb.addOffset(8, expiresDateOffset);
          fbb.addOffset(9, vehicleOffset);
          fbb.addOffset(10, milesOffset);
          fbb.addOffset(11, piecesOffset);
          fbb.addOffset(12, weightOffset);
          fbb.addOffset(13, orderLinkOffset);
          fbb.addInt64(14, object.writeTime);
          fbb.addBool(15, object.seen);
          fbb.addInt64(16, object.owner);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = OrderAzamModel(
              postedBy: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6),
              orderId: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 8),
              pickUpAt: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 10),
              pickUpDate: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 12),
              deliverTo: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 14),
              deliverDate: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 16),
              postDate: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 18),
              expiresDate: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 20),
              vehicle: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 22),
              miles: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 24),
              pieces: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 26),
              weight: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 28),
              orderLink: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 30),
              seen: const fb.BoolReader().vTableGet(buffer, rootOffset, 34, false),
              writeTime: const fb.Int64Reader().vTableGet(buffer, rootOffset, 32, 0),
              owner: const fb.Int64Reader().vTableGet(buffer, rootOffset, 36, 0))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    OrderFalconModel: EntityDefinition<OrderFalconModel>(
        model: _entities[3],
        toOneRelations: (OrderFalconModel object) => [],
        toManyRelations: (OrderFalconModel object) => {},
        getId: (OrderFalconModel object) => object.id,
        setId: (OrderFalconModel object, int id) {
          object.id = id;
        },
        objectToFB: (OrderFalconModel object, fb.Builder fbb) {
          final postedByOffset = object.postedBy == null
              ? null
              : fbb.writeString(object.postedBy!);
          final orderIdOffset =
              object.orderId == null ? null : fbb.writeString(object.orderId!);
          final pickUpAtOffset = object.pickUpAt == null
              ? null
              : fbb.writeString(object.pickUpAt!);
          final pickUpDateOffset = object.pickUpDate == null
              ? null
              : fbb.writeString(object.pickUpDate!);
          final deliverToOffset = object.deliverTo == null
              ? null
              : fbb.writeString(object.deliverTo!);
          final deliverDateOffset = object.deliverDate == null
              ? null
              : fbb.writeString(object.deliverDate!);
          final postDateOffset = object.postDate == null
              ? null
              : fbb.writeString(object.postDate!);
          final expiresDateOffset = object.expiresDate == null
              ? null
              : fbb.writeString(object.expiresDate!);
          final vehicleOffset =
              object.vehicle == null ? null : fbb.writeString(object.vehicle!);
          final milesOffset =
              object.miles == null ? null : fbb.writeString(object.miles!);
          final piecesOffset =
              object.pieces == null ? null : fbb.writeString(object.pieces!);
          final weightOffset =
              object.weight == null ? null : fbb.writeString(object.weight!);
          final orderLinkOffset = object.orderLink == null
              ? null
              : fbb.writeString(object.orderLink!);
          fbb.startTable(18);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, postedByOffset);
          fbb.addOffset(2, orderIdOffset);
          fbb.addOffset(3, pickUpAtOffset);
          fbb.addOffset(4, pickUpDateOffset);
          fbb.addOffset(5, deliverToOffset);
          fbb.addOffset(6, deliverDateOffset);
          fbb.addOffset(7, postDateOffset);
          fbb.addOffset(8, expiresDateOffset);
          fbb.addOffset(9, vehicleOffset);
          fbb.addOffset(10, milesOffset);
          fbb.addOffset(11, piecesOffset);
          fbb.addOffset(12, weightOffset);
          fbb.addOffset(13, orderLinkOffset);
          fbb.addInt64(14, object.writeTime);
          fbb.addBool(15, object.seen);
          fbb.addInt64(16, object.owner);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = OrderFalconModel(
              postedBy: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6),
              orderId: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 8),
              pickUpAt: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 10),
              pickUpDate: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 12),
              deliverTo: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 14),
              deliverDate: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 16),
              postDate: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 18),
              expiresDate: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 20),
              vehicle: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 22),
              miles: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 24),
              pieces: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 26),
              weight: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 28),
              orderLink: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 30),
              seen: const fb.BoolReader().vTableGet(buffer, rootOffset, 34, false),
              writeTime: const fb.Int64Reader().vTableGet(buffer, rootOffset, 32, 0),
              owner: const fb.Int64Reader().vTableGet(buffer, rootOffset, 36, 0))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    QuotedOrderModel: EntityDefinition<QuotedOrderModel>(
        model: _entities[4],
        toOneRelations: (QuotedOrderModel object) => [],
        toManyRelations: (QuotedOrderModel object) => {},
        getId: (QuotedOrderModel object) => object.id,
        setId: (QuotedOrderModel object, int id) {
          object.id = id;
        },
        objectToFB: (QuotedOrderModel object, fb.Builder fbb) {
          final requestRefOffset = object.requestRef == null
              ? null
              : fbb.writeString(object.requestRef!);
          final postedByOffset = object.postedBy == null
              ? null
              : fbb.writeString(object.postedBy!);
          final vehicleTypeOffset = object.vehicleType == null
              ? null
              : fbb.writeString(object.vehicleType!);
          final originOffset =
              object.origin == null ? null : fbb.writeString(object.origin!);
          final destinationOffset = object.destination == null
              ? null
              : fbb.writeString(object.destination!);
          final totalMilesOffset = object.totalMiles == null
              ? null
              : fbb.writeString(object.totalMiles!);
          final weightOffset =
              object.weight == null ? null : fbb.writeString(object.weight!);
          final seenAtOffset =
              object.seenAt == null ? null : fbb.writeString(object.seenAt!);
          final mailOffset =
              object.mail == null ? null : fbb.writeString(object.mail!);
          final subjectOffset =
              object.subject == null ? null : fbb.writeString(object.subject!);
          final createdDateOffset = object.createdDate == null
              ? null
              : fbb.writeString(object.createdDate!);
          fbb.startTable(15);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, requestRefOffset);
          fbb.addOffset(2, postedByOffset);
          fbb.addOffset(3, vehicleTypeOffset);
          fbb.addOffset(4, originOffset);
          fbb.addOffset(5, destinationOffset);
          fbb.addOffset(6, totalMilesOffset);
          fbb.addOffset(7, weightOffset);
          fbb.addFloat64(8, object.price);
          fbb.addOffset(9, seenAtOffset);
          fbb.addInt64(10, object.notificationCount);
          fbb.addOffset(11, mailOffset);
          fbb.addOffset(12, subjectOffset);
          fbb.addOffset(13, createdDateOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = QuotedOrderModel(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              requestRef: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6),
              postedBy: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 8),
              vehicleType: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 10),
              origin: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 12),
              destination: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 14),
              totalMiles: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 16),
              weight: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 18),
              price: const fb.Float64Reader().vTableGet(buffer, rootOffset, 20, 0),
              seenAt: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 22),
              notificationCount: const fb.Int64Reader().vTableGet(buffer, rootOffset, 24, 0),
              mail: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 26),
              subject: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 28),
              createdDate: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 30));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [DriverModel] entity fields to define ObjectBox queries.
class DriverModel_ {
  /// see [DriverModel.id]
  static final id =
      QueryIntegerProperty<DriverModel>(_entities[0].properties[0]);

  /// see [DriverModel.firstName]
  static final firstName =
      QueryStringProperty<DriverModel>(_entities[0].properties[1]);

  /// see [DriverModel.lastName]
  static final lastName =
      QueryStringProperty<DriverModel>(_entities[0].properties[2]);

  /// see [DriverModel.mail]
  static final mail =
      QueryStringProperty<DriverModel>(_entities[0].properties[3]);

  /// see [DriverModel.phone]
  static final phone =
      QueryStringProperty<DriverModel>(_entities[0].properties[4]);

  /// see [DriverModel.license]
  static final license =
      QueryStringProperty<DriverModel>(_entities[0].properties[5]);

  /// see [DriverModel.driverId]
  static final driverId =
      QueryStringProperty<DriverModel>(_entities[0].properties[6]);

  /// see [DriverModel.licenseNumber]
  static final licenseNumber =
      QueryStringProperty<DriverModel>(_entities[0].properties[7]);

  /// see [DriverModel.truckType]
  static final truckType =
      QueryIntegerProperty<DriverModel>(_entities[0].properties[8]);

  /// see [DriverModel.status]
  static final status =
      QueryIntegerProperty<DriverModel>(_entities[0].properties[9]);

  /// see [DriverModel.latitude]
  static final latitude =
      QueryDoubleProperty<DriverModel>(_entities[0].properties[10]);

  /// see [DriverModel.longitude]
  static final longitude =
      QueryDoubleProperty<DriverModel>(_entities[0].properties[11]);

  /// see [DriverModel.location]
  static final location =
      QueryStringProperty<DriverModel>(_entities[0].properties[12]);

  /// see [DriverModel.appVersion]
  static final appVersion =
      QueryStringProperty<DriverModel>(_entities[0].properties[13]);

  /// see [DriverModel.lastActive]
  static final lastActive =
      QueryStringProperty<DriverModel>(_entities[0].properties[14]);

  /// see [DriverModel.canGetLoadOffers]
  static final canGetLoadOffers =
      QueryBooleanProperty<DriverModel>(_entities[0].properties[15]);

  /// see [DriverModel.carrier]
  static final carrier =
      QueryStringProperty<DriverModel>(_entities[0].properties[16]);

  /// see [DriverModel.token]
  static final token =
      QueryStringProperty<DriverModel>(_entities[0].properties[17]);

  /// see [DriverModel.height]
  static final height =
      QueryDoubleProperty<DriverModel>(_entities[0].properties[18]);

  /// see [DriverModel.weight]
  static final weight =
      QueryDoubleProperty<DriverModel>(_entities[0].properties[19]);

  /// see [DriverModel.length]
  static final length =
      QueryDoubleProperty<DriverModel>(_entities[0].properties[20]);

  /// see [DriverModel.width]
  static final width =
      QueryDoubleProperty<DriverModel>(_entities[0].properties[21]);

  /// see [DriverModel.notes]
  static final notes =
      QueryStringProperty<DriverModel>(_entities[0].properties[22]);

  /// see [DriverModel.company]
  static final company =
      QueryStringProperty<DriverModel>(_entities[0].properties[23]);

  /// see [DriverModel.employeeName]
  static final employeeName =
      QueryStringProperty<DriverModel>(_entities[0].properties[24]);

  /// see [DriverModel.employeeId]
  static final employeeId =
      QueryIntegerProperty<DriverModel>(_entities[0].properties[25]);
}

/// [EmployeeModel] entity fields to define ObjectBox queries.
class EmployeeModel_ {
  /// see [EmployeeModel.id]
  static final id =
      QueryIntegerProperty<EmployeeModel>(_entities[1].properties[0]);

  /// see [EmployeeModel.fullName]
  static final fullName =
      QueryStringProperty<EmployeeModel>(_entities[1].properties[1]);

  /// see [EmployeeModel.status]
  static final status =
      QueryBooleanProperty<EmployeeModel>(_entities[1].properties[2]);

  /// see [EmployeeModel.mail]
  static final mail =
      QueryStringProperty<EmployeeModel>(_entities[1].properties[3]);

  /// see [EmployeeModel.login]
  static final login =
      QueryStringProperty<EmployeeModel>(_entities[1].properties[4]);

  /// see [EmployeeModel.password]
  static final password =
      QueryStringProperty<EmployeeModel>(_entities[1].properties[5]);

  /// see [EmployeeModel.role]
  static final role =
      QueryIntegerProperty<EmployeeModel>(_entities[1].properties[6]);

  /// see [EmployeeModel.aMail]
  static final aMail =
      QueryStringProperty<EmployeeModel>(_entities[1].properties[7]);

  /// see [EmployeeModel.aPassword]
  static final aPassword =
      QueryStringProperty<EmployeeModel>(_entities[1].properties[8]);

  /// see [EmployeeModel.fMail]
  static final fMail =
      QueryStringProperty<EmployeeModel>(_entities[1].properties[9]);

  /// see [EmployeeModel.fPassword]
  static final fPassword =
      QueryStringProperty<EmployeeModel>(_entities[1].properties[10]);

  /// see [EmployeeModel.isRoot]
  static final isRoot =
      QueryBooleanProperty<EmployeeModel>(_entities[1].properties[11]);

  /// see [EmployeeModel.isAccessDriver]
  static final isAccessDriver =
      QueryBooleanProperty<EmployeeModel>(_entities[1].properties[12]);

  /// see [EmployeeModel.isAccessEmployee]
  static final isAccessEmployee =
      QueryBooleanProperty<EmployeeModel>(_entities[1].properties[13]);
}

/// [OrderAzamModel] entity fields to define ObjectBox queries.
class OrderAzamModel_ {
  /// see [OrderAzamModel.id]
  static final id =
      QueryIntegerProperty<OrderAzamModel>(_entities[2].properties[0]);

  /// see [OrderAzamModel.postedBy]
  static final postedBy =
      QueryStringProperty<OrderAzamModel>(_entities[2].properties[1]);

  /// see [OrderAzamModel.orderId]
  static final orderId =
      QueryStringProperty<OrderAzamModel>(_entities[2].properties[2]);

  /// see [OrderAzamModel.pickUpAt]
  static final pickUpAt =
      QueryStringProperty<OrderAzamModel>(_entities[2].properties[3]);

  /// see [OrderAzamModel.pickUpDate]
  static final pickUpDate =
      QueryStringProperty<OrderAzamModel>(_entities[2].properties[4]);

  /// see [OrderAzamModel.deliverTo]
  static final deliverTo =
      QueryStringProperty<OrderAzamModel>(_entities[2].properties[5]);

  /// see [OrderAzamModel.deliverDate]
  static final deliverDate =
      QueryStringProperty<OrderAzamModel>(_entities[2].properties[6]);

  /// see [OrderAzamModel.postDate]
  static final postDate =
      QueryStringProperty<OrderAzamModel>(_entities[2].properties[7]);

  /// see [OrderAzamModel.expiresDate]
  static final expiresDate =
      QueryStringProperty<OrderAzamModel>(_entities[2].properties[8]);

  /// see [OrderAzamModel.vehicle]
  static final vehicle =
      QueryStringProperty<OrderAzamModel>(_entities[2].properties[9]);

  /// see [OrderAzamModel.miles]
  static final miles =
      QueryStringProperty<OrderAzamModel>(_entities[2].properties[10]);

  /// see [OrderAzamModel.pieces]
  static final pieces =
      QueryStringProperty<OrderAzamModel>(_entities[2].properties[11]);

  /// see [OrderAzamModel.weight]
  static final weight =
      QueryStringProperty<OrderAzamModel>(_entities[2].properties[12]);

  /// see [OrderAzamModel.orderLink]
  static final orderLink =
      QueryStringProperty<OrderAzamModel>(_entities[2].properties[13]);

  /// see [OrderAzamModel.writeTime]
  static final writeTime =
      QueryIntegerProperty<OrderAzamModel>(_entities[2].properties[14]);

  /// see [OrderAzamModel.seen]
  static final seen =
      QueryBooleanProperty<OrderAzamModel>(_entities[2].properties[15]);

  /// see [OrderAzamModel.owner]
  static final owner =
      QueryIntegerProperty<OrderAzamModel>(_entities[2].properties[16]);
}

/// [OrderFalconModel] entity fields to define ObjectBox queries.
class OrderFalconModel_ {
  /// see [OrderFalconModel.id]
  static final id =
      QueryIntegerProperty<OrderFalconModel>(_entities[3].properties[0]);

  /// see [OrderFalconModel.postedBy]
  static final postedBy =
      QueryStringProperty<OrderFalconModel>(_entities[3].properties[1]);

  /// see [OrderFalconModel.orderId]
  static final orderId =
      QueryStringProperty<OrderFalconModel>(_entities[3].properties[2]);

  /// see [OrderFalconModel.pickUpAt]
  static final pickUpAt =
      QueryStringProperty<OrderFalconModel>(_entities[3].properties[3]);

  /// see [OrderFalconModel.pickUpDate]
  static final pickUpDate =
      QueryStringProperty<OrderFalconModel>(_entities[3].properties[4]);

  /// see [OrderFalconModel.deliverTo]
  static final deliverTo =
      QueryStringProperty<OrderFalconModel>(_entities[3].properties[5]);

  /// see [OrderFalconModel.deliverDate]
  static final deliverDate =
      QueryStringProperty<OrderFalconModel>(_entities[3].properties[6]);

  /// see [OrderFalconModel.postDate]
  static final postDate =
      QueryStringProperty<OrderFalconModel>(_entities[3].properties[7]);

  /// see [OrderFalconModel.expiresDate]
  static final expiresDate =
      QueryStringProperty<OrderFalconModel>(_entities[3].properties[8]);

  /// see [OrderFalconModel.vehicle]
  static final vehicle =
      QueryStringProperty<OrderFalconModel>(_entities[3].properties[9]);

  /// see [OrderFalconModel.miles]
  static final miles =
      QueryStringProperty<OrderFalconModel>(_entities[3].properties[10]);

  /// see [OrderFalconModel.pieces]
  static final pieces =
      QueryStringProperty<OrderFalconModel>(_entities[3].properties[11]);

  /// see [OrderFalconModel.weight]
  static final weight =
      QueryStringProperty<OrderFalconModel>(_entities[3].properties[12]);

  /// see [OrderFalconModel.orderLink]
  static final orderLink =
      QueryStringProperty<OrderFalconModel>(_entities[3].properties[13]);

  /// see [OrderFalconModel.writeTime]
  static final writeTime =
      QueryIntegerProperty<OrderFalconModel>(_entities[3].properties[14]);

  /// see [OrderFalconModel.seen]
  static final seen =
      QueryBooleanProperty<OrderFalconModel>(_entities[3].properties[15]);

  /// see [OrderFalconModel.owner]
  static final owner =
      QueryIntegerProperty<OrderFalconModel>(_entities[3].properties[16]);
}

/// [QuotedOrderModel] entity fields to define ObjectBox queries.
class QuotedOrderModel_ {
  /// see [QuotedOrderModel.id]
  static final id =
      QueryIntegerProperty<QuotedOrderModel>(_entities[4].properties[0]);

  /// see [QuotedOrderModel.requestRef]
  static final requestRef =
      QueryStringProperty<QuotedOrderModel>(_entities[4].properties[1]);

  /// see [QuotedOrderModel.postedBy]
  static final postedBy =
      QueryStringProperty<QuotedOrderModel>(_entities[4].properties[2]);

  /// see [QuotedOrderModel.vehicleType]
  static final vehicleType =
      QueryStringProperty<QuotedOrderModel>(_entities[4].properties[3]);

  /// see [QuotedOrderModel.origin]
  static final origin =
      QueryStringProperty<QuotedOrderModel>(_entities[4].properties[4]);

  /// see [QuotedOrderModel.destination]
  static final destination =
      QueryStringProperty<QuotedOrderModel>(_entities[4].properties[5]);

  /// see [QuotedOrderModel.totalMiles]
  static final totalMiles =
      QueryStringProperty<QuotedOrderModel>(_entities[4].properties[6]);

  /// see [QuotedOrderModel.weight]
  static final weight =
      QueryStringProperty<QuotedOrderModel>(_entities[4].properties[7]);

  /// see [QuotedOrderModel.price]
  static final price =
      QueryDoubleProperty<QuotedOrderModel>(_entities[4].properties[8]);

  /// see [QuotedOrderModel.seenAt]
  static final seenAt =
      QueryStringProperty<QuotedOrderModel>(_entities[4].properties[9]);

  /// see [QuotedOrderModel.notificationCount]
  static final notificationCount =
      QueryIntegerProperty<QuotedOrderModel>(_entities[4].properties[10]);

  /// see [QuotedOrderModel.mail]
  static final mail =
      QueryStringProperty<QuotedOrderModel>(_entities[4].properties[11]);

  /// see [QuotedOrderModel.subject]
  static final subject =
      QueryStringProperty<QuotedOrderModel>(_entities[4].properties[12]);

  /// see [QuotedOrderModel.createdDate]
  static final createdDate =
      QueryStringProperty<QuotedOrderModel>(_entities[4].properties[13]);
}
