import 'package:flutter/material.dart';
import 'package:hacktoon/presentation/home/view/widgets/build_text_field.dart';

class AddNewPlan extends StatefulWidget {
  const AddNewPlan({super.key});

  @override
  State<AddNewPlan> createState() => _AddNewPlanState();
}

class _AddNewPlanState extends State<AddNewPlan> {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController daysController = TextEditingController();
  final TextEditingController purposeController = TextEditingController();
  final TextEditingController moneyController = TextEditingController();

  @override
  void dispose() {
    fromController.dispose();
    toController.dispose();
    daysController.dispose();
    purposeController.dispose();
    moneyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Travel Plan"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            BuildTextField(label : "From country", controller : fromController),
            const SizedBox(height: 12),
            BuildTextField(label : "To country", controller : toController),
            const SizedBox(height: 12),
            BuildTextField(label : "Days", controller : daysController, isNumber: true),
            const SizedBox(height: 12),
            BuildTextField(label : "For what (purpose)", controller : purposeController),
            const SizedBox(height: 12),
            BuildTextField(label : "Money",controller : moneyController, isNumber: true),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      // Get values
                      final from = fromController.text;
                      final to = toController.text;
                      final days = daysController.text;
                      final purpose = purposeController.text;
                      final money = moneyController.text;

                      // For now just show them
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text("Travel Plan"),
                          content: Text(
                            "From: $from\n"
                            "To: $to\n"
                            "Days: $days\n"
                            "For: $purpose\n"
                            "Money: $money",
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Ok",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  
}
