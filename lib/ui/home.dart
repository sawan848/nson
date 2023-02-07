import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nson/controller/task_controller.dart';
import 'package:nson/db/db_helper.dart';
import 'package:nson/model/task.dart';
import 'package:nson/services/notification_services.dart';
import 'package:nson/services/theme_services.dart';
import 'package:nson/ui/add_task.dart';
import 'package:nson/ui/button.dart';
import 'package:nson/ui/task_tile.dart';
import 'package:nson/ui/theme.dart';
import 'package:nson/ui/theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var notifyHelper;
  DateTime _selectedDate = DateTime.now();
  final _taskController = Get.put(TaskController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
          SizedBox(
            height: 12,
          ),
          _showTasks(),
        ],
      ),
    );
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20),
      child: DatePicker(DateTime.now(),
          height: 100,
          width: 80,
          initialSelectedDate: DateTime.now(),
          selectionColor: ThemeService().theme == ThemeMode.dark
              ? primaryClr
              : Colors.black87,
          selectedTextColor: Colors.white,
           onDateChange: (date) {
            setState(() {
        _selectedDate = date;
              
            });
      },
          monthTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: ThemeService().theme == ThemeMode.dark
                  ? Colors.white54
                  : Colors.black54,
            ),
          ),
          dayTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: ThemeService().theme == ThemeMode.dark
                    ? Colors.white54
                    : Colors.black54),
          ),
          dateTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: ThemeService().theme == ThemeMode.dark
                    ? Colors.white54
                    : Colors.black54),
          )),
    );
  }

  _addTaskBar() {
    _taskController.getTasks();

    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "radhe radhe",
                  style: TextStyle(
                      color: ThemeService().theme == ThemeMode.light
                          ? Colors.pinkAccent
                          : Colors.yellowAccent,
                      fontSize: 22,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  "${DateFormat.yMMMMd().format(DateTime.now())} ",
                  style: subHeadingStyle,
                ),
                Text(
                  "Today",
                  style: headingStyle,
                )
              ],
            ),
          ),
          Button(
              label: "+Addd to task",
              onTap: () async {
                await Get.to(const AddTask());
              }),
//
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          ThemeService().swithTheme();
          notifyHelper.displayNotification(
              title: "theme changed",
              body: Get.isDarkMode
                  ? "Activated Dark Theme"
                  : "Activated Light theme");

          notifyHelper.scheduledNotification();
        },
        child: Icon(
          ThemeService().theme == ThemeMode.dark
              ? Icons.wb_sunny_outlined
              : Icons.nightlight_round,
          size: 20,
          color: ThemeService().theme == ThemeMode.dark
              ? Colors.white
              : Colors.black,
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage("images/profile.png"),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }

  _showTasks() {
    _taskController.getTasks();
    return Expanded(
      child: Obx(() {
        return ListView.builder(
            itemCount: _taskController.taskList.length,
            itemBuilder: (__, index) {
              Task task = _taskController.taskList[index];
              print(task.toJson());
              print(_taskController.taskList.length);

              if (task.repeat == 'Daily') {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  child: SlideAnimation(
                      child: FadeInAnimation(
                    child: Row(children: [
                      GestureDetector(
                          onTap: () {
                            _showBottomSheet(context, task);
                          },
                          child: TaskTile(task))
                    ]),
                  )),
                );
              }
              if (task.date == DateFormat.yMd().format(_selectedDate)) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  child: SlideAnimation(
                      child: FadeInAnimation(
                    child: Row(children: [
                      GestureDetector(
                          onTap: () {
                            _showBottomSheet(context, task);
                          },
                          child: TaskTile(task))
                    ]),
                  )),
                );
              } else {
                return Container();
              }
            });
      }),
    );
  }

  _showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(Container(
      padding: const EdgeInsets.only(top: 4),
      height: task.isCompleted == 1
          ? MediaQuery.of(context).size.height * 0.24
          : MediaQuery.of(context).size.height * 0.32,
      color:
          ThemeService().theme == ThemeMode.dark ? darkGreyClr : Colors.white,
      child: Column(
        children: [
          Container(
            height: 6,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ThemeService().theme == ThemeMode.dark
                  ? Colors.grey[600]
                  : Colors.grey[300],
            ),
          ),
          Spacer(),
          task.isCompleted == 1
              ? Container()
              : _bottomSheetButton(
                  label: "Task completed ",
                  onTap: () {
                    _taskController.markTaskCompleted(task.id!);
                    Get.back();
                  },
                  clr: primaryClr,
                  context: context),
          _bottomSheetButton(
              label: "Delete Task ",
              onTap: () {
                _taskController.delete(task);
                // _taskController.getTasks();

                Get.back();
              },
              clr: Colors.red[300]!,
              context: context),
          SizedBox(
            height: 20,
          ),
          _bottomSheetButton(
              label: "Close ",
              onTap: () {
                Get.back();
              },
              isClose: true,
              clr: Colors.red[300]!,
              context: context),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    ));
  }

  _bottomSheetButton(
      {required String label,
      required Function()? onTap,
      required Color clr,
      bool isClose = false,
      required BuildContext context}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 55,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Center(
            child: Text(
          label,
          style:
              isClose ? titleStyle : titleStyle.copyWith(color: Colors.white),
        )),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              width: 2,
              color: isClose == true
                  ? ThemeService().theme == ThemeMode.dark
                      ? Colors.grey[600]!
                      : Colors.grey[300]!
                  : clr),
          color: isClose == true ? Colors.transparent : clr,
        ),
      ),
    );
  }
}

// Center(
//           child: Text("radhe radhe !",
//             style: TextStyle(fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.redAccent),
//           ),

//         ),
//       ),
