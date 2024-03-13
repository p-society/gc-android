import 'package:admin/models/player_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final playerProvider = StateProvider<Player>(
  (ref) => Player(
    'email',
    'firstName',
    'lastName',
    'ha',
    'role',
    'sport',
    'branch',
    0,
    'contactNo',
    [],
  ),
);
