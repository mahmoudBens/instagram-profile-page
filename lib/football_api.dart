import 'package:flutter/material.dart';

void main() {
  runApp(const SportsApp());
}

class SportsApp extends StatelessWidget {
  const SportsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sports App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      home: const LeaguesPage(),
    );
  }
}

// Models
class League {
  final String id;
  final String name;
  final String country;
  final String logoUrl;
  final List<Game> games;

  League({
    required this.id,
    required this.name,
    required this.country,
    required this.logoUrl,
    required this.games,
  });
}

class Team {
  final String id;
  final String name;
  final String logoUrl;
  final String stadium;
  final String city;
  final int foundedYear;

  Team({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.stadium,
    required this.city,
    required this.foundedYear,
  });
}

class Game {
  final String id;
  final Team homeTeam;
  final Team awayTeam;
  final int homeScore;
  final int awayScore;
  final DateTime time;
  final String status; // "SCHEDULED", "LIVE", "FINISHED"
  final List<GameEvent> events;

  Game({
    required this.id,
    required this.homeTeam,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
    required this.time,
    required this.status,
    required this.events,
  });
}

enum EventType { GOAL, YELLOW_CARD, RED_CARD, SUBSTITUTION }

class GameEvent {
  final EventType type;
  final int minute;
  final String playerId;
  final String playerName;
  final String? substituteId; // Only for substitutions
  final String? substituteName; // Only for substitutions
  final Team team;

  GameEvent({
    required this.type,
    required this.minute,
    required this.playerId,
    required this.playerName,
    this.substituteId,
    this.substituteName,
    required this.team,
  });
}

// Sample Data
final List<League> sampleLeagues = [
  League(
    id: '1',
    name: 'Premier League',
    country: 'England',
    logoUrl: 'https://place-hold.it/100x100',
    games: [
      Game(
        id: '1',
        homeTeam: Team(
          id: '1',
          name: 'Manchester United',
          logoUrl: 'https://place-hold.it/100x100',
          stadium: 'Old Trafford',
          city: 'Manchester',
          foundedYear: 1878,
        ),
        awayTeam: Team(
          id: '2',
          name: 'Liverpool',
          logoUrl: 'https://place-hold.it/100x100',
          stadium: 'Anfield',
          city: 'Liverpool',
          foundedYear: 1892,
        ),
        homeScore: 2,
        awayScore: 1,
        time: DateTime.now().subtract(const Duration(hours: 2)),
        status: 'FINISHED',
        events: [
          GameEvent(
            type: EventType.GOAL,
            minute: 23,
            playerId: 'p1',
            playerName: 'Bruno Fernandes',
            team: Team(
              id: '1',
              name: 'Manchester United',
              logoUrl: 'https://place-hold.it/100x100',
              stadium: 'Old Trafford',
              city: 'Manchester',
              foundedYear: 1878,
            ),
          ),
          GameEvent(
            type: EventType.YELLOW_CARD,
            minute: 35,
            playerId: 'p2',
            playerName: 'Virgil van Dijk',
            team: Team(
              id: '2',
              name: 'Liverpool',
              logoUrl: 'https://place-hold.it/100x100',
              stadium: 'Anfield',
              city: 'Liverpool',
              foundedYear: 1892,
            ),
          ),
          GameEvent(
            type: EventType.GOAL,
            minute: 56,
            playerId: 'p3',
            playerName: 'Marcus Rashford',
            team: Team(
              id: '1',
              name: 'Manchester United',
              logoUrl: 'https://place-hold.it/100x100',
              stadium: 'Old Trafford',
              city: 'Manchester',
              foundedYear: 1878,
            ),
          ),
          GameEvent(
            type: EventType.GOAL,
            minute: 78,
            playerId: 'p4',
            playerName: 'Mohamed Salah',
            team: Team(
              id: '2',
              name: 'Liverpool',
              logoUrl: 'https://place-hold.it/100x100',
              stadium: 'Anfield',
              city: 'Liverpool',
              foundedYear: 1892,
            ),
          ),
          GameEvent(
            type: EventType.SUBSTITUTION,
            minute: 65,
            playerId: 'p5',
            playerName: 'Paul Pogba',
            substituteId: 'p6',
            substituteName: 'Scott McTominay',
            team: Team(
              id: '1',
              name: 'Manchester United',
              logoUrl: 'https://place-hold.it/100x100',
              stadium: 'Old Trafford',
              city: 'Manchester',
              foundedYear: 1878,
            ),
          ),
          GameEvent(
            type: EventType.RED_CARD,
            minute: 82,
            playerId: 'p7',
            playerName: 'Trent Alexander-Arnold',
            team: Team(
              id: '2',
              name: 'Liverpool',
              logoUrl: 'https://place-hold.it/100x100',
              stadium: 'Anfield',
              city: 'Liverpool',
              foundedYear: 1892,
            ),
          ),
        ],
      ),
      Game(
        id: '2',
        homeTeam: Team(
          id: '3',
          name: 'Arsenal',
          logoUrl: 'https://place-hold.it/100x100',
          stadium: 'Emirates Stadium',
          city: 'London',
          foundedYear: 1886,
        ),
        awayTeam: Team(
          id: '4',
          name: 'Chelsea',
          logoUrl: 'https://place-hold.it/100x100',
          stadium: 'Stamford Bridge',
          city: 'London',
          foundedYear: 1905,
        ),
        homeScore: 1,
        awayScore: 1,
        time: DateTime.now().add(const Duration(days: 2)),
        status: 'SCHEDULED',
        events: [],
      ),
    ],
  ),
  League(
    id: '2',
    name: 'La Liga',
    country: 'Spain',
    logoUrl: 'https://place-hold.it/100x100',
    games: [
      Game(
        id: '3',
        homeTeam: Team(
          id: '5',
          name: 'Barcelona',
          logoUrl: 'https://place-hold.it/100x100',
          stadium: 'Camp Nou',
          city: 'Barcelona',
          foundedYear: 1899,
        ),
        awayTeam: Team(
          id: '6',
          name: 'Real Madrid',
          logoUrl: 'https://place-hold.it/100x100',
          stadium: 'Santiago Bernabéu',
          city: 'Madrid',
          foundedYear: 1902,
        ),
        homeScore: 0,
        awayScore: 0,
        time: DateTime.now(),
        status: 'LIVE',
        events: [
          GameEvent(
            type: EventType.YELLOW_CARD,
            minute: 15,
            playerId: 'p8',
            playerName: 'Sergio Busquets',
            team: Team(
              id: '5',
              name: 'Barcelona',
              logoUrl: 'https://place-hold.it/100x100',
              stadium: 'Camp Nou',
              city: 'Barcelona',
              foundedYear: 1899,
            ),
          ),
          GameEvent(
            type: EventType.SUBSTITUTION,
            minute: 30,
            playerId: 'p9',
            playerName: 'Karim Benzema',
            substituteId: 'p10',
            substituteName: 'Luka Jović',
            team: Team(
              id: '6',
              name: 'Real Madrid',
              logoUrl: 'https://place-hold.it/100x100',
              stadium: 'Santiago Bernabéu',
              city: 'Madrid',
              foundedYear: 1902,
            ),
          ),
        ],
      ),
    ],
  ),
];

// Main Pages
class LeaguesPage extends StatelessWidget {
  const LeaguesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leagues'),
      ),
      body: ListView.builder(
        itemCount: sampleLeagues.length,
        itemBuilder: (context, index) {
          final league = sampleLeagues[index];
          return LeagueCard(league: league);
        },
      ),
    );
  }
}

class LeagueCard extends StatelessWidget {
  final League league;

  const LeagueCard({Key? key, required this.league}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LeagueDetailsPage(league: league),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  league.logoUrl,
                  width: 50,
                  height: 50,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 50,
                      height: 50,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.sports_soccer, color: Colors.grey),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    league.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    league.country,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                '${league.games.length} games',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

class LeagueDetailsPage extends StatelessWidget {
  final League league;

  const LeagueDetailsPage({Key? key, required this.league}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(league.name),
      ),
      body: ListView.builder(
        itemCount: league.games.length,
        itemBuilder: (context, index) {
          final game = league.games[index];
          return GameCard(game: game);
        },
      ),
    );
  }
}

class GameCard extends StatelessWidget {
  final Game game;

  const GameCard({Key? key, required this.game}) : super(key: key);

  String _formatGameTime() {
    if (game.status == 'LIVE') {
      return 'LIVE';
    } else if (game.status == 'FINISHED') {
      return 'FT';
    } else {
      return '${game.time.day}/${game.time.month} ${game.time.hour}:${game.time.minute.toString().padLeft(2, '0')}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GameDetailsPage(game: game),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatGameTime(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: game.status == 'LIVE' ? Colors.red : Colors.grey[600],
                    ),
                  ),
                  if (game.status != 'SCHEDULED')
                    Text(
                      '${game.homeScore} - ${game.awayScore}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                  else
                    const Text(
                      'vs',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TeamDisplay(
                      team: game.homeTeam,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  Expanded(
                    child: TeamDisplay(
                      team: game.awayTeam,
                      alignment: Alignment.centerRight,
                    ),
                  ),
                ],
              ),
              if (game.events.isNotEmpty) ...[
                const SizedBox(height: 8),
                const Divider(),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.event_note, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      'Events: ${game.events.length}',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class TeamDisplay extends StatelessWidget {
  final Team team;
  final Alignment alignment;

  const TeamDisplay({
    Key? key,
    required this.team,
    required this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment == Alignment.centerLeft
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: alignment == Alignment.centerLeft
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          children: [
            if (alignment == Alignment.centerRight) ...[
              Text(
                team.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 8),
            ],
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                team.logoUrl,
                width: 30,
                height: 30,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 30,
                    height: 30,
                    color: Colors.grey[300],
                    child: const Icon(Icons.sports_soccer, size: 20, color: Colors.grey),
                  );
                },
              ),
            ),
            if (alignment == Alignment.centerLeft) ...[
              const SizedBox(width: 8),
              Text(
                team.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 4),
        Text(
          team.stadium,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

class GameDetailsPage extends StatelessWidget {
  final Game game;

  const GameDetailsPage({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${game.homeTeam.name} vs ${game.awayTeam.name}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Score and Time
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    game.status == 'LIVE'
                        ? 'LIVE'
                        : game.status == 'FINISHED'
                        ? 'Full Time'
                        : '${game.time.day}/${game.time.month} ${game.time.hour}:${game.time.minute.toString().padLeft(2, '0')}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TeamLogoName(team: game.homeTeam),
                      const SizedBox(width: 16),
                      Text(
                        game.status != 'SCHEDULED'
                            ? '${game.homeScore} - ${game.awayScore}'
                            : 'vs',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 16),
                      TeamLogoName(team: game.awayTeam, isRight: true),
                    ],
                  ),
                ],
              ),
            ),

            // Team Details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TeamDetailsCard(team: game.homeTeam),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TeamDetailsCard(team: game.awayTeam),
                  ),
                ],
              ),
            ),

            // Events Timeline
            if (game.events.isNotEmpty) ...[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  'Match Timeline',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              EventsTimeline(events: game.events),
            ],
          ],
        ),
      ),
    );
  }
}

class TeamLogoName extends StatelessWidget {
  final Team team;
  final bool isRight;

  const TeamLogoName({
    Key? key,
    required this.team,
    this.isRight = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!isRight) ...[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              team.logoUrl,
              width: 40,
              height: 40,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 40,
                  height: 40,
                  color: Colors.grey[300],
                  child: const Icon(Icons.sports_soccer, size: 24, color: Colors.grey),
                );
              },
            ),
          ),
          const SizedBox(width: 8),
          Text(
            team.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ] else ...[
          Text(
            team.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              team.logoUrl,
              width: 40,
              height: 40,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 40,
                  height: 40,
                  color: Colors.grey[300],
                  child: const Icon(Icons.sports_soccer, size: 24, color: Colors.grey),
                );
              },
            ),
          ),
        ],
      ],
    );
  }
}

class TeamDetailsCard extends StatelessWidget {
  final Team team;

  const TeamDetailsCard({Key? key, required this.team}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      team.logoUrl,
                      width: 60,
                      height: 60,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 60,
                          height: 60,
                          color: Colors.grey[300],
                          child: const Icon(Icons.sports_soccer, size: 36, color: Colors.grey),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    team.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            TeamInfoRow(icon: Icons.stadium, label: 'Stadium', value: team.stadium),
            const SizedBox(height: 8),
            TeamInfoRow(icon: Icons.location_city, label: 'City', value: team.city),
            const SizedBox(height: 8),
            TeamInfoRow(
              icon: Icons.calendar_today,
              label: 'Founded',
              value: team.foundedYear.toString(),
            ),
          ],
        ),
      ),
    );
  }
}

class TeamInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const TeamInfoRow({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class EventsTimeline extends StatelessWidget {
  final List<GameEvent> events;

  const EventsTimeline({Key? key, required this.events}) : super(key: key);

  IconData _getEventIcon(EventType type) {
    switch (type) {
      case EventType.GOAL:
        return Icons.sports_soccer;
      case EventType.YELLOW_CARD:
        return Icons.square;
      case EventType.RED_CARD:
        return Icons.square;
      case EventType.SUBSTITUTION:
        return Icons.swap_horiz;
    }
  }

  Color _getEventColor(EventType type) {
    switch (type) {
      case EventType.GOAL:
        return Colors.green;
      case EventType.YELLOW_CARD:
        return Colors.amber;
      case EventType.RED_CARD:
        return Colors.red;
      case EventType.SUBSTITUTION:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Sort events by minute
    final sortedEvents = [...events];
    sortedEvents.sort((a, b) => a.minute.compareTo(b.minute));

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: sortedEvents.length,
      itemBuilder: (context, index) {
        final event = sortedEvents[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 40,
                child: Text(
                  '${event.minute}\'',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: _getEventColor(event.type),
                  shape: event.type == EventType.YELLOW_CARD || event.type == EventType.RED_CARD
                      ? BoxShape.rectangle
                      : BoxShape.circle,
                  borderRadius: event.type == EventType.YELLOW_CARD || event.type == EventType.RED_CARD
                      ? BorderRadius.circular(2)
                      : null,
                ),
                child: Icon(
                  _getEventIcon(event.type),
                  color: Colors.white,
                  size: 16,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.playerName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (event.type == EventType.SUBSTITUTION) ...[
                      Text(
                        'Out: ${event.playerName}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        'In: ${event.substituteName}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.green,
                        ),
                      ),
                    ],
                    Text(
                      event.team.name,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  event.team.logoUrl,
                  width: 24,
                  height: 24,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 24,
                      height: 24,
                      color: Colors.grey[300],
                      child: const Icon(Icons.sports_soccer, size: 16, color: Colors.grey),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}