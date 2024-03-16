import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samagam_hack/home.dart';
import 'package:samagam_hack/home/msg_cleaners.dart';
import 'package:samagam_hack/services/user-type-db.dart';

import 'authenticate/authenticate.dart';
import 'home/homescreen.dart';
import 'home/worker.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    if (user == null) {
      return Authenticate();
    } else {
      // Listen to the userType stream
      return MyHomePage();
    }
  }
}
