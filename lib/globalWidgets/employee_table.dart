import 'package:flutter/material.dart';
import 'package:plotrol/model/response/employee_response/employee_search_response.dart';

import '../controller/order_details_controlller.dart';

class EmployeeTable extends StatefulWidget {
  final List<Employee> employees;
  final OrderDetailsController controller;

  const EmployeeTable({
    Key? key,
    required this.employees,
    required this.controller,
  }) : super(key: key);

  @override
  State<EmployeeTable> createState() => _EmployeeTableState();
}

class _EmployeeTableState extends State<EmployeeTable> {
  String searchQuery = '';

  bool isValidMobileNumber(String input) {
    return RegExp(r'^\d{10}$').hasMatch(input);
  }

  @override
  Widget build(BuildContext context) {
    final filteredEmployees = widget.employees.where((employee) {
      final name = employee.user?.name?.toLowerCase() ?? '';
      final mobile = employee.user?.mobileNumber ?? '';

      if (isValidMobileNumber(searchQuery)) {
        return mobile.contains(searchQuery);
      } else {
        return name.contains(searchQuery.toLowerCase());
      }
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Search by name or 10-digit mobile',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
            keyboardType: TextInputType.text,
            onChanged: (value) {
              setState(() {
                searchQuery = value.trim();
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            border: TableBorder.all(color: Colors.grey.shade300),
            columnWidths: const {
              0: FlexColumnWidth(2),
              1: FlexColumnWidth(2),
              2: FlexColumnWidth(1.2),
            },
            children: [
              const TableRow(
                decoration: BoxDecoration(color: Color(0xFFECECEC)),
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Name',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Mobile Number',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Action',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              ...filteredEmployees.map(
                (employee) => TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(employee.user?.name ?? '-'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(employee.user?.mobileNumber ?? '-'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: IconButton(
                        icon: Icon(
                          widget.controller.selectedAssignee == employee
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color:  widget.controller.selectedAssignee == employee ? Colors.green : Colors.black,
                        ),
                        iconSize: 20,
                        onPressed: () {
                          setState(() {
                            widget.controller.selectAssignee(employee);
                          });
                        },
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(4.0),
                    //   child: SizedBox(
                    //     height: 30,
                    //     child: TextButton(
                    //       style: TextButton.styleFrom(
                    //         padding: const EdgeInsets.symmetric(horizontal: 12),
                    //         minimumSize: Size.zero,
                    //         tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    //         backgroundColor: Colors.black,
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(4),
                    //         ),
                    //       ),
                    //       onPressed: () {
                    //         widget.controller.selectAssignee(employee);
                    //       },
                    //       child: const Text(
                    //         'Assign',
                    //         style: TextStyle(fontSize: 12, color: Colors.white),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
