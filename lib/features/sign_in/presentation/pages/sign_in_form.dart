
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/movies/presentation/pages/movie_list_page.dart';
import 'package:movies/features/sign_in/validators.dart';

import '../../../../injection_container.dart';
import '../../../movies/presentation/bloc/movie_bloc.dart';
import '../widgets/form_submit_button.dart';


class SignInForm extends StatefulWidget with EmailAndPasswordValidators {

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  String get _email => _emailController.text;

  String get _password => _passwordController.text;

  bool _submitted = false;

  void _submit() async {
    setState(() {
      _submitted = true;
    });
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BlocProvider.value(value: sl<MovieBloc>(),child: MovieListPage(),),
    ));
  }

  void _emailEditingComplete() {
    final newFocus = widget.emailValidator.isValid(_email) ?
    _passwordFocusNode : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }


  List<Widget> _buildChildren() {
    const primaryText =  'Sign in';

    bool submitEnabled = widget.emailValidator.isValid(_email) &&
        widget.passwordValidator.isValid(_password);
    return [
      _buildEmailTextField(),
      SizedBox(
        height: 8.0,
      ),
      _buildPasswordTextField(),
      SizedBox(
        height: 8.0,
      ),
      FormSubmitButton(
          text: primaryText, onPressed: submitEnabled ? _submit : null),
    ];
  }

  TextField _buildPasswordTextField() {
    bool showErrorText =
        _submitted && !widget.passwordValidator.isValid(_password);
    return TextField(
      focusNode: _passwordFocusNode,
      controller: _passwordController,
      decoration: InputDecoration(
          labelText: 'Password',
          errorText: showErrorText ? widget.invalidEmailErrorText : null),
      obscureText: true,
      textInputAction: TextInputAction.done,
      onEditingComplete: _submit,
      onChanged: (password) => _updateState(),
    );
  }

  TextField _buildEmailTextField() {
    bool showErrorText = _submitted && !widget.emailValidator.isValid(_email);
    return TextField(
      focusNode: _emailFocusNode,
      controller: _emailController,
      decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'test@test.com',
          errorText: showErrorText ? widget.invalidEmailErrorText : null),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onEditingComplete: _emailEditingComplete,
      onChanged: (email) => _updateState(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),
      ),
    );
  }

  void _updateState() {
    setState(() {});
  }
}
