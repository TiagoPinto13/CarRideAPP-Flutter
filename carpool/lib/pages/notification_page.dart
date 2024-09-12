import 'dart:async';

import 'package:carpool/datamodel/search_input.dart';
import 'package:carpool/datamodel/user.dart';
import 'package:carpool/log_in/auth_middleware.dart';
import 'package:carpool/pages/chat_page.dart';
import 'package:carpool/utils/strings/managers/strings_managers.dart';
import 'package:carpool/utils/strings/strings_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../datamodel/ride.dart';

import '../theme/app_colors.dart';
import '../theme/app_style.dart';
import 'notifications_page/notification_page_logic.dart';

class NotificationPage extends StatefulWidget {
  static const routeName = '/notificationPage';
  final bool isDarkMode;
  const NotificationPage({super.key, required this.isDarkMode});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationPageLogic(isDarkMode: widget.isDarkMode),
      child: _BuildNotificationPage(isDarkMode: widget.isDarkMode),
    );
  }
}

class _BuildNotificationPage extends StatefulWidget {
  final bool isDarkMode;

  _BuildNotificationPage({required this.isDarkMode});

  @override
  _BuildNotificationPageState createState() => _BuildNotificationPageState();
}

class _BuildNotificationPageState extends State<_BuildNotificationPage> {
  final TextEditingController _messageController = TextEditingController();
  late NotificationPageLogic logic;
  int _rating = 0;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    logic = context.read<NotificationPageLogic>();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }


  void _showSnackBarSuccess(BuildContext context, String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: message,
        backgroundColor: AppColors.eighthColor,
      ),
    );
  }

  void _showSnackBarError(BuildContext context, String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: message,
        backgroundColor: AppColors.sixthColor,
      ),
    );
  }

  Widget _buildJoinRideNotification(
      {required MyUser user,
      required Ride ride,
      required int numPass,
      required String id,
      required String timeAgo}) {
    int availableSeats = ride.maxPassengers;
    ride.passengers.forEach((key, value) {
      availableSeats -= value as int;
    });

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: AppColors.secondColor,
      margin: EdgeInsets.all(10),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          "${user.name[0].toUpperCase()}${user.name.substring(1)} wants to join a ride",
          style: TextStyle(
              fontSize: 17,
              color: AppColors.ninthColor,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          timeAgo,
          style: const TextStyle(fontSize: 12),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (user.ratingAsPassenger! > 0)
                  Row(
                    children: [
                      Text("Rating as passenger: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Text("${user.ratingAsPassenger!.toStringAsFixed(1)}/5.0",
                          style: TextStyle(fontSize: 16)),
                      const Icon(
                        Icons.star_outlined,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Ride scheduled for: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: "${ride.date} at ${ride.hour}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "From: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: "${ride.startingPoint}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "To: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: "${ride.destination}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Number of seats requested: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: "${numPass}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Number of seats allocated: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: "${ride.maxPassengers - availableSeats}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Number of seats available: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: "$availableSeats",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.fifthColor),
                            onPressed: () async {
                              if (await logic.sendReplyJoinRideNotification(
                                senderId: AuthMiddleware.getUserId(context)!,
                                receiverId: user.id,
                                rideId: ride.id,
                                numPass: numPass,
                                type: 3,
                                notificationId: id,
                              )) {
                                _showSnackBarSuccess(
                                    context, "Accepted request");
                              } else {
                                _showSnackBarError(
                                    context, "Failed to accept request");
                              }
                            },
                            child: Text(
                              "Accept",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.fifthColor),
                            onPressed: () async {
                              if (await logic.sendReplyJoinRideNotification(
                                senderId: AuthMiddleware.getUserId(context)!,
                                receiverId: user.id,
                                rideId: ride.id,
                                numPass: numPass,
                                type: 2,
                                notificationId: id,
                              )) {
                                _showSnackBarSuccess(
                                    context, "Declined request");
                              } else {
                                _showSnackBarError(
                                    context, "Failed to decline request");
                              }
                            },
                            child: Text(
                              "Decline",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.fifthColor),
                      onPressed: () async {
                        MyUser? currentUser = await AuthMiddleware.getUser(
                            AuthMiddleware.getUserId(context)!);
                        Navigator.pushNamed(
                          context,
                          ChatPage.routeName,
                          arguments: ContactDriver(
                            senderId: currentUser!.id,
                            senderName: currentUser.name,
                            receiverName: user.name,
                            receiverId: user.id,
                          ),
                        );
                      },
                      child: Text(
                        "Contact User",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJoinRideDeclinedNotification(
      {required MyUser user,
      required Ride ride,
      required String id,
      required String timeAgo}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: AppColors.secondColor,
      margin: EdgeInsets.all(10),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: AppColors.secondColor,
        title: Text(
          "${user.name[0].toUpperCase()}${user.name.substring(1)} has declined your request!",
          style: TextStyle(
              fontSize: 17,
              color: AppColors.ninthColor,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          timeAgo,
          style: const TextStyle(fontSize: 12),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            logic.removeNotification(
                userId: AuthMiddleware.getUserId(context)!, notificationId: id);
          },
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Ride scheduled for: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: "${ride.date} at ${ride.hour}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "From: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: "${ride.startingPoint}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "To: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: "${ride.destination}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.fifthColor),
                      onPressed: () async {
                        MyUser? currentUser = await AuthMiddleware.getUser(
                            AuthMiddleware.getUserId(context)!);
                        Navigator.pushNamed(
                          context,
                          ChatPage.routeName,
                          arguments: ContactDriver(
                            senderId: currentUser!.id,
                            senderName: currentUser.name,
                            receiverName: user.name,
                            receiverId: user.id,
                          ),
                        );
                      },
                      child: Text(
                        "Contact User",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJoinRideAcceptedNotification(
      {required MyUser user,
      required Ride ride,
      required String id,
      required String timeAgo}) {
    return Card(
      color: AppColors.secondColor,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: AppColors.secondColor,
        title: Text(
          "${user.name[0].toUpperCase()}${user.name.substring(1)} has accepted your request!",
          style: TextStyle(
              fontSize: 17,
              color: AppColors.ninthColor,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          timeAgo,
          style: const TextStyle(fontSize: 12),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            logic.removeNotification(
                userId: AuthMiddleware.getUserId(context)!, notificationId: id);
          },
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Ride scheduled for: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: "${ride.date} at ${ride.hour}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "From: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: "${ride.startingPoint}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "To: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: "${ride.destination}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.fifthColor),
                      onPressed: () async {
                        MyUser? currentUser = await AuthMiddleware.getUser(
                            AuthMiddleware.getUserId(context)!);
                        Navigator.pushNamed(
                          context,
                          ChatPage.routeName,
                          arguments: ContactDriver(
                            senderId: currentUser!.id,
                            senderName: currentUser.name,
                            receiverName: user.name,
                            receiverId: user.id,
                          ),
                        );
                      },
                      child: Text(
                        "Contact User",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCancelledRideNotification(
      {required MyUser user,
      required CancelRideNotification notification,
      required String id,
      required String timeAgo}) {
    return Card(
      color: AppColors.secondColor,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: AppColors.secondColor,
        title: Text(
          "${user.name[0].toUpperCase()}${user.name.substring(1)} has cancelled the ride!",
          style: TextStyle(
              fontSize: 17,
              color: AppColors.ninthColor,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          timeAgo,
          style: const TextStyle(fontSize: 12),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            logic.removeNotification(
                userId: AuthMiddleware.getUserId(context)!, notificationId: id);
          },
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Ride scheduled for: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: "${notification.date} at ${notification.hour}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "From: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: "${notification.from}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "To: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: "${notification.to}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Seats previously reserved: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: "${notification.seats}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.fifthColor),
                      onPressed: () async {
                        MyUser? currentUser = await AuthMiddleware.getUser(
                            AuthMiddleware.getUserId(context)!);
                        Navigator.pushNamed(
                          context,
                          ChatPage.routeName,
                          arguments: ContactDriver(
                            senderId: currentUser!.id,
                            senderName: currentUser.name,
                            receiverName: user.name,
                            receiverId: user.id,
                          ),
                        );
                      },
                      child: Text(
                        "Contact User",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWithdrawNotification(
      {required MyUser user,
      required Ride ride,
      required int numPass,
      required String id,
      required String timeAgo}) {
    int availableSeats = ride.maxPassengers;
    ride.passengers.forEach((key, value) {
      availableSeats -= value as int;
    });
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: AppColors.secondColor,
      margin: EdgeInsets.all(10),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          "${user.name[0].toUpperCase()}${user.name.substring(1)} has withdrawn from the ride",
          style: TextStyle(
              fontSize: 17,
              color: AppColors.ninthColor,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          timeAgo,
          style: const TextStyle(fontSize: 12),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            logic.removeNotification(
                userId: AuthMiddleware.getUserId(context)!, notificationId: id);
          },
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Ride scheduled for: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: "${ride.date} at ${ride.hour}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "From: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: "${ride.startingPoint}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "To: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: "${ride.destination}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Number of seats allocated: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: "${ride.maxPassengers - availableSeats}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Number of seats available: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: "$availableSeats",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmRideNotification(
      {required MyUser user,
      required String from,
      required String to,
      required String date,
      required String hour,
      required int numPass,
      required String timeAgo,
      required String id,
      required bool rated}) {
    return Card(
      color: AppColors.secondColor,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: AppColors.secondColor,
        title: Text(
          '${user.name[0].toUpperCase()}${user.name.substring(1)} ${StringsManager.instance.getString(context, notification_page_has_confirmed_the_ride)}',
          style: TextStyle(
              fontSize: 17,
              color: AppColors.ninthColor,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              timeAgo,
              style: const TextStyle(fontSize: 12),
            ),
            if (!rated)
              Row(
                children: [
                  Text(StringsManager.instance.getString(context, notification_page_rate_driver)),
                  SizedBox(width: 10),
                  Row(
                    children: List.generate(5, (index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _rating = index + 1;
                          });
                        },
                        child: Icon(
                          index < _rating ? Icons.star : Icons.star_border,
                          color: index < _rating ? Colors.yellow : Colors.grey,
                        ),
                      );
                    }),
                  ),
                  IconButton(
                      onPressed: () async {
                        if (await logic.rateDriver(
                            driverId: user.id,
                            notificationId: id,
                            userId: AuthMiddleware.getUserId(context)!,
                            rating: _rating,
                            date: date,
                            from: from,
                            to: to,
                            hour: hour)) {
                          _showSnackBarSuccess(context,StringsManager.instance.getString(context, notification_page_rating_sent));
                          setState(() {
                            _rating = 0;
                          });
                        } else {
                          _showSnackBarError(context, StringsManager.instance.getString(context, notification_page_error_sending_rating));
                        }
                      },
                      icon: const Icon(Icons.confirmation_num_sharp))
                ],
              ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            logic.removeNotification(
                userId: AuthMiddleware.getUserId(context)!, notificationId: id);
          },
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: StringsManager.instance.getString(context, notification_page_ride_was_done),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: "$date ${StringsManager.instance.getString(context, notification_page_at)} $hour",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:StringsManager.instance.getString(context, notification_page_from),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: from,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: StringsManager.instance.getString(context, notification_page_to),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: to,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.fifthColor),
                      onPressed: () async {
                        MyUser? currentUser = await AuthMiddleware.getUser(
                            AuthMiddleware.getUserId(context)!);
                        Navigator.pushNamed(
                          context,
                          ChatPage.routeName,
                          arguments: ContactDriver(
                            senderId: currentUser!.id,
                            senderName: currentUser.name,
                            receiverName: user.name,
                            receiverId: user.id,
                          ),
                        );
                      },
                      child:  Text(
                        StringsManager.instance.getString(context, notification_contact_user),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingReceivedNotification(
      {required MyUser user,
      required RatingReceived ratingNotification,
      required String timeAgo,
      required String notificationId}) {
    return Card(
      color: AppColors.secondColor,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: AppColors.secondColor,
        title: Text(
          "${user.name[0].toUpperCase()}${user.name.substring(1)} ${StringsManager.instance.getString(context, notification_page_rated)}",
          style: const TextStyle(
              fontSize: 17,
              color: AppColors.ninthColor,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < ratingNotification.rating
                      ? Icons.star
                      : Icons.star_border,
                  color: index < ratingNotification.rating
                      ? Colors.yellow
                      : Colors.grey,
                );
              }),
            ),
            Text(
              timeAgo,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            logic.removeNotification(
                userId: AuthMiddleware.getUserId(context)!,
                notificationId: notificationId);
          },
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: StringsManager.instance.getString(context, notification_page_ride_was_done),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text:
                            "${ratingNotification.date} ${StringsManager.instance.getString(context, notification_page_at)} ${ratingNotification.hour}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: StringsManager.instance.getString(context, notification_page_from),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: ratingNotification.from,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: StringsManager.instance.getString(context, notification_page_to),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: ratingNotification.to,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.fifthColor),
                      onPressed: () async {
                        MyUser? currentUser = await AuthMiddleware.getUser(
                            AuthMiddleware.getUserId(context)!);
                        Navigator.pushNamed(
                          context,
                          ChatPage.routeName,
                          arguments: ContactDriver(
                            senderId: currentUser!.id,
                            senderName: currentUser.name,
                            receiverName: user.name,
                            receiverId: user.id,
                          ),
                        );
                      },
                      child:  Text(
                        StringsManager.instance.getString(context, notification_contact_user),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<Widget> _buildNotificationItem(DocumentSnapshot doc) async {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    int type = data['type'];
    Timestamp timestamp = data['timestamp'];
    Map<String, dynamic> map = data['text'];
    String id = doc.id;

    DateTime now = DateTime.now();
    Duration difference = now.difference(timestamp.toDate());
    String timeAgo = _formatTimeAgo(context,difference);

    if (type == 1) {
      JoinRideNotification joinRide = JoinRideNotification.fromMap(map);
      MyUser? user = await AuthMiddleware.getUser(joinRide.otherId);
      int numPass = joinRide.numPassengers;
      Ride? ride = await logic.getRide(rideId: joinRide.rideId);

      if (user != null && ride != null) {
        MapEntry<double, int> rating =
            await logic.getPassengerRating(passengerId: user.id);
        user.ratingAsPassenger = rating.key;
        return _buildJoinRideNotification(
            user: user, ride: ride, numPass: numPass, id: id, timeAgo: timeAgo);
      }
    } else if (type == 2) {
      ReplyJoinRideNotification replyNotification =
          ReplyJoinRideNotification.fromMap(map);
      MyUser? user = await AuthMiddleware.getUser(replyNotification.userId);
      Ride? ride = await logic.getRide(rideId: replyNotification.rideId);

      if (user != null && ride != null) {
        return _buildJoinRideDeclinedNotification(
            user: user, ride: ride, id: id, timeAgo: timeAgo);
      }
    } else if (type == 3) {
      ReplyJoinRideNotification replyNotification =
          ReplyJoinRideNotification.fromMap(map);
      MyUser? user = await AuthMiddleware.getUser(replyNotification.userId);

      Ride? ride = await logic.getRide(rideId: replyNotification.rideId);

      if (user != null && ride != null) {
        return _buildJoinRideAcceptedNotification(
            user: user, ride: ride, id: id, timeAgo: timeAgo);
      }
    } else if (type == 4) {
      CancelRideNotification cancelRideNotification =
          CancelRideNotification.fromMap(map);
      MyUser? user =
          await AuthMiddleware.getUser(cancelRideNotification.userId);

      if (user != null) {
        return _buildCancelledRideNotification(
            user: user,
            notification: cancelRideNotification,
            id: id,
            timeAgo: timeAgo);
      }
    } else if (type == 5) {
      JoinRideNotification joinRide = JoinRideNotification.fromMap(map);
      MyUser? user = await AuthMiddleware.getUser(joinRide.otherId);
      int numPass = joinRide.numPassengers;
      Ride? ride = await logic.getRide(rideId: joinRide.rideId);

      if (user != null && ride != null) {
        return _buildWithdrawNotification(
            user: user, ride: ride, numPass: numPass, id: id, timeAgo: timeAgo);
      }
    } else if (type == 6) {
      ConfirmRideNotification confirmRide =
          ConfirmRideNotification.fromMap(map);
      MyUser? user = await AuthMiddleware.getUser(confirmRide.userId);

      if (user != null) {
        return _buildConfirmRideNotification(
          user: user,
          from: confirmRide.from,
          to: confirmRide.to,
          date: confirmRide.date,
          hour: confirmRide.hour,
          numPass: confirmRide.seats,
          id: id,
          timeAgo: timeAgo,
          rated: confirmRide.driverRating,
        );
      }
    } else if (type == 7) {
      RatingReceived r = RatingReceived.fromMap(map);
      MyUser? user = await AuthMiddleware.getUser(r.userId);

      if (user != null) {
        return _buildRatingReceivedNotification(
            user: user,
            ratingNotification: r,
            notificationId: id,
            timeAgo: timeAgo);
      }
    }
    return SizedBox();
  }

  Widget _buildNotificationList() {
    return StreamBuilder(
      stream: logic.getNotification(id: AuthMiddleware.getUserId(context)!),
      builder: (context, snapshots) {
        if (snapshots.hasError) {
          return Text(
              StringsManager.instance.getString(context, chat_page_error));
        }

        if (snapshots.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshots.data!.docs.isEmpty) {
          return Center(
            child: Text(
              StringsManager.instance.getString(context, notification_page_no_notifications),
              style: TextStyle(fontSize: 18),
            ),
          );
        }

        return ListView(
          controller: _scrollController,
          children: snapshots.data!.docs.map((doc) {
            return FutureBuilder(
              future: _buildNotificationItem(doc),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  return snapshot.data as Widget;
                }
              },
            );
          }).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              widget.isDarkMode ? AppColors.tenthColor : AppColors.fifthColor,
          centerTitle: true,
          title: Text(StringsManager.instance.getString(context, notification_page_notifications),
              style: widget.isDarkMode ? AppStyle.h1Dark : AppStyle.h1Light),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: widget.isDarkMode ? Colors.white : AppColors.tenthColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: _buildNotificationList(),
            ),
          ],
        ));
  }
}

String _formatTimeAgo(BuildContext context,Duration difference) {
  if (difference.inSeconds < 60) {
    return StringsManager.instance.getString(context, notification_page_just_now);
  } else if (difference.inMinutes < 60) {
    return "${difference.inMinutes} ${StringsManager.instance.getString(context, notification_page_min_ago)}";
  } else if (difference.inHours < 24) {
    return "${difference.inHours} ${StringsManager.instance.getString(context, notification_page_hour)} ${difference.inHours > 1 ? "s" : ""} ${StringsManager.instance.getString(context, notification_page_ago)}";
  } else if (difference.inDays < 30) {
    return "${difference.inDays} ${StringsManager.instance.getString(context, notification_page_day)}${difference.inDays > 1 ? "s" : ""} ${StringsManager.instance.getString(context, notification_page_ago)}";
  } else {
    DateTime dateTime = DateTime.now().subtract(difference);
    return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  }
}
