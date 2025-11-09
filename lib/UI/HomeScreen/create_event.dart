import 'package:evently/UI/HomeScreen/event_tap_item_for_create_event.dart';
import 'package:evently/UI/Widgets/custom_elevated_bottom.dart';
import 'package:evently/UI/Widgets/custom_text_feild.dart';
import 'package:evently/UI/Widgets/event_date_or_time.dart';
import 'package:evently/Utils/app_assets.dart';
import 'package:evently/Utils/app_colors.dart';
import 'package:evently/Utils/app_styles.dart';
import 'package:evently/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});
  static const String routeName = '/create_event';

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  int selectedIndex = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String dateFormatted = "";
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // categories list
    List<String> categories = [
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];

    List<String> imageSelectedEventList = [
      AppAssets.sport,
      AppAssets.birthday,
      AppAssets.meeting,
      AppAssets.gaming,
      AppAssets.workshop,
      AppAssets.bookClub,
      AppAssets.exhibition,
      AppAssets.holiday,
      AppAssets.eating,
    ];

    String selectedImage = imageSelectedEventList[selectedIndex];
    String selectedEventName = categories[selectedIndex];
    // get device width and height
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    // design width and height
    var designWidth = 393;
    var designHeight = 841;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.create_event,
          style: AppStyles.regular24Primary,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryLight),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: (16 / designWidth) * width,
            vertical: (16 / designHeight) * height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(selectedImage),
              ),
              SizedBox(height: (16 / designHeight) * height),
              DefaultTabController(
                length: categories.length,
                child: TabBar(
                  onTap: (index) {
                    selectedIndex = index;
                    setState(() {});
                  },
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  indicatorColor: AppColors.transparentColor,
                  dividerColor: AppColors.transparentColor,
                  labelPadding: EdgeInsets.zero,
                  tabs: categories.map((category) {
                    return EventItemTapForCreateEvent(
                      eventType: category,
                      isSelected: selectedIndex == categories.indexOf(category),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 16 / designHeight * height),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.title,
                      style: AppStyles.medium16Black,
                    ),
                    SizedBox(height: 8 / designHeight * height),
                    CustomTextFeild(
                      controller: titleController,
                      hintText: AppLocalizations.of(context)!.event_title,
                      prefixIcon: Image.asset(AppAssets.noteEditIc),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "Please enter enter title. ";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16 / designHeight * height),
                    Text(
                      AppLocalizations.of(context)!.description,
                      style: AppStyles.medium16Black,
                    ),
                    SizedBox(height: 8 / designHeight * height),
                    CustomTextFeild(
                      controller: descriptionController,
                      hintText: AppLocalizations.of(context)!.event_description,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "Please enter enter description. ";
                        }
                      },
                    ),
                    SizedBox(height: 16 / designHeight * height),
                    EventDateOrTime(
                      iconDateOrTime: AppAssets.calendarDayIc,
                      eventDateOrTime: AppLocalizations.of(context)!.event_date,
                      chooseDateOrTime: selectedDate == null
                          ? AppLocalizations.of(context)!.choose_date
                          : dateFormatted,
                      onPressed: chooseDate,
                    ),
                    EventDateOrTime(
                      iconDateOrTime: AppAssets.clockIc,
                      eventDateOrTime: AppLocalizations.of(context)!.event_time,
                      chooseDateOrTime: selectedTime == null
                          ? AppLocalizations.of(context)!.choose_time
                          : selectedTime!.format(context),
                      onPressed: chooseTime,
                    ),
                    SizedBox(height: 16 / designHeight * height),
                    Text(
                      AppLocalizations.of(context)!.location,
                      style: AppStyles.medium16Black,
                    ),
                    SizedBox(height: 16 / designHeight * height),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8 / designWidth * width,
                          vertical: 8 / designHeight * height,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.primaryLight,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Image.asset(AppAssets.locationWithGroundIc),
                            SizedBox(width: 8 / designWidth * width),
                            Text(
                              "Cairo, Egypt",
                              style: AppStyles.medium16Primary,
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.primaryLight,
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16 / designHeight * height),
                    CustomElevatedBottom(
                      onPressed: addEvent,
                      text: AppLocalizations.of(context)!.add_event,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addEvent() {
    if (formKey.currentState?.validate() == true) {}
    setState(() {});
  }

  void chooseDate() async {
    var chooseDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    selectedDate = chooseDate;
    dateFormatted = DateFormat('dd/MM/yyyy').format(selectedDate!);
    setState(() {});
  }

  void chooseTime() async {
    var chooseTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    selectedTime = chooseTime;
    setState(() {});
  }
}
