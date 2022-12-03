import 'package:epsilonv7/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_search/dropdown_search.dart';

class BrandField extends StatelessWidget {
  const BrandField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppStateManager myProvider = Provider.of<AppStateManager>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              child: Text(
                "Brand Ambassador",
                style: TextStyle(
                    color: Color(0xffaf52e0),
                    fontSize: 18,
                    fontFamily: "Syne",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                child: BrandSearchBox(
                  onChange: (value) {
                    myProvider.setbrandName(value as String);
                  },
                  value: myProvider.brandName,
                ))
          ],
        ),
      ),
    );
  }
}

class BrandSearchBox extends StatefulWidget {
  final Function(Object?) onChange;
  final String? value;
  const BrandSearchBox({Key? key, required this.onChange, this.value}) : super(key: key);

  @override
  State<BrandSearchBox> createState() => _BrandSearchBoxState();
}

class _BrandSearchBoxState extends State<BrandSearchBox> {
  @override
  Widget build(BuildContext context) {
    final AppStateManager myProvider = Provider.of<AppStateManager>(context);
    //myProvider.barData();
    final List<String> items = myProvider.barValues;
    //final int num = (((items.length) / 2) + 1).toInt();
    //print(items);
    //final List<String> values = items.sublist(1, 2);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: Container(
        child: Expanded(
          child: DropdownSearch<String>(
            popupProps: const PopupProps.bottomSheet(
              itemBuilder: _customPopupItemBuilderExample2,
              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                style: TextStyle(
                    color: Color(0xff361553), fontSize: 20, fontFamily: 'Syne'),
                decoration: InputDecoration(
                  label: Text("Type here to search", style: TextStyle(color: Color(0xff361553), fontFamily: "Syne", fontSize: 15),),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 20.0),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Color(0xff361553)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Color(0xff361553)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    filled: true,
                    fillColor: Color(0xfff8f8f8)),
              ),
            ),
            items: items,
            dropdownDecoratorProps: const DropDownDecoratorProps(
              baseStyle: TextStyle(
                  color: Color(0xff361553), fontSize: 20, fontFamily: 'Syne'),
              dropdownSearchDecoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 5, horizontal: 20.0),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(width: 2, color: Color(0xffeeeeee)),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  filled: true,
                  fillColor: Color(0xfff8f8f8),
              ),
            ),
            onChanged: widget.onChange,
            selectedItem: widget.value,
          ),
        ),
      ),
    );
  }
}
Widget _customPopupItemBuilderExample2(
    BuildContext context,
    String hello,
    bool isSelected,
    ) {
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
    child: Center(
      child: Text(
        hello,
        style: const TextStyle(
          fontSize: 20,
          fontFamily: "Syne",
          fontWeight: FontWeight.bold,
          color: Color(0xff361553),
        ),
        overflow: TextOverflow.ellipsis,
      ),
    ),
  );
}
