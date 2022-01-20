import 'package:flutter/cupertino.dart';
import 'package:patientapp/helpers/headers.dart';

class StaticSearch extends StatelessWidget {
  final String? searchHint;
  final double? radius;
  const StaticSearch({ Key? key,this.searchHint ,required this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = sizeMedia(context);
    return GestureDetector(
      onTap: () {},
      //=>Navigator.push(context, CustomSimplePageRoute(page: AppScreenController(indexScreen: 1,),routeName: appcontroller)),
                
      child: Container(
        padding: EdgeInsets.all(10),
        width: size.width,
        height: isMobile(context) ? 45 : 58,
        decoration: BoxDecoration(
          color: kWhiteSmoke,
          borderRadius: BorderRadius.circular(radius ?? 2.0),
          border: Border.all(
            color: kSlateGray,
            width: 1.5
          )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(CupertinoIcons.search,color: kDarkGray,size: isMobile(context) ? 19 : 25,),
            SizedBox(width: isMobile(context) ? 10 : 15,),
            Expanded(
              child: Text(searchHint == null ? "Search for more" : "$searchHint",
              style: TextStyle(color: kDarkGray,
              fontFamily: kQuickSandBold,
              fontSize: isMobile(context) ? 13 : 16),))
          ],
        ),
      ),
    );
  }

  
}

/*
class DynamicSearch extends StatefulWidget {
  final String searchHint;
  final double radius;
  final TextEditingController controller;
  final Function performSearch;
  const DynamicSearch({ Key key, this.searchHint,this.radius,@required this.controller,@required this.performSearch}) : super(key: key);

  @override
  _DynamicSearchState createState() => _DynamicSearchState();
}

class _DynamicSearchState extends State<DynamicSearch> {
  
  @override
  Widget build(BuildContext context) {
    var size = sizeMedia(context);
    return SizedBox(
      width: size.width,
      height: isMobile(context) ? 39 : 48,
      child: CupertinoTextField(
        controller: widget.controller,
        placeholder: "Search for more",
        placeholderStyle: TextStyle(color: kDarkGray,
            fontFamily: kQuickSandRegular,
            fontSize: isMobile(context) ? 12 : 15),
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(widget.radius ?? 2.0),
        border: Border.all(
          color: kSlateGray,
          width: 1.5
        )
      ),
      autofocus: false,
      clearButtonMode: OverlayVisibilityMode.editing,
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.text,
      enableInteractiveSelection: true,
      style: TextStyle(color: kDarkGray,
            fontFamily: kQuickSandRegular,
            fontSize: isMobile(context) ? 12 : 15),
      prefix: Padding(
      padding: EdgeInsets.all(10),
      child: Icon(CupertinoIcons.search,color: kDarkGray,size: isMobile(context) ? 17 : 23,),
      ),
          //onSubmitted: widget.performSearch,
          onChanged: widget.performSearch,
      )
    );
  }
} */