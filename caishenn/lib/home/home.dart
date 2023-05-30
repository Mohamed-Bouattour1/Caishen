import 'package:caishenn/agences/agences.dart';
import 'package:caishenn/contact/contact.dart';
import 'package:caishenn/demande/demande.dart';
import 'package:caishenn/home/history/history.dart';
import 'package:caishenn/home/homeAfter.dart';
import 'package:caishenn/home/homeFirst.dart';
import 'package:caishenn/home/languages/language_constants.dart';
import 'package:caishenn/home/settings/settings.dart';
import 'package:caishenn/home/suivi/suivi.dart';
import 'package:caishenn/models/token.dart';
import 'package:caishenn/simulateur/simulateur.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import '../tools/BC.dart';
import '../tools/Colors.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import '../tools/appbarclip.dart';

import '../tools/loadingScreen.dart';
import '../tools/utilities.dart';

class home extends StatefulWidget {
  final Token token;
  home({super.key, required this.token});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final _advancedDrawerController = AdvancedDrawerController();
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return _isLoading
        ? loading_screen(
            height: size.height,
            width: size.width,
          )

        /* Container(
      color: Colors.white,
      height: size.height,
      width: size.width,
      child: Center(child: Container(
        height: size.height*0.2,
        child: Image.asset('assets/images/logo_mobile.png').animate().fade(duration: 500.ms)
  .scale(delay: 500.ms))),
    ) */
        : AdvancedDrawer(
            backdrop: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: gradient,
                ),
              ),
            ),
            controller: _advancedDrawerController,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 300),
            animateChildDecoration: true,
            rtlOpening: false,
            // openScale: 1.0,
            disabledGestures: false,
            childDecoration: const BoxDecoration(
              // NOTICE: Uncomment if you want to add shadow behind the page.
              // Keep in mind that it may cause animation jerks.
              // boxShadow: <BoxShadow>[
              //   BoxShadow(
              //     color: Colors.black12,
              //     blurRadius: 0.0,
              //   ),
              // ],
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            drawer: SafeArea(
              child: Container(
                child: ListTileTheme(
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: size.height * 0.4,
                        height: size.height * 0.25,
                        margin: EdgeInsets.only(
                          bottom: size.height * 0.05,
                        ),
                        decoration: BoxDecoration(
                            //color: Colors.black26,
                            ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/images/logo_caishen.png',
                            ),
                            Container(
                              height: 1.2,
                              width: size.width * 0.4,
                              color: Colors.white,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person,
                                  color: bleufonce,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  child: Text(
                                    "${widget.token.prenom} ${widget.token.nom}",
                                    style: TextStyle(
                                        color: bleufonce, fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 1.2,
                              width: size.width * 0.4,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        title: Text(translation(context).acceuil),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.request_quote,
                        ),
                        title: Text(translation(context).faireUneDemande),
                        onTap: () {
                          if (widget.token.status == "Libre") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => demande(
                                        token: widget.token,
                                      )));
                          } else {
                            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackbar("Désolé", "Vous avez déja une demande en cours ou en attente"));
                          }
                          
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.follow_the_signs,
                        ),
                        title: Text(translation(context).suivreMesDemandes),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => suivi(
                                        token: widget.token,
                                      )));
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.cast_for_education,
                        ),
                        title: Text(translation(context).suivreMesCrdits),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.train,
                        ),
                        title: Text(translation(context).suivreMesEchances),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.home,
                        ),
                        title: Text(translation(context).rseau),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      Spacer(),
                      DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white54,
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: size.height * 0.02,
                          ),
                          child: Text('Terms of Service | Privacy Policy'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            child: Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(
                  size: 35, //change size on your need
                  color: bleufonce, //change color on your need
                ),
                backgroundColor: bleuclaire2,
                toolbarHeight: size.height * 0.12,
                elevation: 0,
                shape: CustomAppBarShape(multi: 0.05),
                centerTitle: true,
                title: SizedBox(
                    width: size.width * 0.40,
                    height: size.height * 0.10,
                    child: Image.asset("assets/images/logo_caishen.png")),
                leading: IconButton(
                  onPressed: _handleMenuButtonPressed,
                  icon: ValueListenableBuilder<AdvancedDrawerValue>(
                    valueListenable: _advancedDrawerController,
                    builder: (_, value, __) {
                      return AnimatedSwitcher(
                        duration: Duration(milliseconds: 250),
                        child: Icon(
                          value.visible ? Icons.clear : Icons.menu,
                          key: ValueKey<bool>(value.visible),
                        ),
                      );
                    },
                  ),
                ),
                actions: [
                  Icon(
                    Icons.notifications_rounded,
                    color: jaune,
                    size: 35,
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                ],
              ),
              /* AppBar(
          iconTheme: IconThemeData(
            size: 35, //change size on your need
            color: bleufonce, //change color on your need
          ),
          elevation: 0,
          toolbarHeight: size.height * 0.12,
          backgroundColor: Colors.grey.shade100,
          centerTitle: true,
          title: SizedBox(
              width: size.width * 0.40,
              height: size.height * 0.10,
              child: Image.asset("assets/images/logo_caishen.png")),
          actions: [
            Icon(
              Icons.notifications_rounded,
              color: jaune,
              size: 35,
            ),
          ],
        ), */
              body: Stack(children: [
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.03),
                  child: Container(
                    width: size.width,
                    height: size.height,
                    child: homeFirst(token: widget.token),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: ClipPath(
                      clipper: Clippbot(),
                      child: Container(
                        width: size.width,
                        height: size.height * 0.1,
                        decoration: BoxDecoration(color: bleufonce
                            /* gradient: LinearGradient(
                      colors: gradient,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                    ), */
                            ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              history(token: widget.token)));
                                },
                                icon: Icon(
                                  Icons.history,
                                  size: 30,
                                  color: Colors.white,
                                )),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => agences()));
                                },
                                icon: Icon(
                                  Icons.location_on,
                                  size: 30,
                                  color: Colors.white,
                                )),
                            SizedBox(
                              width: size.width * 0.2,
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => contact()));
                                },
                                icon: Icon(
                                  Icons.contact_phone,
                                  size: 30,
                                  color: Colors.white,
                                )),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => settingsPage(
                                              token: widget.token,
                                            )),
                                  );
                                },
                                icon: Icon(
                                  Icons.settings,
                                  size: 30,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      )),
                ),
                Positioned(
                  top: size.height * 0.71,
                  left: size.width * 0.45,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => simulateur(
                                  token: widget.token,
                                )),
                      );
                    },
                    child: Container(
                      height: size.height * 0.15,
                      width: size.width * 0.15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: GradientBoxBorder(
                          gradient: LinearGradient(colors: gradient),
                          width: 4,
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        size: 50,
                        color: rose,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}




/* Scaffold(
      backgroundColor: const Color.fromRGBO(242,243,248, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 119, 99, 195),
        centerTitle: true,
        title: const Text("Caishenn"),
        shape: const CustomAppBarShape(multi: 0.07),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(13, 11, 109, 1),
                  Color.fromARGB(255, 119, 99, 195)
                ]),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 5.0),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(80),
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      spreadRadius: 1,
                      blurRadius: 10,
                      blurStyle: BlurStyle.outer,
                      offset: const Offset(0, 0),
                    ),
                  ]),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Aide',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: const Color.fromARGB(255, 60, 28, 177),
        onTap: (value) {},
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromARGB(255, 60, 28, 177),
        onPressed: () {},
        label: const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 4.0),
              child: Icon(Icons.add),
            ),
            Text("Nouvelle demande")
          ],
        ),
        
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
    ); */

    /* 
    Drawer(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: gradient),
                    ),
            child: Column(
              children: [
                Container(
                  height: size.height * 0.15,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: bleuclaire5,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.start ,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:15.0),
                        child: Text("Haifa",
                        style: TextStyle(
                          color: rose,
                          fontSize: 30,
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  height: size.height * 0.85,
                  child: ListView(
                    // Important: Remove any padding from the ListView.
                    padding: EdgeInsets.zero,
                    children: [
                      ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.black,
                    ),
                    title:  Text(translation(context).acceuil),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  
                      ListTile(
                        /* leading: Icon(
                          Icons.home,
                        ), */
                        title:  Text(translation(context).faireUneDemande),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        /* leading: Icon(
                          Icons.home,
                        ), */
                        title:  Text(translation(context).suivreMesDemandes),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        /* leading: Icon(
                          Icons.home,
                        ), */
                        title:  Text(translation(context).suivreMesCrdits),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        /* leading: Icon(
                          Icons.train,
                        ), */
                        title:  Text(translation(context).suivreMesEchances),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        /* leading: Icon(
                          Icons.home,
                        ), */
                        title:  Text(translation(context).rseau),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                     
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
     */
