import 'package:famedlysdk/src/utils/mx_content.dart';

/// Represents a user profile returned by a /profile request.
class Profile {
  /// The user's avatar URL if they have set one, otherwise null.
  final MxContent avatarUrl;

  /// The user's display name if they have set one, otherwise null.
  final String displayname;

  /// This API may return keys which are not limited to displayname or avatar_url.
  final Map<String, dynamic> content;

  Profile.fromJson(Map<String, dynamic> json)
      : avatarUrl = MxContent(json['avatar_url']),
        displayname = json['displayname'],
        content = json;

  bool operator ==(dynamic other) =>
      this.avatarUrl.mxc == other.avatarUrl.mxc &&
      this.displayname == other.displayname;
}