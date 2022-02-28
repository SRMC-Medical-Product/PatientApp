
import 'package:patientapp/helpers/headers.dart';

Widget contentDescTile({required BuildContext context,required String title,required String subtitle}) {
    return  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      style: smallTextStyle(context).copyWith(
                          height: 1.2, color: kGraycolor, fontFamily: kMuktaBold),
                    ),
                    Text(
                      subtitle,
                      style: mediumTextStyle(context)
                          .copyWith(color: Colors.black.withOpacity(0.9),fontFamily:kMuktaBold),
                    ),
                  ],
                );
  }

Widget mesauresTakenList(BuildContext context){
  return               Container(
                margin: EdgeInsets.symmetric(
                    horizontal: kDefaultScreenPaddingHorizontal(context),
                    vertical: kDefaultScreenPaddingVertical(context)),
                child : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    smallCustomSizedBox(context),
                    Text(
                      "Measures to be taken",
                      style: mediumTextStyle(context)
                          .copyWith(color:Colors.black.withOpacity(0.9),fontFamily:kMuktaBold),
                    ),
                    smallCustomSizedBox(context),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: measuresTakenJson.length,
                      itemBuilder: (BuildContext context, int i){
                          return Padding(
                      padding: const EdgeInsets.only(left: 7,bottom: 7),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 5,
                            width: 5,
                            decoration: const BoxDecoration(
                              color: kGraycolor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          RotatedBox(quarterTurns: 1,child: mediumCustomSizedBox(context),),
                          Expanded(
                            child: Text(
                                                  measuresTakenJson[i]['steps'],
                                                  overflow: TextOverflow.clip,
                                                  softWrap: true,
                                                  style: smallTextStyle(context).copyWith(
                              height: 1.2, color: kGraycolor, fontFamily: kMuktaRegular),
                                                ),
                          ),
                        ],
                      ),
                    );
                      }
                    ),
                  ],
                )
              );

}

  