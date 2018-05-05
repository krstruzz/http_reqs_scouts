
class Scout {
  final int id;
  String firstName;
  String rank;

  Scout(this.id, this.firstName, this.rank);

  factory Scout.fromJson(Map<String, dynamic> scout) =>
      new Scout(
          _toInt(scout['SCOUT_ID']),
          scout['FIRST_NAME_CHILD'],
          scout['RANK']
      );

  Map toJson() =>
      {
        'SCOUT_ID': id,
        'FIRST_NAME_CHILD': firstName,
        'RANK': rank
      };
}

  int _toInt(id) => id is int ? id : int.parse(id);
