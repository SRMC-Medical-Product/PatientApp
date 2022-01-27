/*

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: displayHomeBoxGrid(
                      txtColor: Colors.black,
                      icon: Icons.add,
                      circleClr: kSecondaryColor,
                      title: "Book Now",
                      subTitle: "Make appointments",
                      bgColor: Colors.white,
                      onTap: () => Navigator.push(context, CustomSimplePageRoute(page: const AppScreenController(indexScreen: 1,), routeName: appcontroller))
                      )),
              Expanded(
                  child: displayHomeBoxGrid(
                      txtColor: Colors.white,
                      icon: Icons.medical_services_outlined,
                      circleClr: Colors.white,
                      title: "Visit In",
                      subTitle: "View appointments",
                      bgColor: kPrimaryColor,
                      onTap: () => Navigator.push(context, CustomRightPageRoute(page: const AppointmentController(), routeName: appointmentcontroller)))),
            ],
          ),
          
          mediumCustomSizedBox(context),
  */