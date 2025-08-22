import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_1/blocs/user/user_state.dart';
import 'package:mini_project_1/data/models/enums.dart';

import '../../data/models/user_model.dart';

class UserCubit extends Cubit<UserState>{
  UserCubit() : super( const UserState( user: User(name: 'fady'  ,level: UserCookingLevel.chef )));

  void changelevel(UserCookingLevel newlevel){
    emit(state.copyWith(user: state.user.copyWith(level: newlevel)));
  }
  double getUsersFactor ()=>timeFactor[state.user.level]!;

  void changename (String newname){
    emit(state.copyWith(user: state.user.copyWith(name: newname)));
    }

}