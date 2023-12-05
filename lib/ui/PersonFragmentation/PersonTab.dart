import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../auth/login/Login.dart';
import 'ImagePaker.dart';

class PersonTab extends StatelessWidget {
  const PersonTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(onPressed: () async {
      //     GoogleSignIn googleSignIn =GoogleSignIn();
      //     googleSignIn.disconnect();
      //     await FirebaseAuth.instance.signOut();
      //     Navigator.pushNamedAndRemoveUntil(context, Login.routeName, (route) => false);
      //   }, icon: Icon(Icons.logout),),
      // ),
      body:  Scaffold(
        body: Container(color: Colors.white54,
          child: SingleChildScrollView(
            child: Column(
              children: [
const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PickImage()
                  ],
                ),



                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Abdalla Eldaly",
                      style:
                      TextStyle(fontWeight: FontWeight.w900, fontSize: 26),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text("@.com")],
                ),
                const SizedBox(
                  height: 15,
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                        margin:
                        const EdgeInsets.only( bottom: 10),
                        color: Colors.white70,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22)),
                        child: const ListTile(
                          leading: Icon(
                            Icons.privacy_tip_sharp,
                            color: Colors.black54,
                          ),
                          title: Text(
                            'Privacy',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      Card(
                        color: Colors.white70,
                        margin:
                        const EdgeInsets.only( bottom: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22)),
                        child: const ListTile(
                          leading:
                          Icon(Icons.help_outline, color: Colors.black54),
                          title: Text(
                            'Help & Support',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Card(
                        color: Colors.white70,
                        margin:
                        const EdgeInsets.only( bottom: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22)),
                        child: const ListTile(
                          leading: Icon(
                            Icons.settings_applications_outlined,
                            color: Colors.black54,
                          ),
                          title: Text(
                            'Settings',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios_outlined),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Card(
                        color: Colors.white70,
                        margin:
                        const EdgeInsets.only( bottom: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22)),
                        child: const ListTile(
                          leading: Icon(
                            Icons.add_reaction_sharp,
                            color: Colors.black54,
                          ),
                          title: Text(
                            'Invite a Friend',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: (){
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.confirm,
                            text: 'Do you want to logout',
                            confirmBtnText: 'Yes',
                            onConfirmBtnTap: () async {
                              GoogleSignIn googleSignIn =GoogleSignIn();
                              googleSignIn.disconnect();
                              await FirebaseAuth.instance.signOut();
                              Navigator.pushNamedAndRemoveUntil(context, Login.routeName, (route) => false);
                            },
                            cancelBtnText: 'No',
                            confirmBtnColor: Colors.green,
                          );
                        },
                        child: Card(
                          color: Colors.white70,
                          margin:
                          const EdgeInsets.only( bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22)),
                          child:  ListTile(
                            leading: Icon(
                              Icons.logout,
                              color: Colors.black54,
                            ),
                            title: Text(
                              'Logout',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_outlined),
                          ),
                        ),
                      ),],),
                )
              ],
            ),
          ),
        ),
      ));

  }
}
