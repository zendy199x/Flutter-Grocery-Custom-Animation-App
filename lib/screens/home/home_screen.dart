import 'package:flutter/material.dart';
import 'package:grocery_custom_animation/constants.dart';
import 'package:grocery_custom_animation/controllers/home_controller.dart';
import 'package:grocery_custom_animation/models/product.dart';
import 'package:grocery_custom_animation/screens/deatils/details_screen.dart';
import 'package:grocery_custom_animation/screens/home/components/card_short_view.dart';
import 'package:grocery_custom_animation/screens/home/components/cart_details_view.dart';
import 'package:grocery_custom_animation/screens/home/components/header.dart';
import 'package:grocery_custom_animation/screens/home/components/product_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final controller = HomeController();

  void _onVericalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -0.7) {
      controller.changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 12) {
      controller.changeHomeState(HomeState.normal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: const Color(0xFFEAEAEA),
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              return LayoutBuilder(
                builder: (context, BoxConstraints constraints) {
                  return Stack(
                    children: [
                      AnimatedPositioned(
                        duration: panelTransition,
                        top: controller.homeState == HomeState.normal
                            ? headerHeight
                            : -(constraints.maxHeight -
                                cartBarHeight * 2 -
                                headerHeight),
                        left: 0,
                        right: 0,
                        height: constraints.maxHeight -
                            headerHeight -
                            cartBarHeight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(defaultPadding * 1.5),
                              bottomRight:
                                  Radius.circular(defaultPadding * 1.5),
                            ),
                          ),
                          child: GridView.builder(
                            itemCount: demoProducts.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                              mainAxisSpacing: defaultPadding,
                              crossAxisSpacing: defaultPadding,
                            ),
                            itemBuilder: (context, index) => ProductCard(
                              product: demoProducts[index],
                              press: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration: const Duration(
                                      milliseconds: 400,
                                    ),
                                    reverseTransitionDuration: const Duration(
                                      milliseconds: 400,
                                    ),
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        FadeTransition(
                                      opacity: animation,
                                      child: DetailsScreen(
                                        product: demoProducts[index],
                                        onProductAdd: () {
                                          controller.addProductToCart(
                                            demoProducts[index],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      // Card Panel
                      AnimatedPositioned(
                        duration: panelTransition,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        height: controller.homeState == HomeState.normal
                            ? cartBarHeight
                            : (constraints.maxHeight - cartBarHeight),
                        child: GestureDetector(
                          onVerticalDragUpdate: _onVericalGesture,
                          child: Container(
                            padding: const EdgeInsets.all(defaultPadding),
                            color: const Color(0xFFEAEAEA),
                            alignment: Alignment.topLeft,
                            child: AnimatedSwitcher(
                              duration: panelTransition,
                              child: controller.homeState == HomeState.normal
                                  ? CardShortView(controller: controller)
                                  : CartDetailView(controller: controller),
                            ),
                          ),
                        ),
                      ),
                      // Header
                      AnimatedPositioned(
                        duration: panelTransition,
                        top: controller.homeState == HomeState.normal
                            ? 0
                            : -headerHeight,
                        left: 0,
                        right: 0,
                        height: headerHeight,
                        child: const HomeHeader(),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
