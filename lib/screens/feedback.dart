// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:pathlexi/style.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyCustomForm(),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() => MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class MyCustomFormState extends State<MyCustomForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  String? feedbackName = '';
  String? feedbackEmail = '';
  String? feedbackMessage = '';

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    super.dispose();
  }

  bool isValidEmail(String input) {
    final RegExp regex = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(input);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void showErrorMessage(String message,
      [Color color = Style.errorSnackBarColor]) {
    ScaffoldMessenger.of(context).showSnackBar(
        new SnackBar(backgroundColor: color, content: new Text(message)));
  }

  void showSuccessMessage(String message,
      [Color color = Style.successSnackBarColor]) {
    ScaffoldMessenger.of(context).showSnackBar(
        new SnackBar(backgroundColor: color, content: new Text(message)));
  }

  void _submitForm() {
    final FormState form = _formKey.currentState!;

    if (!form.validate()) {
      showErrorMessage('Form is not valid. Please review and correct.');
    } else {
      form.save(); //This invokes each onSaved event

      //print('Form save called, going to email via MailGun...');
      //print('Name: $feedbackName');
      //print('Email: $feedbackEmail');
      // print('Feedback message: $feedbackMessage');
      // print('========================================');
      // print('Submitting to back end...');

      // And call the emailer function
      sendFeedbackEmail();

      showSuccessMessage('Feedback submitted, thank you.');
    }
  }

////

  Future<void> sendFeedbackEmail() async {
    String username = 'something';
    String password = 'something';

    final smtpServer = mailgun(username, password);
    // Use the SmtpServer class to configure an SMTP server:
    // final smtpServer = SmtpServer('smtp.domain.com');
    // See the named arguments of SmtpServer for further configuration
    // options.

    // Create our message.
    final message = Message()
      //..from = Address(username, 'Your name')
      ..from = Address(username, feedbackEmail)
      ..recipients.add('somebody@gmail.com')
      ..ccRecipients
          .addAll(['sombody.else@gmail.com', 'another.person@gmail.com'])
      //..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = '[Pathology Lexicon A-Z Feedback]'
      //..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<p>Feedback: $feedbackMessage</p>\n<p>From: $feedbackName</p>";

    try {
      // ignore: unused_local_variable
      final sendReport = await send(message, smtpServer);
      // ignore: avoid_print
      print('Message sent: $sendReport');
    } on MailerException catch (e) {
      // ignore: avoid_print
      print('Message not sent.');
      for (var p in e.problems) {
        // ignore: avoid_print
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

////

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: new SafeArea(
          top: true,
          bottom: true,
          child: new Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: new ListView(
                padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
                children: <Widget>[
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Enter your first and last name',
                      labelText: 'Name',
                    ),
                    controller: nameController,
                    inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                    validator: (val) =>
                        val!.isEmpty ? 'Name is required' : null,
                    onSaved: (val) => feedbackName = val,
                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: 'Enter a email address',
                      labelText: 'Email',
                    ),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => isValidEmail(value!)
                        ? null
                        : 'Please enter a valid email address',
                    onSaved: (val) => feedbackEmail = val,
                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.subject),
                      hintText: 'Enter your feedback message',
                      labelText: 'Feedback',
                    ),
                    keyboardType: TextInputType.text,
                    maxLines: 4,
                    controller: messageController,
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(160)
                    ],
                    validator: (val) =>
                        val!.isEmpty ? 'Feedback is required' : null,
                    onSaved: (val) => feedbackMessage = val,
                  ),
                  new Container(
                    padding: const EdgeInsets.only(
                        left: 40.0, top: 20.0, right: 40.0),
                    child: new ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        primary: Style.plcGreenTheme,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(4.0),
                        ),
                      ),
                      child: const Text('Send feedback',
                          style: Style.submitFeedbackButtonText),
                    ),
                  ),
                ],
              ))),
    );
  }
}
