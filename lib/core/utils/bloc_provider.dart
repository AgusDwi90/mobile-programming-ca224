import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/views/authentication/bloc/authentication_bloc.dart';
import 'package:myapp/views/user/bloc/user_data_bloc.dart';
import 'package:myapp/views/comment/bloc/comment_bloc.dart'; // Import CommentBloc
import '../../repositories/contracts/abs_api_moment_repository.dart';
import '../../repositories/contracts/abs_api_user_data_repository.dart';
import '../../repositories/contracts/abs_api_comment_repository.dart'; // Import AbsApiCommentRepository
import '../../repositories/contracts/abs_auth_repository.dart';
import '../../views/moment/bloc/moment_bloc.dart';

final blocProviders = [
  BlocProvider<AuthenticationBloc>(
    create: (context) => AuthenticationBloc(context.read<AbsAuthRepository>()),
  ),
  BlocProvider<MomentBloc>(
    create: (context) => MomentBloc(context.read<AbsApiMomentRepository>()),
  ),
  BlocProvider<UserDataBloc>(
    create: (context) => UserDataBloc(context.read<AbsApiUserDataRepository>()),
  ),
  BlocProvider<CommentBloc>(
    create: (context) => CommentBloc(
      commentRepository: context.read<AbsApiCommentRepository>(),
      currentUser: 'activeUserId',
    ),
  ),
];
