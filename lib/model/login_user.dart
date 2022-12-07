import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/login/login_user.dart';


final loginUserProvider = Provider(
  (_) => LoginUser(id: 'abcd1234', name: 'Taro'),
);

final loginUserNameProvider = Provider(
  (ref) => ref.watch(loginUserProvider.select((user) => user.name)),
);
