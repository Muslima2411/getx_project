import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../details_page/details_page.dart';
import 'home_page_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var homePageController = Get.find<HomePageController>();

    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text("hello".tr),
          ),
          body: homePageController.isLoading.value
              ? ListView.builder(
                  itemCount: homePageController.productList.length,
                  itemBuilder: (_, index) {
                    return Slidable(
                      key: ValueKey(index),
                      startActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        dismissible: DismissiblePane(onDismissed: () {
                          homePageController.deleteData((index + 2).toString());
                        }),
                        children: [
                          SlidableAction(
                            onPressed: (_) {
                              homePageController
                                  .deleteData((index + 2).toString());
                            },
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => DetailsPage(
                                      product:
                                          homePageController.productList[index],
                                      id: (index + 2).toString(),
                                    )),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: homePageController.colorOfContainer(),
                            shape: BoxShape
                                .rectangle, // Ensure the container has a rectangular shape
                            borderRadius: BorderRadius.circular(
                                25), // Set the border radius to half the height
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 12),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 8),
                          width: double.infinity,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "${homePageController.productList[index].title} - \$${homePageController.productList[index].price}",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  "Brand : ${homePageController.productList[index].brand}"),
                              Text(
                                homePageController
                                    .productList[index].description,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
          floatingActionButton: Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  homePageController.switchTheme();
                },
                child: const Icon(Icons.lightbulb_outline_rounded),
              ),
              const SizedBox(
                width: 8,
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => DetailsPage()));
                },
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ));
  }
}
