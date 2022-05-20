import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_jtj/config/size_config.dart';
import 'package:smart_jtj/controller/auth_controller.dart';
import 'package:smart_jtj/provider/base_view.dart';
import 'package:smart_jtj/src/screens/home_screen/components/weather_container.dart';
import 'package:smart_jtj/src/screens/menu_screen/menu_screen.dart';
import 'package:smart_jtj/src/widgets/custom_bottom_nav_bar.dart';
import 'package:smart_jtj/view/home_screen_view_model.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home-screen';
  final String email;

  const HomeScreen({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BaseView<HomeScreenViewModel>(
      onModelReady: (model) => {
        model.generateRandomNumber(),
      },
      builder: (context, model, child) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: getProportionateScreenHeight(60),
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.black),
              title: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xffdadada),
                        borderRadius: BorderRadius.all(
                          Radius.elliptical(45, 45),
                        ),
                      ),
                      child: IconButton(
                        splashRadius: 25,
                        icon: const Icon(
                          FontAwesomeIcons.solidUser,
                          color: Colors.amber,
                        ),
                        onPressed: () {
                          AuthController.instance.logOut();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              bottom: PreferredSize(
                child: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Colors.white.withOpacity(0.3),
                  indicatorColor: const Color(0xFF464646),
                  tabs: [
                    Tab(
                      child: Text(
                        'Control',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    Tab(
                      child: Text(
                        '주방',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    Tab(
                      child: Text(
                        '안방',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ],
                ),
                preferredSize: Size.fromHeight(
                  getProportionateScreenHeight(35),
                ),
              ),
            ),
            drawer: SizedBox(
              width: getProportionateScreenWidth(270),
              child: const Menu(),
            ),
            body: TabBarView(
              children: [
                Body(
                  model: model,
                ),
                Container(
                  child: SingleChildScrollView(
                    child: WeatherContainer(),
                  ),
                ),
                const Center(
                  child: Text('세 번째 탭 내'),
                ),
              ],
            ),
            bottomNavigationBar: CustomBottomNavBar(model: model),
          ),
        );
      },
    );
  }
}
