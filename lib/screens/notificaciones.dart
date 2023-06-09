// Dart 2.17.0
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
//inicio

class notificaciones extends StatefulWidget {
  const notificaciones({Key? key}) : super(key: key);

  @override
  State<notificaciones> createState() => _notificaciones();
}

class _notificaciones extends State<notificaciones> {
  final itemList = [
    {
      'Title': 'Pago_exitoso',
      'des': 'Este es un mensaje........',
    },
    {
      'Title': 'Pago_fallido',
      'des': 'Este es un mensaje.....',
    },
    {
      'Title': 'Pago_exitoso',
      'des': 'Este es un mensaje........',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones'),
        centerTitle: true,
      ),
      body: (itemList.isEmpty)
          ? RefreshIndicator(
            onRefresh: _refresh,
            child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.hourglass_bottom_rounded, color: Colors.grey),
                    SizedBox(height: 10.0),
                    Text(
                      'No tienes notificaciones.....',
                      style: TextStyle(fontSize: 20.0, color: Colors.grey),
                    )
                  ],
                ),
              ),
          )
          : ListView.builder(
              itemCount: itemList.length, 
              itemBuilder: (context, index) {
                final item = itemList[index];
                return Padding(
                  padding: (index == 0)
                      ? const EdgeInsets.symmetric(vertical: 20.0)
                      : const EdgeInsets.only(bottom: 20.0),
                  child: Slidable(
                    key: Key('$item'),
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        
                        SlidableAction(
                          onPressed: (context) {
                            setState(() {
                              itemList.removeAt(index);
                            });
                          },
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                        )
                      ],
                    ),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        
                        SlidableAction(
                          onPressed: (context) {
                            setState(() {
                              itemList.removeAt(index);
                            });
                          },
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                        )
                      ],
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white10,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 1.0,
                                spreadRadius: 1.0,
                                color: Colors.grey[400]!)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                           
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                item['Title']!,
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                item['des']!,
                                style: const TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
    );
  }
  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 0));
  }
}
/*void main() => runApp(notificaciones());

class notificaciones extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //title: 'material app',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Notificaciones'),
            ),
            body: Slidable(
              key: const ValueKey(0),
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(onDismissed: () {}),
                children: [
                  SlidableAction(
                    onPressed: (_){},
                    backgroundColor: const Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: (_){},
                    backgroundColor: Color.fromARGB(255, 73, 112, 254),
                    foregroundColor: Colors.white,
                    icon: Icons.share,
                    label: 'Share',
                  ),
                ],
              ),
                child: const ListTile(
                  leading: Icon(Icons.mail_outline, color: Colors.blue),
                  title: Text('Compra_exitosa'),
                  subtitle: Text('Sin_leer'),
                  trailing: Icon(Icons.keyboard_arrow_left_rounded),
                  ),

                
            )
            
          )
        );
  }
}*/

