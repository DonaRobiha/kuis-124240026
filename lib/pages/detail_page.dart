import 'package:flutter/material.dart';

import '../models/pokemon.dart';

class PokemonDetailPage extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailPage({
    super.key,
    required this.pokemon,
  });

  // Menentukan icon berdasarkan nama aktivitas
  IconData getActivityIcon(String activity) {
    final text = activity.toLowerCase();

    if (text.contains('hunting')) {
      return Icons.gps_fixed;
    }

    if (text.contains('roaming')) {
      return Icons.explore_outlined;
    }

    if (text.contains('sleeping')) {
      return Icons.bedtime_outlined;
    }

    if (text.contains('basking')) {
      return Icons.wb_sunny_outlined;
    }

    if (text.contains('exploring')) {
      return Icons.travel_explore;
    }

    if (text.contains('flying')) {
      return Icons.flight;
    }

    if (text.contains('mimicking')) {
      return Icons.record_voice_over_outlined;
    }

    if (text.contains('eating')) {
      return Icons.restaurant_outlined;
    }

    if (text.contains('swimming')) {
      return Icons.pool;
    }

    if (text.contains('diving')) {
      return Icons.scuba_diving;
    }

    if (text.contains('resting')) {
      return Icons.self_improvement;
    }

    if (text.contains('running')) {
      return Icons.directions_run;
    }

    if (text.contains('pulling')) {
      return Icons.directions_walk;
    }

    if (text.contains('playing')) {
      return Icons.sports_esports_outlined;
    }

    if (text.contains('climbing')) {
      return Icons.terrain;
    }

    return Icons.pets;
  }

  // Warna icon aktivitas berdasarkan jenis aktivitas
  Color getActivityColor(String activity) {
    final text = activity.toLowerCase();

    if (text.contains('sleeping') ||
        text.contains('resting')) {
      return const Color(0xFF7B6D8D);
    }

    if (text.contains('swimming') ||
        text.contains('diving')) {
      return const Color(0xFF5D8796);
    }

    if (text.contains('flying')) {
      return const Color(0xFF8B6F8E);
    }

    if (text.contains('eating')) {
      return const Color(0xFFB97855);
    }

    if (text.contains('running') ||
        text.contains('playing')) {
      return const Color(0xFFC28A52);
    }

    return const Color(0xFFD98C5F);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F1E8),

      body: CustomScrollView(
        slivers: [
          // =========================
          // FOTO HEWAN
          // =========================
          SliverAppBar(
            expandedHeight: 330,
            pinned: true,

            backgroundColor: const Color(0xFF49362C),

            leading: Container(
              margin: const EdgeInsets.all(8),

              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.35),
                shape: BoxShape.circle,
              ),

              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),

                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),

            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                pokemon.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),

              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    pokemon.image,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFFEBD7C8),
                        child: const Icon(
                          Icons.image_not_supported_outlined,
                          size: 60,
                          color: Color(0xFF9A7563),
                        ),
                      );
                    },
                  ),

                  // Gradient agar tulisan tetap terlihat
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black54,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  // =========================
                  // TYPE
                  // =========================
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 7,
                    ),

                    decoration: BoxDecoration(
                      color: const Color(0xFFEBD7C8),
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Text(
                      pokemon.types.join(' • '),
                      style: const TextStyle(
                        color: Color(0xFF9A5F43),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  const Text(
                    'About Pokemon',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF49362C),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // =========================
                  // INFO CARDS
                  // =========================
                  Row(
                    children: [
                      Expanded(
                        child: _InfoCard(
                          icon: Icons.monitor_weight_outlined,
                          title: 'Weight',
                          value: '${pokemon.weight} kg',
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: _InfoCard(
                          icon: Icons.height,
                          title: 'Height',
                          value: '${pokemon.height} cm',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // =========================
                  // HABITAT
                  // =========================
                  const Text(
                    'Ability',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF49362C),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Wrap(
                    spacing: 9,
                    runSpacing: 9,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: const Color(0xFFEBD7C8),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              size: 17,
                              color: Color(0xFFD98C5F),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              pokemon.ability,
                              style: const TextStyle(
                                color: Color(0xFF6E574A),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  // =========================
                  // ACTIVITIES
                  // =========================
                  const Text(
                    'Pokemon Ability',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF49362C),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Setiap aktivitas punya icon sendiri
                  Builder(
                    builder: (context) {
                      final icon = getActivityIcon(pokemon.ability);
                      final color = getActivityColor(pokemon.ability);

                      return Container(
                        margin: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 13,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(17),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: color.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Icon(
                                icon,
                                color: color,
                                size: 23,
                              ),
                            ),
                            const SizedBox(width: 13),
                            Expanded(
                              child: Text(
                                pokemon.ability,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF574237),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 14,
                              color: Colors.grey.shade400,
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 15),

                  // =========================
                  // BACK BUTTON
                  // =========================
                  SizedBox(
                    width: double.infinity,
                    height: 53,

                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      icon: const Icon(
                        Icons.arrow_back_rounded,
                      ),

                      label: const Text(
                        'Back to Pokemon List',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFFD98C5F),
                        foregroundColor: Colors.white,
                        elevation: 0,

                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(17),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ======================================
// INFO CARD
// ======================================

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,

            decoration: BoxDecoration(
              color: const Color(0xFFF4E3D7),
              borderRadius: BorderRadius.circular(13),
            ),

            child: Icon(
              icon,
              color: const Color(0xFFD98C5F),
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF9A877B),
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF49362C),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}