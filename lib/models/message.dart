import 'package:p2p_chat/models/user.dart';

class Message {
  final User sender;
  final String time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/images/log.png',
);

// USERS
final User anoop = User(
  id: 1,
  name: 'Anoop',
  imageUrl: 'assets/images/log.png',
);
final User nabil = User(
  id: 2,
  name: 'Nabil',
  imageUrl: 'assets/images/log.png',
);
final User ashiq = User(
  id: 3,
  name: 'Ashiq',
  imageUrl: 'assets/images/log.png',
);

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: anoop,
    time: '5:30 PM',
    text: 'Any plan for today?',
    isLiked: false,
    unread: true,
  ),

  Message(
    sender: nabil,
    time: '3:30 PM',
    text: 'Any plan for today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: ashiq,
    time: '11:30 AM',
    text: 'Any plan for today?',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Any plan for today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: anoop,
    time: '5:30 PM',
    text: 'fine',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'fine..wt abt u?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: anoop,
    time: '3:15 PM',
    text: 'How r u?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Hello there',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: anoop,
    time: '2:00 PM',
    text: 'Hai...',
    isLiked: false,
    unread: true,
  ),
];
