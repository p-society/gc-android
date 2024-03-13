import 'package:admin/models/player_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final playerProvider = StateProvider<Player>(
  (ref) => Player(
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    0,
    '',
    [],
  ),
);
