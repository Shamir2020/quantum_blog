import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' hide Text;
import 'package:html_editor_enhanced/html_editor.dart';

//Import necessary packages for rendering HTML


import '../styles/styles.dart';

class BlogInside extends StatefulWidget {
  var Blog;
  BlogInside(this.Blog,{Key? key}) : super(key: key);

  @override
  State<BlogInside> createState() => _BlogInsideState();
}

class _BlogInsideState extends State<BlogInside> {


  @override
  Widget build(BuildContext context) {
    HtmlEditorController controller2 = HtmlEditorController();
    controller2.insertHtml(widget.Blog['content']);

    final htmlData = widget.Blog['content'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.black,
        title: Text("Quantum Blog",style: TextHeading3(colorBlack),),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Text(widget.Blog['title'],style: TextHeading2(colorBlack),),
            Html(
                data: htmlData,
              style: {
                  'p': Style(
                      lineHeight: LineHeight.em(1.6),
                      textAlign: TextAlign.justify,
                      fontWeight: FontWeight.w600,fontFamily: 'Poppins',fontSize: FontSize.large)
              },
            ),
            // HtmlEditor(
            //       controller: controller2,
            //       htmlEditorOptions: HtmlEditorOptions(
            //         disabled: true,
            //         initialText: widget.Blog['content'],
            //         hint: 'Your text here...',
            //         shouldEnsureVisible: true,
            //         // initialText: widget.Blog['content'],
            //       ),
            //       htmlToolbarOptions: HtmlToolbarOptions(
            //           toolbarPosition: ToolbarPosition.custom,
            //           textStyle: TextHeading3(colorBlack)//required to place toolbar anywhere!
            //         //other options
            //       ),
            //       otherOptions: OtherOptions(height: 550),
            //     ),


            //other widgets here
            // ToolbarWidget(
            //   controller: controller2,
            //   htmlToolbarOptions: HtmlToolbarOptions(
            //     toolbarPosition: ToolbarPosition.custom, //required to place toolbar anywhere!
            //     //other options
            //   ), callbacks: null,
            // )


          ],
        ),
      )
    );
  }
}
