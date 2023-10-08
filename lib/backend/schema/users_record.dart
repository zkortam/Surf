import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "realName" field.
  String? _realName;
  String get realName => _realName ?? '';
  bool hasRealName() => _realName != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "pfpBlurHash" field.
  String? _pfpBlurHash;
  String get pfpBlurHash => _pfpBlurHash ?? '';
  bool hasPfpBlurHash() => _pfpBlurHash != null;

  // "admin" field.
  bool? _admin;
  bool get admin => _admin ?? false;
  bool hasAdmin() => _admin != null;

  // "pincode" field.
  String? _pincode;
  String get pincode => _pincode ?? '';
  bool hasPincode() => _pincode != null;

  // "pushNotifStatus" field.
  bool? _pushNotifStatus;
  bool get pushNotifStatus => _pushNotifStatus ?? false;
  bool hasPushNotifStatus() => _pushNotifStatus != null;

  // "emailNotifStatus" field.
  bool? _emailNotifStatus;
  bool get emailNotifStatus => _emailNotifStatus ?? false;
  bool hasEmailNotifStatus() => _emailNotifStatus != null;

  // "threads" field.
  List<ThreadStruct>? _threads;
  List<ThreadStruct> get threads => _threads ?? const [];
  bool hasThreads() => _threads != null;

  // "Posts" field.
  List<PostStruct>? _posts;
  List<PostStruct> get posts => _posts ?? const [];
  bool hasPosts() => _posts != null;

  // "banner" field.
  String? _banner;
  String get banner => _banner ?? '';
  bool hasBanner() => _banner != null;

  // "saved" field.
  List<String>? _saved;
  List<String> get saved => _saved ?? const [];
  bool hasSaved() => _saved != null;

  // "followers" field.
  List<String>? _followers;
  List<String> get followers => _followers ?? const [];
  bool hasFollowers() => _followers != null;

  // "following" field.
  List<String>? _following;
  List<String> get following => _following ?? const [];
  bool hasFollowing() => _following != null;

  // "notifications" field.
  List<NotificationStruct>? _notifications;
  List<NotificationStruct> get notifications => _notifications ?? const [];
  bool hasNotifications() => _notifications != null;

  // "isBiometric" field.
  bool? _isBiometric;
  bool get isBiometric => _isBiometric ?? false;
  bool hasIsBiometric() => _isBiometric != null;

  // "blocked" field.
  List<String>? _blocked;
  List<String> get blocked => _blocked ?? const [];
  bool hasBlocked() => _blocked != null;

  // "isStealth" field.
  bool? _isStealth;
  bool get isStealth => _isStealth ?? false;
  bool hasIsStealth() => _isStealth != null;

  // "complete" field.
  bool? _complete;
  bool get complete => _complete ?? false;
  bool hasComplete() => _complete != null;

  // "isCompressed" field.
  bool? _isCompressed;
  bool get isCompressed => _isCompressed ?? false;
  bool hasIsCompressed() => _isCompressed != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _realName = snapshotData['realName'] as String?;
    _bio = snapshotData['bio'] as String?;
    _pfpBlurHash = snapshotData['pfpBlurHash'] as String?;
    _admin = snapshotData['admin'] as bool?;
    _pincode = snapshotData['pincode'] as String?;
    _pushNotifStatus = snapshotData['pushNotifStatus'] as bool?;
    _emailNotifStatus = snapshotData['emailNotifStatus'] as bool?;
    _threads = getStructList(
      snapshotData['threads'],
      ThreadStruct.fromMap,
    );
    _posts = getStructList(
      snapshotData['Posts'],
      PostStruct.fromMap,
    );
    _banner = snapshotData['banner'] as String?;
    _saved = getDataList(snapshotData['saved']);
    _followers = getDataList(snapshotData['followers']);
    _following = getDataList(snapshotData['following']);
    _notifications = getStructList(
      snapshotData['notifications'],
      NotificationStruct.fromMap,
    );
    _isBiometric = snapshotData['isBiometric'] as bool?;
    _blocked = getDataList(snapshotData['blocked']);
    _isStealth = snapshotData['isStealth'] as bool?;
    _complete = snapshotData['complete'] as bool?;
    _isCompressed = snapshotData['isCompressed'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      UsersRecord.getDocumentFromData(
        {
          'email': snapshot.data['email'],
          'display_name': snapshot.data['display_name'],
          'photo_url': snapshot.data['photo_url'],
          'uid': snapshot.data['uid'],
          'created_time': convertAlgoliaParam(
            snapshot.data['created_time'],
            ParamType.DateTime,
            false,
          ),
          'phone_number': snapshot.data['phone_number'],
          'realName': snapshot.data['realName'],
          'bio': snapshot.data['bio'],
          'pfpBlurHash': snapshot.data['pfpBlurHash'],
          'admin': snapshot.data['admin'],
          'pincode': snapshot.data['pincode'],
          'pushNotifStatus': snapshot.data['pushNotifStatus'],
          'emailNotifStatus': snapshot.data['emailNotifStatus'],
          'threads': safeGet(
            () => (snapshot.data['threads'] as Iterable)
                .map((d) => ThreadStruct.fromAlgoliaData(d))
                .toList(),
          ),
          'Posts': safeGet(
            () => (snapshot.data['Posts'] as Iterable)
                .map((d) => PostStruct.fromAlgoliaData(d))
                .toList(),
          ),
          'banner': snapshot.data['banner'],
          'saved': safeGet(
            () => snapshot.data['saved'].toList(),
          ),
          'followers': safeGet(
            () => snapshot.data['followers'].toList(),
          ),
          'following': safeGet(
            () => snapshot.data['following'].toList(),
          ),
          'notifications': safeGet(
            () => (snapshot.data['notifications'] as Iterable)
                .map((d) => NotificationStruct.fromAlgoliaData(d))
                .toList(),
          ),
          'isBiometric': snapshot.data['isBiometric'],
          'blocked': safeGet(
            () => snapshot.data['blocked'].toList(),
          ),
          'isStealth': snapshot.data['isStealth'],
          'complete': snapshot.data['complete'],
          'isCompressed': snapshot.data['isCompressed'],
        },
        UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? realName,
  String? bio,
  String? pfpBlurHash,
  bool? admin,
  String? pincode,
  bool? pushNotifStatus,
  bool? emailNotifStatus,
  String? banner,
  bool? isBiometric,
  bool? isStealth,
  bool? complete,
  bool? isCompressed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'realName': realName,
      'bio': bio,
      'pfpBlurHash': pfpBlurHash,
      'admin': admin,
      'pincode': pincode,
      'pushNotifStatus': pushNotifStatus,
      'emailNotifStatus': emailNotifStatus,
      'banner': banner,
      'isBiometric': isBiometric,
      'isStealth': isStealth,
      'complete': complete,
      'isCompressed': isCompressed,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.realName == e2?.realName &&
        e1?.bio == e2?.bio &&
        e1?.pfpBlurHash == e2?.pfpBlurHash &&
        e1?.admin == e2?.admin &&
        e1?.pincode == e2?.pincode &&
        e1?.pushNotifStatus == e2?.pushNotifStatus &&
        e1?.emailNotifStatus == e2?.emailNotifStatus &&
        listEquality.equals(e1?.threads, e2?.threads) &&
        listEquality.equals(e1?.posts, e2?.posts) &&
        e1?.banner == e2?.banner &&
        listEquality.equals(e1?.saved, e2?.saved) &&
        listEquality.equals(e1?.followers, e2?.followers) &&
        listEquality.equals(e1?.following, e2?.following) &&
        listEquality.equals(e1?.notifications, e2?.notifications) &&
        e1?.isBiometric == e2?.isBiometric &&
        listEquality.equals(e1?.blocked, e2?.blocked) &&
        e1?.isStealth == e2?.isStealth &&
        e1?.complete == e2?.complete &&
        e1?.isCompressed == e2?.isCompressed;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.realName,
        e?.bio,
        e?.pfpBlurHash,
        e?.admin,
        e?.pincode,
        e?.pushNotifStatus,
        e?.emailNotifStatus,
        e?.threads,
        e?.posts,
        e?.banner,
        e?.saved,
        e?.followers,
        e?.following,
        e?.notifications,
        e?.isBiometric,
        e?.blocked,
        e?.isStealth,
        e?.complete,
        e?.isCompressed
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
