import 'notifications.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:reparosya/user/ui/perfilBody.dart';
import 'package:reparosya/general/ui/homeBody.dart';
import 'package:reparosya/general/ui/components.dart';
import 'package:reparosya/marketplace/messagingBody.dart';
import 'package:reparosya/general/ui/myProjectsBody.dart';

class Home extends StatefulWidget{
  final int currentTab;

  Home({Key key, this.currentTab = 2}) : super(key : key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int myIndex;

  @override
  initState(){
    super.initState();
    myIndex = widget.currentTab;
  }

  _selectTab(int index){
    setState(() {
      this.myIndex = index;
    });
  }

  Widget _pageSelector(int index){
    switch(index){
      case 0:
        return MyProjects();
      case 1:
        return MessagingBody();
      case 2:
        return HomeBody();
      case 3:
        return NotificationsBody();
      case 4:
        return PerfilBody();
      default:
        return Center(child: Text("Pagina $myIndex"));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: _pageSelector(myIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColorLight,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 22,
        elevation: 0,
        backgroundColor: Colors.transparent,
        selectedIconTheme: IconThemeData(size: 28),
        //unselectedIconColor: Theme.of(context).focusColor.withOpacity(1),
        currentIndex: widget.currentTab,
        onTap: (int i){
          this._selectTab(i);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.next_week),
            title: new Container(height: 0.0,)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: new Container(height: 0.0,)
          ),
          BottomNavigationBarItem(
            title: new Container(height: 5.0,),
            icon: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Theme.of(context).hintColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(50)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).accentColor.withOpacity(0.4), blurRadius: 40, offset: Offset(0,15)
                  ),
                  BoxShadow(
                    color: Theme.of(context).accentColor.withOpacity(0.4), blurRadius: 13, offset: Offset(0,3)
                  ),
                ],
              ),
              child: new Icon(Icons.home, color:Colors.white,)
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: new Container(height: 0.0,)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: new Container(height: 0.0,)
          ),
        ]

      ),
    );
  }
}