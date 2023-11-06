import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/controllers/api_controller.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class TodoView extends StatelessWidget {
  final ApiController apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#5869ff'),
        title: Text(
          "Todo with Getx Http",
          style: TextStyle(color: HexColor('#ffffff')),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: Obx(
          () => apiController.todo.isEmpty
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: apiController.todo.length,
                  itemBuilder: (context, index) {
                    final todo = apiController.todo[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Article: ${todo.title}'),
                            Text('userId: ${todo.userId}'),
                            Text('id: ${todo.id}'),
                            Text('completed: ${todo.completed}')
                          ],
                          // Tambahkan widget lainnya untuk menampilkan data sesuai kebutuhan
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
