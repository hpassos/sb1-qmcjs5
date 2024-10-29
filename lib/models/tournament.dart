enum TournamentType {
  singleElimination,
  doubleElimination,
  roundRobin,
  leaguePoints
}

class Tournament {
  final String id;
  final String name;
  final TournamentType type;
  final DateTime startDate;
  final DateTime endDate;
  final List<Team> teams;
  final List<Match> matches;

  Tournament({
    required this.id,
    required this.name,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.teams,
    required this.matches,
  });
}

class Team {
  final String id;
  final String name;
  final Player player1;
  final Player player2;

  Team({
    required this.id,
    required this.name,
    required this.player1,
    required this.player2,
  });
}

class Player {
  final String id;
  final String name;
  final int age;
  final String nationality;

  Player({
    required this.id,
    required this.name,
    required this.age,
    required this.nationality,
  });
}

class Match {
  final String id;
  final Team team1;
  final Team team2;
  final DateTime scheduledTime;
  MatchResult? result;

  Match({
    required this.id,
    required this.team1,
    required this.team2,
    required this.scheduledTime,
    this.result,
  });
}

class MatchResult {
  final List<int> team1Sets;
  final List<int> team2Sets;

  MatchResult({
    required this.team1Sets,
    required this.team2Sets,
  });

  bool get isComplete => team1Sets.length == team2Sets.length;
  
  int get team1WonSets => team1Sets.where((score) => score > team2Sets[team1Sets.indexOf(score)]).length;
  int get team2WonSets => team2Sets.where((score) => score > team1Sets[team2Sets.indexOf(score)]).length;
}