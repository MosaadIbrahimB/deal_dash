import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:dealdash/core/widget/product_details.dart';
import 'package:dealdash/feature/notification/data/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../logic/notification_cubit.dart';

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;

  const NotificationCard({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          if (notification.readAt == null) {
            context.read<NotificationCubit>().setNotificationAsRead(notification.id);
          }
          // Navigate to Offer Screen with the offerDetails passed
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetails(
                product: notification.data, // Assuming offer is passed
              ),
            ),
          );
        },
        child: Container(
          width: double.infinity, // Ensures the container covers full width
          decoration: BoxDecoration(
            color: notification.readAt != null
                ? ColorManager.gray
                : Colors.blue.withOpacity(0.1), // Blue background for unread
             borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding( // Add padding inside the container to control content padding
            padding: const EdgeInsets.all(12.0), // Adjust as needed
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Notification Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    notification.data.image ,
                    height: 80,
                    width: 75,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(width: 12),
        
                // Notification Title and Description
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification.data.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: notification.readAt != null
                              ? Colors.black
                              : Colors.blue, // Blue text for unread
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        notification.data.about,
                        style: TextStyle(
                          color: notification.readAt != null
                              ? Colors.grey[600]
                              : Colors.black, // Darker color for unread
                        ),
                      ),
                    ],
                  ),
                ),
        
                // Time and Unread Blue Dot
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Time Text
                    Text(
                      timeago.format(notification.data.createdAt),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Blue Dot for unread notifications
                    if (notification.readAt == null)
                      Container(
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
