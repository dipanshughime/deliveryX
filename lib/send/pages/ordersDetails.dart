import 'package:deliveryx/send/pages/orderDetails_reciever.dart';
import 'package:flutter/material.dart';

import '../components/sender_location.dart';
import 'orderdetails_sender.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({
    super.key,
  });

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  // @override
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Wrap(children: [
              SenderLocationInfo(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TabBar(
                        unselectedLabelColor: Colors.black,
                        labelColor: Colors.purple,
                        indicatorColor: Colors.white,
                        indicatorWeight: 2,
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        // controller: tabController,
                        tabs: [
                          Tab(
                            text: 'Senders Info',
                          ),
                          Tab(
                            text: 'Recievers Info',
                          ),
                        ]),
                  ),
                ),
              ),
              // SingleChildScrollView(child: OrderDetails_Sender()),
              // Expanded(child: Text('hello'))
              Expanded(
                  child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                      height: 500,
                      child: TabBarView(children: [
                        SingleChildScrollView(child: OrderDetails_Sender()),
                        SingleChildScrollView(child: OrderDetails_Reciever())
                      ]))),
              Center(
                child: SizedBox(
                  height: 50,
                  child: TextButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Text('Enter Package Details'),
                    ),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.purple),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        fixedSize:
                            MaterialStateProperty.all(Size.fromHeight(30))),
                  ),
                ),
              )
              //     Expanded(s
              //       child: TabBarView(
              //         // controller: tabsController,
              //         children: [OrderDetails_Sender(), OrderDetails_Reciever()],
              //       ),
              //     ),

              //     // const OrderDetails_Sender(),
              //     // ElevatedButton(onPressed:  , child: const Text('Enter Recievers Details',style:TextStyle(backgroundColor: Colors.purple)))
            ]),
          ),
        ),
      ),
    );
  }
}

class TabBarStatus extends StatefulWidget {
  const TabBarStatus({
    super.key,
  });

  @override
  State<TabBarStatus> createState() => _TabBarStatusState();
}

class _TabBarStatusState extends State<TabBarStatus>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: TabBar(
                unselectedLabelColor: Colors.white70,
                labelColor: Colors.black,
                indicatorColor: Colors.white,
                indicatorWeight: 2,
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                controller: tabController,
                tabs: [
                  Tab(
                    text: 'Senders Info',
                  ),
                  Tab(
                    text: 'Recievers Info',
                  ),
                ]),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Expanded(
            child: TabBarView(
              controller: tabController,
              children: [OrderDetails_Sender(), OrderDetails_Reciever()],
            ),
          ),
        ),
      ]),
    );
  }
}
