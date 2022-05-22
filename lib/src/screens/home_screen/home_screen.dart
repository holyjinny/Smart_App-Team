import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_jtj/config/size_config.dart';
import 'package:smart_jtj/provider/base_view.dart';
import 'package:smart_jtj/src/screens/home_screen/components/chart_container.dart';
import 'package:smart_jtj/src/screens/home_screen/components/weather_container.dart';
import 'package:smart_jtj/src/screens/setting_screen/setting_screen.dart';
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
                    Image.asset(
                      'assets/images/jtj_logo.png',
                      width: 60,
                      height: 60,
                    ),
                    Text(
                      'SMART JTJ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
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
                          Navigator.of(context)
                              .pushNamed(SettingScreen.routeName);
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
                        'Dashboard',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Function',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ],
                ),
                preferredSize: Size.fromHeight(
                  getProportionateScreenHeight(35),
                ),
              ),
            ),
            body: TabBarView(
              children: [
                Body(
                  model: model,
                ),
                Container(
                  child: SingleChildScrollView(
                    child: ChartContainer(),
                  ),
                ),
                Container(
                  child: SingleChildScrollView(
                    child: WeatherContainer(),
                  ),
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
