import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/movies/presentation/pages/movie_list_page.dart';

import '../../../../injection_container.dart';
import '../../../movies/presentation/bloc/movie_bloc.dart';
import '../../validator.dart';
import '../widgets/form_submit_button.dart';

class EmailEditingRegexValidator extends RegexValidator {
  EmailEditingRegexValidator()
      : super(
            regexSource:
                "^[a-zA-Z0-9_.+-]*(@([a-zA-Z0-9-]*(\\.[a-zA-Z0-9-]*)?)?)?\$");
}

class EmailSubmitRegexValidator extends RegexValidator {
  EmailSubmitRegexValidator()
      : super(
            regexSource: "(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-]+\$)");
}

class SignInForm extends StatefulWidget {
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

  // String _value = '';

  void _submit() async {
    setState(() {
      _submitted = true;
    });
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BlocProvider.value(
        value: sl<MovieBloc>(),
        child: MovieListPage(),
      ),
    ));
  }

  // void _submit() async {
  //   bool valid = EmailSubmitRegexValidator().isValid(_email);
  //   if (valid) {
  //     _emailFocusNode.unfocus();
  //     // widget.onSubmit(_email);
  //   } else {
  //     FocusScope.of(context).requestFocus(_emailFocusNode);
  //   }
  // }

  void _emailEditingComplete() {
    final newFocus = EmailEditingRegexValidator().isValid(_email)
        ? _passwordFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  List<Widget> _buildChildren() {
    const primaryText = 'Sign in';

    // bool submitEnabled = widget.emailValidator.isValid(_email) &&
    //     widget.passwordValidator.isValid(_password);
    bool submitEnabled = EmailSubmitRegexValidator().isValid(_email) &&
        NonEmptyStringValidator().isValid(_password);
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
        _submitted && !NonEmptyStringValidator().isValid(_password);
    return TextField(
      focusNode: _passwordFocusNode,
      controller: _passwordController,
      decoration: InputDecoration(
          labelText: 'Password',
          errorText: showErrorText ? 'Enter at least 6 digits' : null),
      obscureText: true,
      textInputAction: TextInputAction.done,
      onEditingComplete: _submit,
      onChanged: (password) => _updateState(),
    );
  }

  TextField _buildEmailTextField() {
    // bool showErrorText = _submitted && !widget.emailValidator.isValid(_email);
    bool showErrorText =
        _submitted && !EmailSubmitRegexValidator().isValid(_email);
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
      inputFormatters: [ValidatorInputFormatter(
        editingValidator: EmailEditingRegexValidator(),
      ),],
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
