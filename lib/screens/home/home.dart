import 'package:flutter/cupertino.dart';
import 'package:patientapp/helpers/headers.dart';
import 'package:patientapp/screens/components/searchbox.dart';

class HomePage extends StatefulWidget {
  static const routeName = homepage;

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isAppointment = true;

  //Services
  final List<Map> servicesName = [
    {
      "img":
          "https://firebasestorage.googleapis.com/v0/b/login-demo-148c2.appspot.com/o/garuda%2FImage%208.png?alt=media&token=1996f81e-418d-48e4-aea0-004b010ae6de",
      "name": "Ride"
    },
    {
      "img":
          "https://firebasestorage.googleapis.com/v0/b/login-demo-148c2.appspot.com/o/garuda%2FImage%209.png?alt=media&token=3df797e5-01fb-4467-b7e6-13d6ae110012",
      "name": "Bike"
    },
    {
      "img":
          "https://firebasestorage.googleapis.com/v0/b/login-demo-148c2.appspot.com/o/garuda%2FImage%2010.png?alt=media&token=67fb1833-bbf2-4d80-b175-7bbba42ebbfb",
      "name": "Food"
    },
    {
      "img":
          "https://firebasestorage.googleapis.com/v0/b/login-demo-148c2.appspot.com/o/garuda%2FImage%2012.png?alt=media&token=cda34b0f-b0f7-4690-aa36-3f7083961ccf",
      "name": "Mart"
    },
    {
      "img":
          "https://firebasestorage.googleapis.com/v0/b/login-demo-148c2.appspot.com/o/garuda%2FImage%2011.png?alt=media&token=ae26bda3-6fd8-47d7-885e-98019cb7251a",
      "name": "Groceries"
    },
    {
      "img":
          "https://firebasestorage.googleapis.com/v0/b/login-demo-148c2.appspot.com/o/garuda%2FImage%2013.png?alt=media&token=f07c4550-962c-458f-9408-4c709ccea71d",
      "name": "Payment"
    },
    {
      "img":
          "https://firebasestorage.googleapis.com/v0/b/login-demo-148c2.appspot.com/o/garuda%2FGroup%2038.png?alt=media&token=83b2a130-1399-4bf1-b159-25fa855ba8f1",
      "name": "Payment"
    },
    {
      "img":
          "data:image/jpeg;base64,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",
    }
  ].toList();

  @override
  Widget build(BuildContext context) {
    var size = sizeMedia(context);
    //Promotion Card Height
    double cardHeight = smallMobile(context)
        ? 160 //size.width - 150
        : largeMobile(context)
            ? 170
            : isBetweenMT2(context)
                ? 170
                : isBetweenMT1(context)
                    ? 170
                    : largeTablet(context)
                        ? 190
                        : ultraLargeTablet(context)
                            ? 200
                            : 220;

    //Promotion Card Width
    var cardWidth = smallMobile(context)
        ? size.width - 50
        : largeMobile(context)
            ? size.width - 70
            : isBetweenMT2(context)
                ? size.width - 70
                : isBetweenMT1(context)
                    ? size.width - 180
                    : largeTablet(context)
                        ? size.width - 380
                        : ultraLargeTablet(context)
                            ? size.width - 420
                            : size.width - 580;

    var imgDimension = smallMobile(context)
        ? size.width / 8
        : largeMobile(context)
            ? size.width / 9
            : isBetweenMT2(context)
                ? size.width / 11
                : isBetweenMT1(context)
                    ? size.width / 13
                    : isBetweenTD2(context)
                        ? size.width / 15
                        : size.width / 16;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Top Bar with name and notification icon
          Container(
            height: isMobile(context) ? 100 : 130,
            width: size.width,
            padding: EdgeInsets.only(
                left: kScreenMarginHorizontal(context),
                right: kScreenMarginHorizontal(context),
                top: 10,
                bottom: 10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hello",
                              style: largeTextStyle(context)
                                  .copyWith(fontFamily: kMuktaRegular)),
                          Text(
                            "Loga Subramani",
                            style: ultraLargeTextStyle(context)
                                .copyWith(color: Colors.black.withOpacity(0.7)),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: kWhiteSmoke,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(Icons.notifications, color: kDimGray),
                    )
                  ],
                ),
              ],
            ),
          ),

          //Search Bar
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: isMobile(context) ? 14 : 17,
                vertical: isMobile(context) ? 10 : 14),
            child: const StaticSearch(
              radius: 5.0,
              searchHint: "Search here",
            ),
          ),

          /*----------start promotional and ui box --------------*/
          //promotion Box
          mediumCustomSizedBox(context),
          const SinglePromotionBox(
              imgUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_AQrFVJDFGFolarST3oupglsAsvAMbEwxbQ&usqp=CAU"),
          mediumCustomSizedBox(context),

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
                      onTap: () {})),
              Expanded(
                  child: displayHomeBoxGrid(
                      txtColor: Colors.white,
                      icon: Icons.medical_services_outlined,
                      circleClr: Colors.white,
                      title: "Visit In",
                      subTitle: "View appointments",
                      bgColor: kPrimaryColor,
                      onTap: () {})),
            ],
          ),

          mediumCustomSizedBox(context),
          /*----------end promotional and ui box --------------*/

          /*----------start appointments box --------------*/
          //Appointments Today
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: kDefaultScreenPaddingHorizontal(context),
                vertical: kDefaultScreenPaddingVertical(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    child: rowTitleText(
                        context: context, text: "Appointments for today")),
                mediumCustomSizedBox(context),

                ///If no appointments are available,then use this
                isAppointment == false
                    ? Container(
                        height: 110,
                        width: size.width,
                        padding: EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            color: kSecondaryColor,
                            border: Border(
                              left: BorderSide(width: 2, color: kPrimaryColor),
                            )),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("No appointments for today",
                                      style: largeTextStyle(context)
                                          .copyWith(color: kPrimaryColor)),
                                  Text("Book an appointment now",
                                      style: mediumTextStyle(context).copyWith(
                                          color: kDimGray,
                                          fontFamily: kMuktaRegular)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )

                    ///If appointments are available,then use this
                    : Container(
                        height: isMobile(context) ? 140 : 180,
                        width: size.width,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(color: kSecondaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: isMobile(context) ? 50 : 70,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: isMobile(context) ? 50 : 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_AQrFVJDFGFolarST3oupglsAsvAMbEwxbQ&usqp=CAU"))),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("Dr . Testing Subba Raoss",
                                              maxLines: 1,
                                              overflow: TextOverflow.clip,
                                              style: isMobile(context)
                                                  ? mediumTextStyle(context)
                                                      .copyWith(
                                                          color: kPrimaryColor,
                                                          fontSize: 17.5)
                                                  : largeTextStyle(context)
                                                      .copyWith(
                                                          color:
                                                              kPrimaryColor)),
                                          Text("ENT",
                                              maxLines: 1,
                                              overflow: TextOverflow.clip,
                                              style: isMobile(context)
                                                  ? smallTextStyle(context)
                                                      .copyWith(
                                                          color: kDimGray,
                                                          fontFamily:
                                                              kMuktaRegular)
                                                  : mediumTextStyle(context)
                                                      .copyWith(
                                                          color: kDimGray,
                                                          fontFamily:
                                                              kMuktaRegular)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: isMobile(context) ? 40 : 55,
                                    width: isMobile(context) ? 40 : 55,
                                    decoration: BoxDecoration(
                                      color: kSecondaryColor,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Icon(Icons.arrow_right_alt_outlined,
                                        color: kPrimaryColor),
                                  )
                                ],
                              ),
                            ),
                            mediumCustomSizedBox(context),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: isMobile(context) ? 6 : 14,
                                    vertical: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: kSecondaryColor,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    iconText(
                                        icon: Icons.calendar_today_sharp,
                                        text: "Monday, Aug 19"),
                                    RotatedBox(
                                        quarterTurns: 1,
                                        child: mediumCustomSizedBox(context)),
                                    iconText(
                                        icon: Icons.access_time,
                                        text: "11:00 am"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                mediumCustomSizedBox(context),
              ],
            ),
          ),
          /*----------end appointments box --------------*/

          /*----------start carousel box --------------*/
          ///Carousel
          Container(
            width: size.width,
            height: isMobile(context) ? size.height / 3.8 : size.height / 3.2,
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultScreenPaddingHorizontal(context),
                      vertical: kDefaultScreenPaddingVertical(context)),
                  child: titleText(
                      context: context,
                      text: "Best of us",
                      color: Colors.white),
                ),

                ///Carousel Scrolling Content
                SizedBox(
                  height: cardHeight,
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (BuildContext context, int i) {
                      //Card
                      return Container(
                        padding: EdgeInsets.only(
                            left: i == 0
                                ? kDefaultScreenPaddingHorizontal(context)
                                : 8.0,
                            right: i == 3
                                ? kDefaultScreenPaddingHorizontal(context)
                                : 0.0),
                        width: cardWidth,
                        margin: EdgeInsets.symmetric(
                            vertical: isMobile(context) ? 8 : 12,
                            horizontal: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Image.network(
                            "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUVFRgSFRYYGBgYGBgSGBgYEhIYGBgYGBgZGRgYGBgcIS4lHB4rHxgYJjgmKy8xNTU1GiQ7QDszPy40NTEBDAwMEA8QGhERHDQhISE0NDQxNDQ0NDQ0MTQ0NDQ0NDQ0NDQ0MTQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQxNDQxNP/AABEIAKgBKwMBIgACEQEDEQH/xAAbAAACAwEBAQAAAAAAAAAAAAACAwABBQQGB//EADwQAAIBAgQCBggFAwMFAAAAAAECAAMRBBIhMUFRBRMiYXGBBhQyUpGhsdFCcqLB8CNi4TNzsiQ0krPx/8QAGQEBAQEBAQEAAAAAAAAAAAAAAAECAwQF/8QAIxEBAQEBAAICAQQDAAAAAAAAAAERAgMxEiFBBBMiUTJhcf/aAAwDAQACEQMRAD8AMJDCQws3uhOhGdg7rZBrY6Fjytvaeq2R4Oeb1cjNw+ITDunWAg1ELIeAGYD4ka+Ym1WezgxXptg0rYew/wBRXy07C5z6nJ3AqD8p57ojpJnpqW3At36c587z27tfX/TTmc/Gfhr9KPn7HPeZy9HXIAFydh+55TooVQzakDckm+gGpM9AlNUW410vfnynLjxXu7fTp5PLOJk9ubDdDoUKH2tDm5N4cu6Y1bDlGKNuP4CJ63A0yqdr2iSx8T/i0rG4ZGF2UEjY8fjPfx18fr8Pn+Xj5/y/LyVRLWHIa+JgWm3W6JzAsh15HbyMyqlJlOVhYjha07zqX08vXHXPsrLJlhhZMs0wtFG/KFUGtuUMLqF8zB7/ADkMVlkywwJeWNXC8slozLCVLyauFBYxcOTvpOpKYEIiNRynCjmYh6BHfNC0ErGozCsorHuljaCqXNprTAJTvOtUAFhDSnYWhWk0LInOauthtOmpa1r7znQAHX5QSGkQGEaRAYSs2EutwRMwrNYzMKypEw9K5udh9Z1kQkSwtIRCX7KY21nDXCW0Nze9521iLa7HScdRQxsogisPQzanaSph1uY1MyjLp3HXj/DJ6v8A3fKF16zo7o1Us7gF9+YXw7++egWpwA4XvecKam/LX7TvppYeOs8tu+30ueZzMjF6doZUaoNwUqD86sAD4lSw+E8x0/SRKpdLAVEWqQNsxJBIHC9gfG89vj8P1lN6d7EiwPI8D5G08piujnxKPUOlVbKUuMmUWvl0uOJ48Zy8vN65yOvi6nPW1yejFnaoW91R5Etf6Cem6KpZkUnZMygcyrEfAACZfQnRgpt1aqSzLdnLDLlBH4QNJ6hKYACgWA0l45vPOVPJ1OurYB0O4J04ROutyT8J1O9pzNNMKw43icRh0qe1ewOhGh8L8p1YVLXJ4wantBR+aX0lkv1XDV6KpkWAIPPMT9Zl4jo901Iuo4j5XHCemVf/ALKNuUs7sY68XN/08mg3P81kAnZjMMEYqLAXzDwP8PwiAg5/ATtuvNZlwFpeSGRylgRqgVJ0KlhLpJxlVTwk0wDVOQhF9PnFlZYEphZc848axWWPtJqWOWsNYdCnxgsLnznQBKirQW0hsbSgbwmOFrk3lBCeE7iIms9vGXRDBaSkx1vLMrNIrGymclFLsO7WdOJPDzg4ddT4Spn0JhBIjSIBEMuWs63s3DWKpOoJO19hbhG1Kg1012vOYiVcObEjkYHrPd8/8RREvq25QZH0RVsPHWdlM8Ii2sfTnkfTR1mOEy1nXbOlxrx1B/nfNq+tpzvhAzq5/Bc+Z0/z5RBz9H4cogze2wBbW9uS37vvOotbTjI5tKA0gCRc/OJAubR6bnwi6Y1gOp6fECc6DtueVkHwBMe5sp8V+sXR1Y/mJ+A/zANhwi4x9IElGV0xT1V/Ff3H7zOAm/jKedGHmPEazDtOnN+nDyc/y1QEJU1lARtJZpgwCJtr8Z0WgOltRATllAQ7RipaAtafGR9BGmIqNeGS6a6x1oFPeW7WgLrbwkWwgFjzhUtppKJjOaowPH5Q6x4RXVnlEQVJhsJbmwvJTS1yYp2v4Ss4S3OFR38pCJBobylhpEEiM3gGVnCHoAm8HqF5R5EEwhXVjkPhLhmDCPcgax1OKA1jFM8r6gS3ajswvbnr4CcxM6ANBAt0vEMtp0HaAICKfGL4zpZLRWQXgR2GU9+3lM2v0pQovarWppe57dRFOvIE3mF6W43ENXTA4R7VHUVHe2lJLOCx5kg/TiwmeOgMDhEeviV66xsXqjO7tt2VOmYm/wC/EwPd4fEJUXOjq6nZlZWB8CDLInyrBNizWXE9H4R6KMLMr1KYSqvBmRiPIgm3A2nrOjPSl+sXD4zDthqjewSwZH4dlhpxGxNri9riSj0WLfKhPkPEzGE1ukB2PAg/z4zJAm+fTj5PaWjaMXGUzNuZklpcu0AES0U2JQGxYaaR9phVwS7KoLEs2gBJ3PASasmtJ8WnvCIbEJ7wmeuHckgIxI3ARiR4i2kSRGnxayYpAfaEN6yH8YmJGvTZQpYaMCVNwbgGx279JdT4tXrU94fEyesJ7wmatIlS49lSATcaE7XG+uvwiiY1Ly1jiU94QWxSe8Jjs8UxvLp8Ws+LQ/iFoHrCe8Jl2hU6LMbIrMd7KpJ+AjT4tA1094SvWE94TNZeBg24fuJdT4tNcWg/EIfrae8Jk4iiyHKwsbA7g6MAwNxzBBiTLrN5bRxSe+PjFtjE98fOYzRZl1n4xrvj04EecT60Pf8AnMwwbxp8Y+xWkMOAwnmfQLM6VGk5p08IEQ7iVbQy1PGBXrKgueJsPr+0Ag15y4hss5cVjHUrlKHNtcW4880S/SKPddnU6qeIBtf+c5Nm4YwPRg58T0jUb2+vWit9wiILW7iLf+ImN0bnx+LCVQOrw4NRlF8rMW0BvuTt4I4/FOw4n1THuDcUsYoUP+FKyiw14Zg1vEpJ6DMqLiADZ3rWBsLhCpt+oVJR7PqRa3zmb6Q9GjEYZ6ZALqDUS+4dBdbeOqnuYztB0118dYF8jqCezYsCTtbcEnhIOf0ex/X4VKjG5ylHJ3utwSe8ix84m0y/QKoHwdQropqMVHJciEfK01rTfLl5PcDaXaXJabcxq8LPFySAi0y8H/3Cf7yf8xNKYtRyrsykghjYgkEa8CJK1HfhcmevbNfq6+9rbG8WKFJVpF9Q6l2tnLk5mUKtuzcWG/G84VxDglg7At7RDsCfE31grXcDKGYDXQMba76SYuu+lhFKkMqhhQNYWaoXJtmVj+EAggW7+c6MBbNhLgH2xY/7rzJGKqAAB3AUWFnYWGosNdtT8YBxD9ntt2fZ7bdn8uunlGJrswjgUKrFBvRIXthTq+u9yN+MZVwiA1HC6LSp1VS7WBqBLm97lVzHjynAcU5BBd7NYsM7WNtBcX1lHEuWzF3LWtfOxNtrXvt3S4a6FRSpqCmoXsJd3qFc9mzBFXU5svPSx56Oq4NEOIBTMKZGS7ONDUCWNjqLH5bzhGJcXs7jNa/bbW215GxdQ3u762B7bdoDa+usYfTt6miFpOyjLULsVBqsygMVCJY2uBbVuJHCJ6D/ANdfy1f/AEvOZKzqMqswG9gxAvztzg06rIbozKdrqxU25XEuJv26aKIKKOUVmNVqZu1QAqFRtlYa9o6yYrBpTWswGbLiDh1DFrKoznMcpFycoHxnIcS9gM72BzAZ2sDzAvoe+V63UBLB3u3tHO128TfWMqbGpjqKtVrBltlwyVFF2ujLTpC2+uhO/Kcow1MdQzKQHpu72znUO6q5F75RZSbWuAZw+suGDB3zKMobO1wLWyg30FtLcpDiqhsc76Xsc76Zvatrpe5vzvLlS9R3rRCCtdabA4cOrK1Qo4NdAGFyCvEEbgrOWqtNKNNzSBZ2rIwL1BbJlCm2bcFvl8EddUzZ87ZrZb5zfL7t77d0W9ZyFV2dkBvkNRsu+thqBfnEiXqOnG0ECisqAI6KEF6hy1L2cXzXNijnXgyTJtOrE1gQFQFUUsVBbMbta5JsNbBRt+ETmtNRm19gRwReUW1ikVsouuU2FxpobbaQ0BtYzg9qn5idIOkQR3Ss/IQDV+EzPSGqUw71QpZqatUCgm7ZVJy6c53mnfW5icf2KbtvZSRfnw+cWyTSTbjw2HxuNqMHDKQUbKMi5MpXXLYZgpBJvfiL3g9FV0fJXRCq2N7U6rG5QgrnBKmx4hRtO/C4YJmKjKGBDIrOEN7g/wBO+TW+ukfRoKoCqAANAALADkBwnl/env29f7N/45el6SYhHwzU3IIDrVIQJntoR2s3da0zOgeiHohHqX6wVs7v1hYOgSoq9nYN2/PUz0hMpH02vH73VWeDn8tCljkIsGHnp9Zw9MItdeoDkZ0ZCyMMwDaMQeGg+czcTXyn2SR/aL28t4n1lLixAPfoR5HWSee/mF/Sz8V6TonotcNhxRBzWDFmy5czG5Jy3OUcALmwAETOzB1C1K5N+ywv8bfKcs9fF2a8HlmdYGSWBCCTo5AlR9oDLAXMPEe235j9ZuNMHEHtt+ZvrBAGVJLAkUMKlQZiFG5NgLgXPAawgJ0YAf1af50/5CEKfBOoJI0U5WIKnKeTWJtsd4nq5p43EZWrIqkF6hzFiGuFcsAq2G5tvedVdE69qeRABd0GQAs4pkqt+ILfh5gCNXGARKm1hqIbqSyjO1cJl6te1T7OYlbW0JIvbieWi6gshcU0utfq1/pqewQTlII7WoGpudTGmMcyrHXTbfTbhrNfGYZV6/IozJWyAFQ2Wmc+oBvxCi/hzjWQKKyIBmNKgzIEVrOXTOoUg8TtwJ7pdMYdWkyqrEaPcrqDfKbHQG415xWW83aGEQ+rF1AzCrfshQzKzZASLXBIA77wMPSDCmWQZjiFpgdWozIR2wVAsQDbW2mY+TWbGOFAlGa+LpgpXOQL1dVVUqgBCsagYEgXPsg67ecyDNSsdTAwTCMqVkp0Bics6TAgfV7SQ7SWnB7inlU1hsItngGW1tOTpo/0X78o/UJ0U1uZyekI/okf3L9b/tOff+Nb4n8oxEXhGZZypVG1x8Z0B545HvtTbhI7hRcj4CWXg1cSAh0lJ7ZuIrsW7KE371FotXYkdg372XXzEMOzXsFA5m/7RaoW/F5KDc9wN9JhuvQ9GG1Fidze/LXl8ZQEbkyItPuuf2EoCfS8XOcx8jzXerYgEkkEtNuIpRkUyGAupPPYj22/MfrPQ1NpxNhUJJK6k33b7ymskCFNZcEnu/qb7yHCJ7v6m+8Ymsi8rPaanqaH8On5m+8L1NPd/U33jE1k578ZCxmm2ETcL+pvvL9UT3f1N95cPkzC53ub87m8UznmfjNj1RPd/U33iqmES/s/NvvGHyZWc3vc353N5S3vfb/M0/VE935t94z1RPd/U33lxL0yixgs5Otzfa9zeajYRPd/U33ijQT3fm33icp8maXO1z8TKM7jhk935t95DQXl8z95cTWaW4S53vhUvfL82+8iUEvqPm33lxNZ5lTVOFT3fm33leqp7vzb7xibH0SQCEEhnSed73LidIpBeMqG8OmkC6azi6boh6eU7ZgfheaCxGOGgHfIbjz6dG0nUgjKcthY2Pj4zjoYMrYB7qfZY6g9xPAzfrUxcacJyHCEXyWsd0YdknmORmbzGp31PVKXo1r6uPJf8zz3pW706btRa5RS7sUBVbcPH7W529KtGtbKSqr3Es1uQPCZ3pZTRMBWUDdRfme0o1knHP8ATX7nX9kYLAlsOtS5Zj2yDlAK3OgsOVpmel/Rj9UmLwjOr0j1mQM2VwLE5lvqRr5E909R0AP+mo/7aH4qD+8F0NNmsLo2pG+Unjblzicyfhm99X3XN0N0ouKpJiF0DjUe6w0ZT4EGd9p5X0aoth8TiqAVupZlxFJgpyAuLOinblp/bPV0azAEWGvyH7zrK4Wff2BjKvpIwlKJplayzJxkMFKqRYWNeCBNMqMWx4RjRSjWEFBhWlWhkD7QhAc6wlGkC5zudZ0GcxmhE5wzIq6SGGaTWMBUuLwqp1kYWG/0mkLFPS8oJpeMcab93CC4037thCByaX84CDWHU0G/yEGnxMoMyoJMl4R9FMBzLMqeV9EgCNWUyy6e8BgE58ZwnRfW0RjBoJBx1Nx4SoTjaGEgLU2mZ6TYfrcNWp23RiD4a/tNNkMPLcWO2xEDE9EamfB0DyQIfFOwf+M0666Hwnk+jceMBiXwVU5adRjUw7k9k30KE8DsPEf3T1OIayFibC1ySbADmTyhL6eVxNYr0lSQbNQZmHAZc9jb4fCehWeT9H39axtfGj/SRBhKLa2exDOw7rjf+6estNxy6WZBKtLtKK4y2MgEBjCAMsCQyxKlLYSlWNIgsJUKLSi0vJLywhIWMlkSmgA5iyIRMGGRmA0MwDNJXPa5lsNQLnnIUPCAQ0rNWw1GvfF1D3y7NBZTNIFnJhJtBCc4RhKomDmkYzmLmEfUrQSIb/b6wWnkfSCbSgBIZLSirwcStxF16fGLDyBLKdPvLv3xrGRZRzVgSNCfjObXmfNjNYAEbRbgcoGJ0h0TSxKGnWQOp14gqeasNVMwqvoLTC5WxGKemNqTVhkty0F7T2bRdcXUjuMn5S+mZhaCIi00UKiiyqosAI68SpjA06OIpJRaCTAjNBlyoEkWSVeVKKUZWaWYRRgmWYDNKiGKYyy0CBDBMKCYZEp0gtKBlmaShMBobRbSskVHYGwF/I8dPrbyvFdcx17jplOu1uPHWxnSYAUDYW8BKmlFz9eB3voO6Ujk3v8AQjgOBjHac1SpfSUtVUe8TLJkhH1ZoBkknkfRCZTSSSim2nNUWSSAljHIdJJJBVN+EuqJcko52MkkkyMmEDJJOrzpeSSSFSSSSBRMEmSSWIG8mYySSoAmS8kkIAmDeSSBUomSSaShMHNaSSEQuIDMJJJWKAuOcS9SSSaiUh3vFEySQipLySQr/9k=",
                            fit: BoxFit.fill,
                            width: size.width,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          /*----------end carousel box --------------*/

          /*----------start Our Services UI Part --------------*/
          mediumCustomSizedBox(context),
          Container(
              margin: EdgeInsets.symmetric(
                  horizontal: kDefaultScreenPaddingHorizontal(context),
                  vertical: kDefaultScreenPaddingVertical(context)),
              child: rowTitleText(context: context, text: "Our services")),
          //Services
          serviceSlider(),
          smallCustomSizedBox(context),
          serviceSlider(),
          /*----------end Our Services UI Part --------------*/

          /*----------start second promoitons box --------------*/
          ///Second Promotions Box
          mediumCustomSizedBox(context),
          Container(
            width: size.width,
            height: isMobile(context) ? size.height / 4.3 : size.height / 3.9,
            margin: EdgeInsets.symmetric(
                horizontal: kDefaultScreenPaddingHorizontal(context),
                vertical: kDefaultScreenPaddingVertical(context)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://actampa.org/wp-content/uploads/2017/10/rabies-vaccine-final-1024x538.jpg"))),
          ),
          mediumCustomSizedBox(context),
          /*----------end second promoitons box --------------*/

          /*----------start end details box --------------*/
          ///End Details Box
          Container(
            width: size.width,
            decoration: BoxDecoration(
              color: kSecondaryColor,
            ),
            child: Container(

            margin: EdgeInsets.symmetric(
                horizontal: kDefaultScreenPaddingHorizontal(context),
                vertical: kDefaultScreenPaddingVertical(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  mediumCustomSizedBox(context),
                  mediumCustomSizedBox(context),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      verticialIconText(text: "1", icon: FontAwesomeIcons.hospitalAlt),
                      verticialIconText(text: "50+", icon: FontAwesomeIcons.userMd),
                      verticialIconText(text: "100+", icon: Icons.person),
                    ],
                  ),
                  mediumCustomSizedBox(context),
                  Padding(
                    padding: EdgeInsets.symmetric(
                horizontal: kDefaultScreenPaddingHorizontal(context),
                vertical: kDefaultScreenPaddingVertical(context)),
                    child: Text("Our community of doctors and patients drive us to create technologies for better and afforable healthcare",
                    softWrap: true,
                    textAlign: TextAlign.center,

                    style: mediumTextStyle(context).copyWith(color:kPrimaryColor,wordSpacing : 0.5),),
                  ),
                ],
              ),
            ),
          )
          /*----------end end details box --------------*/

          /*----------start daily updates box --------------*/
          //Daily updates
          /*
          Container(
              margin: EdgeInsets.symmetric(
                  horizontal: kDefaultScreenPaddingHorizontal(context),
                  vertical: kDefaultScreenPaddingVertical(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  titleText(
                      context: context,
                      text: "Daily updates",
                      color: Colors.black.withOpacity(0.7)),
                  mediumCustomSizedBox(context),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int i) {
                      return Container(
                        height: isMobile(context) ? 120 : 140,
                        width: size.width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: isMobile(context) ? 100 : 120,
                              height: isMobile(context) ? 100 : 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.0),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://cdn.dribbble.com/users/606683/screenshots/3978222/news_app_concept.png"),
                                ),
                              ),
                            ),
                            RotatedBox(
                              quarterTurns: 1,
                              child: mediumCustomSizedBox(context),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "News UI designs, themes, templates and downloadable I designs, themes, templates and downloadable ",
                                    style: mediumTextStyle(context),
                                    maxLines: 2,
                                    softWrap: true,
                                    overflow: TextOverflow.clip,
                                  ),
                                  smallCustomSizedBox(context),
                                  Text(
                                    '''News App UI Inspirational designs, illustrations, and graphic elements from the world’s best designers. Want more inspiration? Browse our search results... View News iOS mobile app. News''',
                                    style: smallTextStyle(context),
                                    maxLines: 2,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  )
                ],
              )),
          */
          /*----------end daily updates box --------------*/
        ],
      ),
    );
  }

  Widget verticialIconText({required String text, required IconData icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,color: kPrimaryColor,),
        smallCustomSizedBox(context),
        Text(text,style: mediumTextStyle(context).copyWith(color:kPrimaryColor,fontWeight:FontWeight.bold),),
      ],
    );
  }

  Widget serviceSlider() {
    var size = sizeMedia(context);

    double categoriesHeight = smallMobile(context)
        ? 90
        : largeMobile(context)
            ? 90
            : isBetweenMT2(context)
                ? 90
                : isBetweenMT1(context)
                    ? 95
                    : largeTablet(context)
                        ? 110
                        : ultraLargeTablet(context)
                            ? 120
                            : 130;

    double ourServicesContainerHgt = smallMobile(context)
        ? 90
        : largeMobile(context)
            ? 90
            : isBetweenMT2(context)
                ? 90
                : isBetweenMT1(context)
                    ? 95
                    : largeTablet(context)
                        ? 110
                        : ultraLargeTablet(context)
                            ? 120
                            : 130;

    return Container(
      width: size.width,
      height:
          ourServicesContainerHgt, //isMobile(context) ? size.height / 3.8 : size.height / 3.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ///Carousel Scrolling Content
          SizedBox(
            height: categoriesHeight,
            child: ListView.builder(
              itemCount: servicesName.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              addAutomaticKeepAlives: true,
              itemBuilder: (BuildContext context, int i) {
                //Card
                return Container(
                  width: 90,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: kSecondaryColor, width: 1),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  margin: EdgeInsets.symmetric(
                      vertical: isMobile(context) ? 8 : 12, horizontal: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: Image.network(
                      servicesName[i]['img'],
                      fit: BoxFit.contain,
                      width: size.width,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget displayHomeBoxGrid(
      {required Color txtColor,
      required IconData icon,
      required Color circleClr,
      required String title,
      required String subTitle,
      required Color bgColor,
      required Function onTap}) {
    var size = sizeMedia(context);
    return Container(
      width: size.width,
      height: isMobile(context) ? size.height / 4.0 : size.height / 3.2,
      margin: EdgeInsets.symmetric(
          horizontal: kDefaultScreenPaddingHorizontal(context),
          vertical: kDefaultScreenPaddingVertical(context)),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.0),
          border: Border.all(color: circleClr),
          color: bgColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: CircleAvatar(
              maxRadius: isMobile(context) ? 26 : 32,
              backgroundColor: circleClr,
              child: Center(
                child: Icon(icon,
                    color: kPrimaryColor, size: isMobile(context) ? 32 : 38),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                smallCustomSizedBox(context),
                Text(
                  title,
                  style: smallMobile(context)
                      ? mediumTextStyle(context)
                          .copyWith(wordSpacing: 2.0, color: txtColor)
                      : largeTextStyle(context)
                          .copyWith(wordSpacing: 2.0, color: txtColor),
                ),
                Text(subTitle,
                    maxLines: 2,
                    softWrap: true,
                    style: smallMobile(context)
                        ? smallTextStyle(context)
                            .copyWith(wordSpacing: 1.0, color: txtColor)
                        : mediumTextStyle(context)
                            .copyWith(wordSpacing: 1.0, color: txtColor))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget iconText({required IconData icon, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon,
            color: kPrimaryColor, size: smallMobile(context) ? 16.5 : 24),
        Container(
          margin: const EdgeInsets.only(left: 7.0),
          child: Text(text,
              style: smallMobile(context)
                  ? smallTextStyle(context)
                      .copyWith(color: kIndigocolor, fontFamily: kMuktaRegular)
                  : mediumTextStyle(context).copyWith(
                      color: kIndigocolor, fontFamily: kMuktaRegular)),
        ),
      ],
    );
  }
}


/*
          GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: smallMobile(context)
                      ? 1
                      : largeMobile(context)
                          ? 1
                          : 4 / 3,
                  crossAxisCount: smallMobile(context)
                      ? 4
                      : largeMobile(context)
                          ? 4
                          : isBetweenMT2(context)
                              ? 4
                              : isBetweenMT1(context)
                                  ? 5
                                  : 6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: servicesName.length,
              itemBuilder: (BuildContext context, int i) {
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        servicesName[i]['img'],
                        fit: BoxFit.fill,
                        height: imgDimension,
                        width: imgDimension,
                      ),
                    ],
                  ),
                );
              }),
 */