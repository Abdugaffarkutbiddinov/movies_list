import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/features/movies/presentation/pages/movie_list_page.dart';

import '../../../../injection_container.dart';
import '../../../movies/presentation/bloc/movie_bloc.dart';
import '../../email_password_regex_validator.dart';
import '../../validator.dart';
import '../widgets/form_submit_button.dart';

class SignInForm extends StatefulWidget with EmailAndPasswordValidators{
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
    bool valid = widget.passwordSubmitRegexValidator.isValid(_password);
    if (valid) {
      _passwordFocusNode.unfocus();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: sl<MovieBloc>(),
          child: MovieListPage(),
        ),
      ));
      _emailController.clear();
      _passwordController.clear();
    } else {
      FocusScope.of(context).requestFocus(_passwordFocusNode);
    }
  }

  void _emailEditingComplete() {
    final newFocus = widget.emailSubmitRegexValidator.isValid(_email)
        ? _passwordFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  List<Widget> _buildChildren() {
    const primaryText = 'Войти';
    bool submitEnabled = widget.emailSubmitRegexValidator.isValid(_email) &&
        widget.passwordSubmitRegexValidator.isValid(_password);
    return [
      Text('Авторизация',style:  GoogleFonts.roboto(
          fontSize: 34 ,
          color: Colors.white,
          fontWeight: FontWeight.w300),),
      _buildEmailTextField(),
      Expanded(
        child: SizedBox(
        ),
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
        _submitted && !widget.passwordSubmitRegexValidator.isValid(_password);
    return TextField(
      focusNode: _passwordFocusNode,
      controller: _passwordController,
      decoration: InputDecoration(
          labelText: 'Password',
          errorText: showErrorText ? 'Enter at least 6 characters' : null),
      obscureText: true,
      textInputAction: TextInputAction.done,
      inputFormatters: [
        ValidatorInputFormatter(
          editingValidator: widget.passwordEditingRegexValidator,
        ),
      ],
      onEditingComplete: _submit,
      onChanged: (password) => _updateState(),
    );
  }

  TextField _buildEmailTextField() {
    bool showErrorText =
        _submitted && !widget.emailSubmitRegexValidator.isValid(_email);
    return TextField(
      focusNode: _emailFocusNode,
      controller: _emailController,
      decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'test@test.com',
          errorText: showErrorText ? 'Email field invalid' : null),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      inputFormatters: [
        ValidatorInputFormatter(
          editingValidator: widget.emailEditingRegexValidator,
        ),
      ],
      onEditingComplete: _emailEditingComplete,
      onChanged: (email) => _updateState(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),
      ),
    );
  }

  void _updateState() {
    setState(() {});
  }
}
