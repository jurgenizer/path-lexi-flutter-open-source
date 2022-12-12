// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pathlexi/style.dart';
import 'package:url_launcher/url_launcher.dart';

/// This is the stateless widget that the main application instantiates.
class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const edgeInsets = EdgeInsets.all(18.0);
    const listTile = ListTile(
      title: Text('Privacy Policy'),
      subtitle: Text(
        'This Privacy Policy describes how your personal information is collected,'
        'used, and shared when you use the Pathology Lexicon A-Z mobile application (the "app").'
        '\n\nPERSONAL INFORMATION WE COLLECT'
        '\n\nApp Store Information (iOS version)'
        '\n\nWhen you download and install the app from the App Store, we receive statistics related to the app. We can view the country of origin (where the app was downloaded from). '
        'We also see how many times the apps\'s icon has been viewed on the App store. We can calculate the total amount of times the app has been downloaded. '
        'In addition, we can see which kind of Apple mobile device the app has been installed on. (For further information please refer to Apple\'s Privacy Policy '
        '\nhttps://www.apple.com/za/legal/privacy/en-ww/)'
        '\n\nGoogle Play Information (Android version)'
        '\n\nWhen you download and install the app from Google Play, we receive statistics related to the app. Metrics include (but are not limited to) the number of installs and uninstalls, '
        'ratings and app crashes. Further dimensions include the Android OS version of the device the app was installed on, the country of origin (where the app was downloaded from) and the users\' Android OS language setting. '
        'For further information please refer to Googles\'s Privacy Policy https://policies.google.com/privacy).'
        '\n\nUser Engagement Information (iOS version)'
        '\n\nWe collect usage information from your device, if you have opted-in and agreed to share diagnostic and usage information with app developers via iOS. '
        '(For further information please refer to Apple\'s Privacy Policy https://www.apple.com/za/legal/privacy/en-ww/). This usage information is anonymised '
        '(we cannot identify who you are) and includes information about crashes (how many times the app has crashed) and sessions (how many times the app has been launched and has stayed open for longer than 2 seconds).'
        '\n\nUser Engagement Information (Android version)'
        '\n\nWe collect usage information from your device, to better understand app performance. This usage information is anonymised (we cannot identify who you are) and includes information about crashes (how many times the app has crashed) '
        'and ANRs (application not responding errors). (For further information please refer to Googles\'s Privacy Policy https://policies.google.com/privacy).'
        '\n\nUser-generated Information (iOS and Android versions)'
        '\n\nAny user-generated content from the app is stored on the user\'s mobile device and is not shared with, or accessible by the UCT Pathology Learning Centre. '
        'However, if you use the contact form in the app to send feedback, we will ask you to provide us with your: email address, first name and last name. This information may be retained and used by us to respond to your feedback.'
        '\n\nHOW DO WE USE YOUR PERSONAL INFORMATION? \n\nWe use the User Engagement Information listed above (iOS and Android versions) that we collect to help us improve and optimise our app (for example, by eliminating code errors). '
        'Furthermore, we may use App Store and Google Play information to assess the success of our marketing and advertising campaigns. '
        'If you use the contact form in the app to send feedback, we will ask you to provide us with your: email address, first name and last name. This information may be retained and used by us to respond to your feedback.'
        '\n\nSHARING YOUR PERSONAL INFORMATION \n\nWe do not share your Personal Information with third parties, other than Apple and Google. You can read about how Apple uses your Personal Information here: https://www.apple.com/za/legal/privacy/en-ww/. '
        'Read about how Google uses your Personal Information here: https://policies.google.com/privacy'
        '\n\nDATA RETENTION \n\nWe do not retain your data. However, Apple (iOS version of the app) and Google (Android version of the app) may possibly retain your data. '
        '(For further information please refer to Apple\'s Privacy Policy https://www.apple.com/za/legal/privacy/en-ww/ and Google\'s Privacy Policy https://policies.google.com/privacy, respectively).'
        '\n\nYOUR RIGHTS'
        '\n\nIf you are a European resident, you have the right to access Personal Information we hold about you and to ask that your Personal Information be corrected, updated, or deleted. '
        'If you would like to exercise this right, please contact us using the contact information below.'
        '\n\nLINKS \n\nOur app may contain links to other sites that have separate privacy policies.'
        '\n\nCHANGES \n\nWe may update this privacy policy from time to time in order to reflect, for example, changes to our practices or for other operational, legal or regulatory reasons.'
        '\n\nCONTACT US\n\nFor more information about our privacy practices, if you have questions, or if you would like to make a complaint, please contact us via email (lab-digipath@uct.ac.za) '
        'or by post, using the details provided below:'
        '\n\nUCT Pathology Learning Centre, JS Marais Building, Faculty of Health Sciences, University of Cape Town, Anzio Road, Observatory, 7925, South Africa'
        ' \n\nTRADEMARK NOTICE AND ATTRIBUTION \nApple®, App Store® and iOS® are trademarks of Apple Inc., registered in the U.S. and other countries.'
        '\n\nGoogle™, Google Play™ and Android™ are trademarks of Google LLC., registered in the U.S. and other countries.',
      ),
      contentPadding: EdgeInsets.all(18.0),
    );
    var listTile2 = listTile;
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  Card(
                    margin: edgeInsets,
                    elevation: 6.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 120.0,
                              height: 120.0,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: AssetImage(
                                      'assets/images/pathlexi-logo.png'),
                                ),
                              ),
                            ),
                            Container(
                              width: 130.0,
                              height: 130.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image:
                                      AssetImage('assets/images/plc-logo.png'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 6.0,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Pathology Lexicon A-Z',
                          style: Style.searchText,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Version 1.0.7 Build 4131',
                          style: Style.searchText,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                      ],
                    ),
                  ),
                  // CARD
                  Card(
                    margin: EdgeInsets.all(16.0),
                    elevation: 6.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const ListTile(
                          title: Text('About this app'),
                          subtitle: Text(
                              'Pathology is described using particular words. '
                              'This is a handy list of those words, what they mean '
                              'and when to use them. We\'re talking about gross '
                              'pathology i.e. what you see with the naked eye. '
                              'This app is a companion to'),
                          contentPadding: EdgeInsets.fromLTRB(18, 16, 18, 4),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.school,
                              color: Style.plcGreenTheme,
                              size: 32.0,
                            ),
                            tooltip: 'Visit the our website',
                            onPressed: () {
                              launch('https://digitalpathology.uct.ac.za/');
                            }),
                        GestureDetector(
                            child: Text("www.digitalpathology.uct.ac.za",
                                style: Style.minorText),
                            onTap: () {
                              launch('https://digitalpathology.uct.ac.za/');
                            }),
                        SizedBox(
                          height: 16.0,
                        ),
                      ],
                    ),
                  ),
                  // CARD
                  Card(
                    margin: EdgeInsets.all(16.0),
                    elevation: 6.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(18, 18, 18, 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Acknowledgements', style: Style.searchText),
                          Text('We are grateful to:\n\nisiXhosa translation\n',
                              style: Style.minorText),
                          GestureDetector(
                              child: Text(
                                  "Ms Nolubabalo Tyam\nUCT Multilingualism Education Project\nwww.mep.uct.ac.za/mep/translation",
                                  style: Style.minorText),
                              // Currently won't launch on iOS (and probably Android) because site is non-https
                              onTap: () {
                                launch(
                                    'http://www.mep.uct.ac.za/mep/translation');
                              }),
                          SizedBox(
                            height: 12.0,
                          ),
                          GestureDetector(
                              child: Text(
                                  "Dr Ayanda Mfokazi FCPath(SA)(Anat)\nUCT Division of Anatomical Pathology\nwww.anatomicalpathology.uct.ac.za",
                                  style: Style.minorText),
                              // Currently won't launch on iOS (and probably Android) because site is non-https
                              onTap: () {
                                launch(
                                    'http://www.anatomicalpathology.uct.ac.za');
                              }),
                          SizedBox(
                            height: 12.0,
                          ),
                          GestureDetector(
                              child: Text(
                                  "Afrikaans translation\n\nDr Frans-Peter Botha FCPath(SA)(Anat)\nScopus Author ID: 57193916735",
                                  style: Style.minorText),
                              onTap: () {
                                launch(
                                    'https://www.scopus.com/authid/detail.uri?authorId=57193916735');
                              }),
                          SizedBox(
                            height: 12.0,
                          ),
                          GestureDetector(
                              child: Text(
                                  "Portions of code in this app are adapted from the Flutter open source samples:\nhttps://github.com/flutter/samples",
                                  style: Style.minorText),
                              onTap: () {
                                launch('https://github.com/flutter/samples');
                              }),
                        ],
                      ),
                    ),
                  ),
                  // CARD
                  Card(
                    margin: EdgeInsets.all(16.0),
                    elevation: 6.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        ListTile(
                          title: Text('References'),
                          subtitle: Text(
                            'AHDEL: American Heritage® Dictionary of the English Language \nhttps://thefreedictionary.com\n\n'
                            'AHMD: The American Heritage® Medical Dictionary \nhttps://medical-dictionary.thefreedictionary.com\n\n'
                            'CED: Collins English Dictionary - Complete and Unabridged \nhttps://thefreedictionary.com\n\n'
                            'CDM: Collins Dictionary of Medicine (2004, 2005) \nhttps://thefreedictionary.com\n\n'
                            'DMD: Dorland\'s Medical Dictionary for Health Consumers \nhttps://medical-dictionary.thefreedictionary.com\n\n'
                            'FPMD: Farlex Partner Medical Dictionary \nhttps://medical-dictionary.thefreedictionary.com\n\n'
                            'MHCDMM: McGraw-Hill Concise Dictionary of Modern Medicine \nhttps://medical-dictionary.thefreedictionary.com\n\n'
                            'MD: Medical Dictionary \nhttps://medical-dictionary.thefreedictionary.com\n\n'
                            'MDDP: Medical Dictionary for the Dental Professions \nhttps://medical-dictionary.thefreedictionary.com\n\n'
                            'MKEDMNAH: Miller-Keane Encyclopedia and Dictionary of Medicine, Nursing, and Allied Health \nhttps://medical-dictionary.thefreedictionary.com\n\n'
                            'MMD: Mosby\'s Medical Dictionary, 8th edition \nhttps://medical-dictionary.thefreedictionary.com\n\n'
                            'MWMD: Merriam-Webster Medical Dictionary \nhttps://www.merriam-webster.com/medical\n\n'
                            'NCBI: National Center for Biotechnology Information \nhttps://www.ncbi.nlm.nih.gov\n\n'
                            'PLC: UCT Pathology Learning Centre \nhttp://www.pathologylearningcentre.uct.ac.za\n\n'
                            'SCVD: Saunders Comprehensive Veterinary Dictionary, 3rd edition \nhttps://medical-dictionary.thefreedictionary.com\n\n'
                            'SMD: Segen\'s Medical Dictionary \nhttps://medical-dictionary.thefreedictionary.com\n\n'
                            'W: Wikipedia \nhttps://en.wikipedia.org/wiki/Main_Page\n\n'
                            'WN: Wordnet 3.0 Farlex Clipart Collection (2003 - 2012) \nhttps://www.freethesaurus.com',
                          ),
                          contentPadding: EdgeInsets.all(18.0),
                        ),
                      ],
                    ),
                  ),
                  // CARD
                  Card(
                    margin: EdgeInsets.all(16.0),
                    elevation: 6.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        listTile2,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
