import 'dart:ui';

import 'package:flutter/material.dart';

enum kLocale { greek, english }

enum kTheme { light, dark }

/// GREEK LANGUAGE TEXT

String kCssTextGR =
    'Η CSS είναι μια γλώσσα υπολογιστή που χρησιμοποιείται για τον έλεγχο της εμφάνισης ενός εγγράφου που έχει γραφτεί με μια γλώσσα σήμανσης.';
String kHtmlTextGr =
    'Η HTML5 είναι γλώσσα σήμανσης για τον Παγκόσμιο Ιστό. Είναι η πέμπτη και τελευταία -ως σήμερα- έκδοση της HTML. ';
String kJavascriptTextGr =
    'Η JavaScript είναι διερμηνευμένη γλώσσα προγραμματισμού για ηλεκτρονικούς υπολογιστές.';
String kjQueryTextGr =
    'Η jQuery είναι μια βιβλιοθήκη JavaScript σχεδιασμένη να απλοποιήσει την υλοποίηση σεναρίων στην πλευρά του πελάτη της HTML και υποστηρίζει πολλαπλούς φυλλομετρητές Ιστού. ';
String kReactTextGr =
    'Μια JavaScript βιβλιοθήκη για τη δημιουργία user interfaces';
String kMongoDbTextGr =
    "Το MongoDB (από το 'humongous') είναι μια βάση δεδομένων με βάση τις βάσεις δεδομένων που χρησιμοποιείται ως εναλλακτική λύση για την MySQL.";
String kNodeJsTextGr =
    'Το Node.js είναι μια πλατφόρμα ανάπτυξης λογισμικού χτισμένη σε περιβάλλον Javascript. Στόχος του Node είναι να παρέχει ένα εύκολο τρόπο δημιουργίας κλιμακωτών διαδικτυακών εφαρμογών.';
String kExpressJsGr =
    'Το Express είναι ένα framework τού Node.js που παρέχει ένα ισχυρό σύνολο λειτουργιών για εφαρμογές Ιστού και για κινητές συσκευές.';
String kPostgresSqlTextGr =
    'Η PostgreSQL είναι μια σχεσιακή βάση δεδομένων ανοικτού κώδικα με πολλές δυνατότητες';
String kFlutterTextGr =
    'Το Flutter είναι ένα κιτ εργαλείων διεπαφής χρήστη της Google για τη δημιουργία όμορφων, native εφαρμογών για κινητά, ιστοσελίδες και εφαρμογές από μία μόνο βάση κώδικα';
String kDotnetTextGr =
    'Το NET είναι μια πλατφόρμα προγραμματιστών με εργαλεία και βιβλιοθήκες για τη δημιουργία οποιουδήποτε τύπου εφαρμογής, συμπεριλαμβανομένων ιστοσελίδων, εφαρμογών κινητού, επιτραπέζιου υπολογιστή, IoT, cloud και μικροϋπηρεσιών';
String kJavaTextGr =
    'Η Java είναι μια αντικειμενοστρεφής γλώσσα προγραμματισμού που σχεδιάστηκε από την εταιρεία πληροφορικής Sun Microsystems.';
String kPhotoshopTextGr =
    'To Adobe Photoshop, ή απλά Photoshop, είναι πρόγραμμα επεξεργασίας γραφικών που αναπτύχθηκε και κυκλοφόρησε από την Adobe Systems.';
String kIllustratorTextGr =
    'Το Adobe Illustrator είναι ένας επεξεργαστής διανυσματικών γραφικών που αναπτύχθηκε και διατέθηκε στην αγορά από την Adobe Inc.';
String kMenuHomeGr = 'Αρχική';
String kMenuPortfolioGr = 'Πορτφόλιο';
String kMenuSkillsGr = 'Γνώσεις';
String kMenuContactGr = 'Επικοινωνία';

/// ENGLISH LANGUAGE TEXT

String kCssTextEn =
    'Cascading Style Sheets (CSS) is a style sheet language used for describing the presentation of a document written in a markup language like HTML';
String kHtmlTextEn =
    'HTML5 is a markup language used for structuring and presenting content on the World Wide Web.';
String kJavascriptTextEn =
    'JavaScript is the programming language of HTML and the Web.';
String kjQueryTextEn =
    '''Query is a fast, small, and feature-rich JavaScript library. 
It makes things like HTML document traversal and manipulation, event 
handling, animation, and Ajax much simpler with an easy-to-use API that 
works across a multitude of browsers.''';
String kReactTextEn = 'A JavaScript library for building user interfaces';
String kMongoDbTextEn =
    'MongoDB is a cross-platform document-oriented database program. Classified as a NoSQL database program, MongoDB uses JSON-like documents with optional schemas. MongoDB is developed by MongoDB Inc. and licensed under the Server Side Public License (SSPL).';
String kNodeJsTextEn =
    'Node.js is an open-source, cross-platform, JavaScript runtime environment that executes JavaScript code outside a web browser. ';
String kExpressJsEn =
    'Express is a minimal and flexible Node.js web application framework that provides a robust set of features for web and mobile applications.';
String kPostgresSqlTextEn =
    'PostgreSQL also known as Postgres, is a free and open-source relational database management system (RDBMS) emphasizing extensibility and SQL compliance.';
String kFlutterTextEn =
    "Flutter is Google's UI toolkit for crafting beautiful, natively compiled applications for mobile, web, and desktop from a single codebase";
String kDotnetTextEn =
    'NET is a developer platform with tools and libraries for building any type of app, including web, mobile, desktop, games, IoT, cloud, and microservices';
String kJavaTextEn =
    'Java is a general-purpose programming language that is class-based, object-oriented, and designed to have as few implementation dependencies as possible.';
String kPhotoshopTextEn =
    'Adobe Photoshop is a raster graphics editor developed and published by Adobe Inc. for Windows and macOS. ';
String kIllustratorTextEn =
    'Adobe Illustrator is a vector graphics editor developed and marketed by Adobe Inc.';
String kMenuHomeEn = 'Home';
String kMenuPortfolioEn = 'Portfolio';
String kMenuSkillsEn = 'Skills';
String kMenuContactEn = 'Contact';

// Color switches
// colors: [
//             Color(0xffb088f9),
//             Color(0xffda9ff9),
//             Color(0xff98acf8),
//             Color(0xffbedcfa)
//           ],
Animatable<Color> gradientColorOne = TweenSequence<Color>([
  TweenSequenceItem(
    weight: 1.0,
    tween: ColorTween(
      // Light bottom
      begin: Color(0xff51adcf),
      // Dark bottom
      end: Color(0xff0f3057),
    ),
  ),
]);
Animatable<Color> gradientColorTwo = TweenSequence<Color>([
  TweenSequenceItem(
    weight: 1.0,
    tween: ColorTween(
      // Light theme sky
      begin: const Color(0xffb9fffc),
      // Dark theme sky
      end: const Color(0xff7579e7),
    ),
  ),
]);

Animatable<Color> textColorSwitches = TweenSequence<Color>([
  TweenSequenceItem(
    weight: 1.0,
    tween: ColorTween(
      begin: const Color(0xff0278ae),
      end: const Color(0xffe8ffc1),
    ),
  ),
]);
Animatable<Color> skillBadgeSwitches = TweenSequence<Color>([
  TweenSequenceItem(
    weight: 1.0,
    tween: ColorTween(
      begin: Colors.white,
      end: Colors.black,
    ),
  ),
]);
