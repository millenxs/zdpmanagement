import 'package:flutter/material.dart';
import 'package:contador_app/shared/widgets/app_bar.dart';
import 'package:contador_app/extensions/context_extensions.dart';
import 'package:contador_app/shared/widgets/drawer_menu.dart';

class SegundaTela extends StatefulWidget {
  const SegundaTela({super.key});

  @override
  State<SegundaTela> createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {
  bool isColumnLayout = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBarPadrao(
        title: context.translateReactive('ZDP Management'),
        onNotificationButtonPressed: () {
          Navigator.pushNamed(context, '/notificacoes');
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: context.translateReactive('Search'),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.view_column),
                  label: Text(context.translateReactive('Column')),
                  onPressed: () {
                    setState(() {
                      isColumnLayout = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),

                ElevatedButton.icon(
                  icon: Icon(Icons.grid_view),
                  label: Text(context.translateReactive('Grid')),
                  onPressed: () {
                    setState(() {
                      isColumnLayout = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child:
                isColumnLayout
                    ? _buildColumnLayout(context)
                    : _buildGridLayout(context),
          ),
        ],
      ),
    );
  }

  Widget _buildColumnLayout(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            title: Text('${context.translateReactive('Item')} ${index + 1}'),
          ),
        );
      },
    );
  }

  Widget _buildGridLayout(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      padding: EdgeInsets.all(8.0),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          child: Center(
            child: Text('${context.translateReactive('Item')} ${index + 1}'),
          ),
        );
      },
    );
  }
}
