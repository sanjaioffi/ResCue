import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rescue/constants/app_colors.dart';
import 'package:rescue/getx/user_controller.dart';

class ProfileScreenTile extends StatelessWidget {
  final IconData? tileIcon;

  final String title;
  final String subtitle;

  final function;

  const ProfileScreenTile(
      {super.key,
      required this.tileIcon,
      required this.title,
      required this.subtitle,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        // height: 50,
        width: 400,
        margin: EdgeInsets.only(bottom: 2),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[300]!,
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: Colors.grey.withOpacity(.2),
              child: Icon(
                tileIcon,
                size: 25.0,
                color: AppColor.whatsAppTealGreen,
              ),
            ),
            // const Spacer(),
            SizedBox(
              width: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  //
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
              color: Colors.grey[500],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreenImage extends StatelessWidget {
  const ProfileScreenImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              height: 125,
              width: 140,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300]!,
                  width: 1,
                ),
                // shape: BoxShape.circle,
                // backgroundBlendMode: BlendMode.darken,
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.greyithOpacity(0.5),
                //     spreadRadius: 1,
                //     blurRadius: 2,
                //     offset: const Offset(0, 2),
                //   ),
                // ],
                borderRadius: BorderRadius.circular(70.0),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://picsum.photos/250?image=342",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 5,
                    right: 5,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.grey[300],
                        ),
                        child: const Icon(
                          Icons.add_photo_alternate_outlined,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(Get.find<UserController>().userData['username'] ?? "User Name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            // phone number
            // Text(
            //   Get.find<UserController>().userData['phoneNumbers'][0] ??
            //       "phone number",
            //   style: TextStyle(
            //     fontSize: 15,
            //     color: Colors.grey[500],
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
