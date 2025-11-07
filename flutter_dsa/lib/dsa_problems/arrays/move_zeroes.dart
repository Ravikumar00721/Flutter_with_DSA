import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User{
  String name;
  bool isActive;

  User( this.name, this.isActive);
}

class MoveInactiveUsers extends StatefulWidget {
  const MoveInactiveUsers({super.key});

  @override
  State<MoveInactiveUsers> createState() => _MoveInactiveUsersState();
}

class _MoveInactiveUsersState extends State<MoveInactiveUsers>
{

  List<User> users= [
    User("Alice", true),
    User("Bob", false),
    User("Charlie", true),
    User("David", false),
    User("Eve", true),
  ];

  void moveInactiveUsers(List<User> users)
  {
    int activeIndex=0;

    for (int i = 0; i < users.length; i++) {
      if (users[i].isActive) {
        users[activeIndex++] = users[i];
      }
    }

    while(activeIndex<users.length)
      {
        users[activeIndex++]=User("Inactive user",false);
      }
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Move Inactive Users"),
      ),
      body: Padding(padding: EdgeInsets.all(16),

      child:Column(
        children: [
          SizedBox(
            height: 500,
            child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context,index){
                  return ListTile(
                    leading: Icon(users[index].isActive? Icons.check_circle: Icons.cancel,
                      color: users[index].isActive?Colors.green:Colors.red,),
                    title: Text(users[index].name),
                    subtitle: Text(users[index].isActive?"Active":"Inactive"),
                  );
                }),
          ),
          SizedBox(height: 16,),
          ElevatedButton(
            onPressed: () {
              setState(() {
                moveInactiveUsers(users);
              });
            },
            child: const Text("Move"),
          )
        ],
      ),),
    );
  }
}