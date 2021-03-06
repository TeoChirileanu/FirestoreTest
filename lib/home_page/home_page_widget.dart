import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../game_page/game_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, 0),
            child: Image.network(
              'https://picsum.photos/seed/315/600',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FutureBuilder<dynamic>(
                  future: getRandomNumberCall(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return FFButtonWidget(
                      onPressed: () async {
                        var randomNumber = "";
                        try {
                          var url = Uri.parse("https://cutt.ly/UnL0wJE");
                          var response = await http.get(url);
                          randomNumber = response.body;
                        }
                        catch(e) {
                          randomNumber = e.toString();
                        }
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GamePageWidget(
                              answer: randomNumber
                            ),
                          ),
                        );
                        final user = await signInAnonymously(context);
                        if (user == null) {
                          return;
                        }
                      },
                      text: 'Play',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: Color(0x7A3474E0),
                        textStyle: FlutterFlowTheme.title1.override(
                          fontFamily: 'Poppins',
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
