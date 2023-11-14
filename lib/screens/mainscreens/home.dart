// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rescue/app_colors.dart';
// import 'package:rescue/controller/location_controller.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           GetBuilder<LocationController>(builder: ((controller) {
//             return Card(
//               child: ListTile(
//                 leading: const Icon(
//                   Icons.location_on,
//                   color: AppColor.whatsAppTealGreen,
//                 ),
//                 title: controller.isLoading.value
//                     ? const Column(
//                         children: [
//                           SizedBox(
//                               child: LinearProgressIndicator(
//                             backgroundColor: AppColor.whatsAppLightGreen,
//                             color: AppColor.whatsAppTealGreen,
//                           )),
//                           Text(
//                             'Fetching Current Location...',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(fontSize: 15),
//                           ),
//                         ],
//                       )
//                     : Column(
//                         children: [
//                           Text(
//                             controller.locationData.value,
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(fontSize: 20),
//                           ),
//                         ],
//                       ),
//               ),
//             );
//           })),
//         ],
//       ),
//     ));
//   }
// }

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:rescue/controller/location_controller.dart';

import '../../bloc/weather_bloc_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset(
          'assets/1.png',
          width: 300,
          height: 300,
        );
      case >= 300 && < 400:
        return Image.asset(
          'assets/2.png',
          width: 300,
          height: 300,
        );
      case >= 500 && < 600:
        return Image.asset(
          'assets/3.png',
          width: 300,
          height: 300,
        );
      case >= 600 && < 700:
        return Image.asset(
          'assets/4.png',
          width: 300,
          height: 300,
        );
      case >= 700 && < 800:
        return Image.asset(
          'assets/5.png',
          width: 300,
          height: 300,
        );
      case == 800:
        return Image.asset(
          'assets/6.png',
          width: 300,
          height: 300,
        );
      case > 800 && <= 804:
        return Image.asset(
          'assets/7.png',
          width: 300,
          height: 300,
        );
      default:
        return Image.asset(
          'assets/7.png',
          width: 300,
          height: 300,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(builder: ((controller) {
      return controller.isLoading.value
          ? Center(
              child: LottieBuilder.asset(
              'assets/images/loading.json',
              width: 700,
              height: 700,
            ))
          : BlocProvider<WeatherBlocBloc>(
              create: (context) => WeatherBlocBloc()
                ..add(FetchWeather([
                  Get.find<LocationController>().coordinates[0],
                  Get.find<LocationController>().coordinates[1]
                ])),
              child: SafeArea(
                child: Scaffold(
                  extendBodyBehindAppBar: true,
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Align(
                        //   alignment: const AlignmentDirectional(3, -0.3),
                        //   child: Container(
                        //     height: 300,
                        //     width: 300,
                        //     decoration: const BoxDecoration(
                        //         shape: BoxShape.circle,
                        //         color: Colors.deepPurple),
                        //   ),
                        // ),
                        // Align(
                        //   alignment: const AlignmentDirectional(-3, -0.3),
                        //   child: Container(
                        //     height: 300,
                        //     width: 300,
                        //     decoration: const BoxDecoration(
                        //         shape: BoxShape.circle,
                        //         color: Color(0xFF673AB7)),
                        //   ),
                        // ),
                        // Align(
                        //   alignment: const AlignmentDirectional(0, -1.2),
                        //   child: Container(
                        //     height: 300,
                        //     width: 600,
                        //     decoration:
                        //         const BoxDecoration(color: Color(0xFFFFAB40)),
                        //   ),
                        // ),
                        // BackdropFilter(
                        //   filter:
                        //       ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                        //   child: Container(
                        //     decoration:
                        //         const BoxDecoration(color: Colors.transparent),
                        //   ),
                        // ),
                        BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                          builder: (context, state) {
                            if (state is WeatherBlocSuccess) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '📍${Get.find<LocationController>().locationData}',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'Good Morning',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: getWeatherIcon(
                                          state.weather.weatherConditionCode!),
                                    ),
                                    Center(
                                      child: Text(
                                        '${state.weather.temperature!.celsius!.round()}°C',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 55,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        state.weather.weatherMain!
                                            .toUpperCase(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Center(
                                      child: Text(
                                        DateFormat('EEEE dd •')
                                            .add_jm()
                                            .format(state.weather.date!),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/11.png',
                                                scale: 8,
                                              ),
                                              const SizedBox(width: 5),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Sunrise',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  ),
                                                  const SizedBox(height: 3),
                                                  Text(
                                                    DateFormat()
                                                        .add_jm()
                                                        .format(state
                                                            .weather.sunrise!),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/12.png',
                                                scale: 8,
                                              ),
                                              const SizedBox(width: 5),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Sunset',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  ),
                                                  const SizedBox(height: 3),
                                                  Text(
                                                    DateFormat()
                                                        .add_jm()
                                                        .format(state
                                                            .weather.sunset!),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0),
                                      child: Divider(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(children: [
                                          Image.asset(
                                            'assets/13.png',
                                            scale: 8,
                                          ),
                                          const SizedBox(width: 5),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Temp Max',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              const SizedBox(height: 3),
                                              Text(
                                                "${state.weather.tempMax!.celsius!.round()} °C",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ],
                                          )
                                        ]),
                                        Row(children: [
                                          Image.asset(
                                            'assets/14.png',
                                            scale: 8,
                                          ),
                                          const SizedBox(width: 5),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Temp Min',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              const SizedBox(height: 3),
                                              Text(
                                                "${state.weather.tempMin!.celsius!.round()} °C",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ],
                                          )
                                        ])
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ));
    }));
  }
}
