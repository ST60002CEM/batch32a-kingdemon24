import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_assignment/app/constants/api_endpoint.dart';
import 'package:final_assignment/features/home/presentation/view/drawer/drawer_view.dart';
import 'package:final_assignment/features/home/presentation/viewmodel/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductView extends ConsumerStatefulWidget {
  const ProductView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductViewState();
}

class _ProductViewState extends ConsumerState<ProductView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productViewModelProvider);

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification &&
            _scrollController.position.extentAfter == 0) {
          ref.read(productViewModelProvider.notifier).getProducts();
        }
        return true;
      },
      child: Scaffold(
        body: Column(
          children: [
            AppBar(
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lets take some Art',
                    style: TextStyle(
                      color: Color.fromARGB(255, 222, 15, 15),
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Biraj Bogati1',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              actions: [
                Stack(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart_rounded,
                        color: Colors.black,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Center(
                          child: Text(
                            '2',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 200,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason) {
                            // Optional: Handle carousel page change
                          },
                        ),
                        items: [
                          'https://cdn.sanity.io/images/cxgd3urn/production/f96553884665445a52af52378d58e12dc39c8369-960x1212.jpg?rect=0,318,960,576&w=1200&h=720&q=85&fit=crop&auto=format',
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR02_TSB3pYaowHAFZKbLP48ad1fsLk15zdXw&s',
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbCDpbcowEceRiTAt5-q0LBrUGCsJA9Mq2cQ&s',
                        ].map((imageUrl) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: const BoxDecoration(
                                  color: Colors.amber,
                                ),
                                child: Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.75, // Adjust this as needed
                        ),
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          final product = state.products[index];
                          return Card(
                            child: Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    ...[
                                      SizedBox(
                                        width: 88,
                                        child: AspectRatio(
                                          aspectRatio: 0.88,
                                          child: Container(
                                            padding: const EdgeInsets.all(0),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFF5F6F9),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Image.network(
                                                ApiEndpoints.productImage +
                                                    product.productImage),
                                          ),
                                        ),
                                      ),
                                      // Expanded(
                                      //   child: ClipRRect(
                                      //     borderRadius: const BorderRadius.only(
                                      //       topLeft: Radius.circular(16),
                                      //       topRight: Radius.circular(16),
                                      //     ),
                                      //     child: Image.network(
                                      //         '${ApiEndpoints.productImage}${state.products[index].productImage}'),
                                      //   ),
                                      // ),
                                      Text(
                                        ' ${product.productName}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        ' ${product.productCategory}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        '${product.productPrice}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      if (state.isLoading)
                        const Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        drawer: const DrawerView(),
      ),
    );
  }
}
// //   @override
// //   Widget build(BuildContext context) {
// //     final state = ref.watch(productViewModelProvider);

// //     return NotificationListener(
// //       onNotification: (notification) {
// //         if (notification is ScrollEndNotification) {
// //           // Scroll garda feri last ma ho ki haina bhanera check garne ani data call garne
// //           if (_scrollController.position.extentAfter == 0) {
// //             // Data fetch gara api bata
// //             ref.read(productViewModelProvider.notifier).getProducts();
// //           }
// //         }
// //         return true;
// //       },
// //       child: Scaffold(
// //         appBar: AppBar(
// //           title: const Text('Products '),
// //           actions: [
// //             TextButton.icon(
// //               onPressed: () {
// //                 ref.read(productViewModelProvider.notifier).resetState();
// //               },
// //               icon: const Icon(Icons.refresh),
// //               label: const Text('Refresh'),
// //             ),
// //           ],
// //         ),
// //         body: RefreshIndicator(
// //           // Yo chai pull to refresh ko lagi ho
// //           color: Colors.green,
// //           onRefresh: () async {
// //             ref.read(productViewModelProvider.notifier).resetState();
// //           },
// //           child: Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Column(
// //               children: [
// //                 Expanded(
// //                   child: ListView.separated(
// //                     separatorBuilder: (context, index) => const Divider(),
// //                     controller: _scrollController,
// //                     itemCount: state.products.length,
// //                     physics: const AlwaysScrollableScrollPhysics(),
// //                     itemBuilder: (context, index) {
// //                       final products = state.products[index];

// //                       return Card(
// //                         child: Padding(
// //                           padding: const EdgeInsets.all(8.0),
// //                           child: Column(
// //                             children: [
// //                               // Text(
// //                               //   products.productId.toString(),
// //                               //   style: const TextStyle(
// //                               //     fontSize: 20,
// //                               //     fontWeight: FontWeight.bold,
// //                               //   ),
// //                               // ),
// //                               DecoratedBox(
// //                                 decoration: BoxDecoration(
// //                                   color: Colors.white,
// //                                   border: Border.all(),
// //                                   borderRadius: BorderRadius.circular(20),
// //                                 ),
// //                                 child: Image.network(
// //                                   // products.productImage,
// //                                   'http://10.12.20.1:5000/products/${products.productImage}',
// //                                   height: 200,
// //                                   width: 200,
// //                                   loadingBuilder: (BuildContext context,
// //                                       Widget child,
// //                                       ImageChunkEvent? loadingProgress) {
// //                                     if (loadingProgress == null) {
// //                                       return child;
// //                                     } else if (loadingProgress
// //                                             .expectedTotalBytes !=
// //                                         null) {
// //                                       return Center(
// //                                         child: CircularProgressIndicator(
// //                                           color: Colors.red,
// //                                           value: loadingProgress
// //                                                   .cumulativeBytesLoaded /
// //                                               loadingProgress
// //                                                   .expectedTotalBytes!,
// //                                         ),
// //                                       );
// //                                     } else {
// //                                       // If total bytes are unknown, you may want to handle it differently
// //                                       return const Center(
// //                                         child: CircularProgressIndicator(
// //                                             color: Colors.red),
// //                                       );
// //                                     }
// //                                   },
// //                                   errorBuilder: (BuildContext context,
// //                                       Object error, StackTrace? stackTrace) {
// //                                     return const Center(
// //                                       child: Text('Failed to load image'),
// //                                     );
// //                                   },
// //                                 ),
// //                               ),
// //                               Text(
// //                                 products.productName,
// //                                 textAlign: TextAlign.center,
// //                                 style: const TextStyle(
// //                                   fontSize: 20,
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       );
// //                     },
// //                   ),
// //                 ),
// //                 // Data load huda feri progress bar dekhaune natra banda garne
// //                 if (state.isLoading)
// //                   const CircularProgressIndicator(color: Colors.red),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:final_assignment/features/home/presentation/viewmodel/product_viewmodel.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class ProductView extends ConsumerStatefulWidget {
//   const ProductView({super.key});
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _ProductViewState();
// }

// class _ProductViewState extends ConsumerState<ProductView> {
//   final ScrollController _scrollController = ScrollController();
//   String? productId;

//   @override
//   void initState() {
//     super.initState();
//     // _loadProductId();
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final state = ref.watch(productViewModelProvider);

//     return NotificationListener(
//       onNotification: (notification) {
//         if (notification is ScrollEndNotification) {
//           if (_scrollController.position.extentAfter == 0) {
//             ref.read(productViewModelProvider.notifier).resetState();
//           }
//         }
//         return true;
//       },
//       child: Scaffold(
//         backgroundColor: Colors.orange[500],
//         appBar: AppBar(
//           backgroundColor: Colors.yellow[400],
//           title: const Text('product Data'),
//           actions: [
//             TextButton.icon(
//               onPressed: () {
//                 ref.read(productViewModelProvider.notifier).resetState();
//               },
//               icon: const Icon(Icons.refresh),
//               label: const Text('Refresh'),
//             ),
//           ],
//         ),
//         body: RefreshIndicator(
//           color: Colors.green,
//           backgroundColor: Colors.amberAccent,
//           onRefresh: () async {
//             ref.read(productViewModelProvider.notifier).resetState();
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     controller: _scrollController,
//                     itemCount: state.products.length,
//                     physics: const AlwaysScrollableScrollPhysics(),
//                     itemBuilder: (context, index) {
//                       final product = state.products[index];

//                       return Card(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             children: [
//                               ...[
//                                 // Expanded(
//                                 //   child: ClipRRect(
//                                 //     borderRadius: const BorderRadius.only(
//                                 //       topLeft: Radius.circular(16),
//                                 //       topRight: Radius.circular(16),
//                                 //     ),
//                                 //     child: Image.network(
//                                 //         '${ApiEndpoints.productImage}${state.products[index].productImage}'),
//                                 //   ),
//                                 // ),
//                                 Text(
//                                   ' ${product.productName}',
//                                   style: const TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 Text(
//                                   ' ${product.productCategory}',
//                                   style: const TextStyle(
//                                     fontSize: 20,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 Text(
//                                   '${product.productPrice}',
//                                   style: const TextStyle(
//                                     fontSize: 20,
//                                   ),
//                                 ),
//                               ],
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 if (state.isLoading)
//                   const CircularProgressIndicator(color: Colors.red),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
