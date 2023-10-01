import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TasbehTab extends StatefulWidget {
  static const String routeName="Tasabeh";

  @override
  _TasbehTabState createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {

  double _rotationAngle = 0.0;
  int numberOfTasbeh = 0;
  String tasbehName = '';

  void _handleTap() {
    setState(() {
      _rotationAngle -= 45.0;

        if (numberOfTasbeh <= 99) {
          numberOfTasbeh++;
          if (numberOfTasbeh < 33) {
            tasbehName = AppLocalizations.of(context)!.sobhan_allah;
          } else if (numberOfTasbeh < 66) {
            tasbehName = AppLocalizations.of(context)!.alhamdullah;
          } else if (numberOfTasbeh < 99) {
            tasbehName =AppLocalizations.of(context)!.allah_akbar;
          }
          if (numberOfTasbeh==100) {
            numberOfTasbeh = 0;
        }

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 1,left: 92),
                    child: Image.asset('assets/images/head of seb7a.png'),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 80),
                    child: InkWell(
                      onTap: _handleTap,
                      child: Transform.rotate(
                        angle: _rotationAngle * (3.14 / 180),
                        child: Image.asset('assets/images/body of seb7a.png'),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                AppLocalizations.of(context)!.number_of_tasbehat,
                style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black),
              ),
              SizedBox(height: 20),
              Container(
                width: 69,
                height: 81,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xAFB7935F),
                ),
                child: InkWell(
                  child:
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        '$numberOfTasbeh',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 137,
                height: 51,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFB7935F),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '$tasbehName',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
