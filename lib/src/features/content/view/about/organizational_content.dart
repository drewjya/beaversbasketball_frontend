// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:beaverbasketball/src/src.dart';

class OrganizationChart extends StatelessWidget {
  final Employee rootEmployee;

  OrganizationChart({required this.rootEmployee});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: BACKGROUND_CONTENT,
      child: FittedBox(child: EmployeeChart(employee: rootEmployee)),
    );
  }

  Widget buildEmployeeNode(Employee employee) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildEmployeeCard(employee),
          SizedBox(
            height: 20,
          ),
          if (employee.subordinates.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: employee.subordinates
                  .map((subordinate) => buildEmployeeNode(subordinate))
                  .toList(),
            ),
        ],
      ),
    );
  }

  Widget buildEmployeeCard(Employee employee) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            employee.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            employee.position,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class Employee {
  final String name;
  final String position;
  final String? asset;
  final List<Employee> subordinates;
  bool? get isUrl => asset?.contains("http");

  Employee({
    required this.name,
    required this.position,
    this.asset,
    this.subordinates = const [],
  });
}

class EmployeeChart extends StatelessWidget {
  final Employee employee;
  const EmployeeChart({
    Key? key,
    required this.employee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: (employee.subordinates.isNotEmpty)
              ? Border.all(color: Colors.white)
              : null),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          EmployeeCard(employee: employee),
          SizedBox(
            height: 50,
          ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var i = 0; i < employee.subordinates.length; i++)
                  Builder(
                    builder: (context) {
                      return Row(
                        children: [
                          EmployeeChart(employee: employee.subordinates[i]),
                          if (i != (employee.subordinates.length - 1))
                            SizedBox(
                              width: 50,
                            )
                        ],
                      );
                    },
                  )
              ]),
        ],
      ),
    );
  }
}

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({
    super.key,
    required this.employee,
  });

  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        color: NAVBAR,
      ),
      padding: EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: employee.asset != null
                  ? Image(
                      image: (employee.isUrl!
                          ? NetworkImage(employee.asset!)
                          : AssetImage(employee.asset!) as ImageProvider),
                      fit: BoxFit.cover,
                    )
                  : SizedBox()),
          employee.name.toWidget(textAlign: TextAlign.center),
          employee.position.toWidget(textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
