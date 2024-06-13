import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'home.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.changeLang});
  final ValueChanged<int> changeLang;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.profile),
      ),
      drawer:  Drawer(child: CustomDrawer(changeLang: changeLang,)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          Image.network(
            "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg",
            width: 250,
            height: 250,
          ),
          Text("${AppLocalizations.of(context)!.name}: George"),
          Text("${AppLocalizations.of(context)!.lastName}: Smith"),
          Text("${AppLocalizations.of(context)!.phone}: +1256145256"),
        ],
      ),
    );
  }
}
