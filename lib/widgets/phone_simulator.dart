// import 'package:flutter/material.dart';
//
// class PhoneSimulator extends StatefulWidget {
//   const PhoneSimulator({Key? key}) : super(key: key);
//
//   @override
//   State<PhoneSimulator> createState() => _PhoneSimulatorState();
// }
//
// class _PhoneSimulatorState extends State<PhoneSimulator> {
//   String _simulatedAppId = 'infier';
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 290,
//       height: 540,
//       decoration: BoxDecoration(
//         color: const Color(0xFF070A13),
//         borderRadius: BorderRadius.circular(44),
//         border: Border.all(color: Colors.white12, width: 8),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.6),
//             blurRadius: 40,
//             spreadRadius: 8,
//           ),
//           BoxShadow(
//             color: const Color(0xFF3DDC84).withOpacity(0.05),
//             blurRadius: 20,
//             spreadRadius: 2,
//           )
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(36),
//         child: Column(
//           children: [
//             // Speaker/Notch
//             Container(
//               width: 110,
//               height: 22,
//               decoration: const BoxDecoration(
//                 color: Colors.black,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(16),
//                   bottomRight: Radius.circular(16),
//                 ),
//               ),
//               child: Center(
//                 child: Container(
//                   width: 40,
//                   height: 4,
//                   decoration: BoxDecoration(
//                     color: Colors.white12,
//                     borderRadius: BorderRadius.circular(2),
//                   ),
//                 ),
//               ),
//             ),
//             // Simulator Screen Canvas
//             Expanded(
//               child: Container(
//                 margin: const EdgeInsets.all(6),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF0E1322),
//                   borderRadius: BorderRadius.circular(28),
//                 ),
//                 child: Column(
//                   children: [
//                     // System Status bar
//                     const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             '09:41 AM',
//                             style: TextStyle(
//                               fontSize: 10,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'monospace',
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               Icon(Icons.wifi, size: 12, color: Colors.white70),
//                               SizedBox(width: 4),
//                               Icon(Icons.signal_cellular_alt, size: 12, color: Colors.white70),
//                               SizedBox(width: 4),
//                               Icon(Icons.battery_full, size: 12, color: Color(0xFF3DDC84)),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: _getSimulatorAppContent(),
//                     ),
//                     // Device navigation tabs select
//                     Container(
//                       color: Colors.black45,
//                       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           _simTab('Infierms', 'infier', const Color(0xFF3DDC84)),
//                           _simTab('EdaWallet', 'eda', const Color(0xFF8B7CF6)),
//                           _simTab('Ecke', 'ecke', const Color(0xFFFFB84D)),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _simTab(String label, String id, Color activeColor) {
//     final bool isActive = _simulatedAppId == id;
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _simulatedAppId = id;
//         });
//       },
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 250),
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//         decoration: BoxDecoration(
//           color: isActive ? activeColor.withOpacity(0.12) : Colors.transparent,
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(
//             color: isActive ? activeColor.withOpacity(0.4) : Colors.transparent,
//           ),
//         ),
//         child: Text(
//           label,
//           style: TextStyle(
//             fontSize: 9,
//             fontWeight: FontWeight.bold,
//             color: isActive ? Colors.white : Colors.white38,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _getSimulatorAppContent() {
//     switch (_simulatedAppId) {
//       case 'eda':
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Eda Wallet',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF8B7CF6)),
//                   ),
//                   Container(
//                     width: 8,
//                     height: 8,
//                     decoration: const BoxDecoration(color: Color(0xFF8B7CF6), shape: BoxShape.circle),
//                   )
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(14),
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [const Color(0xFF8B7CF6).withOpacity(0.15), Colors.black26],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: BorderRadius.circular(14),
//                   border: Border.all(color: const Color(0xFF8B7CF6).withOpacity(0.2)),
//                 ),
//                 child: const Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Safe Multi-Sig Balance', style: TextStyle(fontSize: 9, color: Colors.white54)),
//                     SizedBox(height: 4),
//                     Text('\$14,248.50', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'monospace')),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 18),
//               const Text('Shared Expense Pool', style: TextStyle(fontSize: 10, color: Colors.white38, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 8),
//               _simExpenseItem('AWS Server Host', '-\$120.00'),
//               _simExpenseItem('Play Store Fee', '-\$25.00'),
//               _simExpenseItem('Hacker House Dinner', '-\$340.50'),
//               const Spacer(),
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF8B7CF6),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const Text(
//                   'Approve Group Ledger',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10),
//                 ),
//               ),
//             ],
//           ),
//         );
//       case 'ecke':
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Row(
//                 children: [
//                   Icon(Icons.school, color: Color(0xFFFFB84D), size: 16),
//                   SizedBox(width: 8),
//                   Text('LearningEcke', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFFFFB84D))),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.03),
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: Colors.white10),
//                 ),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.bluetooth, color: Color(0xFFFFB84D), size: 18),
//                     const SizedBox(width: 8),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text('Flutter BLE Tutorial', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
//                           const SizedBox(height: 4),
//                           LinearProgressIndicator(value: 0.75, backgroundColor: Colors.black26, color: const Color(0xFFFFB84D)),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 12),
//               const Text('Lessons list:', style: TextStyle(fontSize: 10, color: Colors.white38)),
//               const SizedBox(height: 6),
//               _simLesson('1. GATT Services & UUIDs', true),
//               _simLesson('2. MTU Packets Structuring', true),
//               _simLesson('3. RxDart State Streams', false),
//               const Spacer(),
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFFFFB84D),
//                   minimumSize: const Size(double.infinity, 38),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                 ),
//                 child: const Text('Resume Course', style: TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold)),
//               ),
//             ],
//           ),
//         );
//       case 'infier':
//       default:
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Infierms v2.4', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFF3DDC84))),
//                   Icon(Icons.check_circle, color: Color(0xFF3DDC84), size: 14),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.02),
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: Colors.white10),
//                 ),
//                 child: const Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Active Shift Profile', style: TextStyle(fontSize: 9, color: Colors.white54)),
//                     SizedBox(height: 2),
//                     Text('Rushikesh Petkar', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
//                     SizedBox(height: 12),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text('Shift Clock Log', style: TextStyle(fontSize: 9, color: Colors.white38)),
//                         Text('8h 45m', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF3DDC84))),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 14),
//               const Row(
//                 children: [
//                   Icon(Icons.location_on, size: 12, color: Colors.redAccent),
//                   SizedBox(width: 4),
//                   Text('Geofence: Inside Pixelstat HQ', style: TextStyle(fontSize: 10, color: Colors.white54)),
//                 ],
//               ),
//               const Spacer(),
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.symmetric(vertical: 12),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF3DDC84),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: const Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.fingerprint, color: Colors.black, size: 14),
//                     SizedBox(width: 6),
//                     Text(
//                       'Biometric Verified',
//                       style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 11),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//     }
//   }
//
//   Widget _simExpenseItem(String name, String amount) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 6),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(name, style: const TextStyle(fontSize: 9, color: Colors.white70)),
//           Text(amount, style: const TextStyle(fontSize: 9, color: Colors.redAccent, fontFamily: 'monospace')),
//         ],
//       ),
//     );
//   }
//
//   Widget _simLesson(String title, bool done) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 4),
//       child: Row(
//         children: [
//           Icon(done ? Icons.check_circle_outline : Icons.radio_button_off, size: 12, color: done ? const Color(0xFFFFB84D) : Colors.white30),
//           const SizedBox(width: 6),
//           Text(title, style: TextStyle(fontSize: 10, color: done ? Colors.white70 : Colors.white30)),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

/// A compact, interactive preview of the three Pixelstat Android apps.
/// Add this widget anywhere in your Flutter page:
/// const PhoneSimulator()
class PhoneSimulator extends StatefulWidget {
  const PhoneSimulator({super.key});

  @override
  State<PhoneSimulator> createState() => _PhoneSimulatorState();
}

class _PhoneSimulatorState extends State<PhoneSimulator> {
  String _app = 'erms';

  static const _blue = Color(0xFF108BD0);
  static const _orange = Color(0xFFFF790D);
  static const _red = Color(0xFFF9423A);
  static const _navy = Color(0xFF1D2435);
  static const _lavender = Color(0xFFB9AFEA);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      height: 540,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(35),
        border: Border.all(color: const Color(0xFF006F80), width: 3),
        boxShadow: const [BoxShadow(color: Colors.black45, blurRadius: 20)],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Column(
          children: [
            _statusBar(),
            Expanded(child: _screen()),
            _appPicker(),
          ],
        ),
      ),
    );
  }

  Widget _statusBar() => Container(
    height: 26,
    color: _app == 'ecke' ? _red : _app == 'eda' ? _blue : _navy,
    padding: const EdgeInsets.symmetric(horizontal: 13),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('11:39 PM', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w600)),
        Row(children: [
          Icon(Icons.wifi, color: Colors.white, size: 12),
          SizedBox(width: 5),
          Icon(Icons.signal_cellular_alt, color: Colors.white, size: 12),
          SizedBox(width: 5),
          Icon(Icons.battery_full, color: Colors.white, size: 13),
        ]),
      ],
    ),
  );

  Widget _screen() {
    switch (_app) {
      case 'eda':
        return _edaWallet();
      case 'ecke':
        return _learningEcke();
      default:
        return _erms();
    }
  }

  Widget _appPicker() => Container(
    height: 38,
    color: const Color(0xFF101010),
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _picker('ERMS', 'erms'),
        _picker('EDA Wallet', 'eda'),
        _picker('LearningEcke', 'ecke'),
      ],
    ),
  );

  Widget _picker(String label, String value) {
    final selected = _app == value;
    return InkWell(
      onTap: () => setState(() => _app = value),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        decoration: BoxDecoration(
          color: selected ? Colors.white12 : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(label, style: TextStyle(color: selected ? Colors.white : Colors.white38, fontSize: 7.5, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _erms() => Stack(children: [
    Container(color: const Color(0xFFF4F4F6)),
    Positioned.fill(child: Padding(
      padding: const EdgeInsets.fromLTRB(136, 30, 8, 9),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Dashboard', style: TextStyle(fontSize: 15, color: Colors.black87)),
        const SizedBox(height: 14),
        _ermsCard(Icons.inventory_2_outlined, 'Total Hours(Attend)', '218.18'),
        const SizedBox(height: 8),
        _ermsCard(Icons.view_agenda_outlined, 'Total Leave(Monthly)', '0'),
        const SizedBox(height: 14),
        Container(height: 125, color: Colors.white, padding: const EdgeInsets.all(9), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Status', style: TextStyle(fontSize: 15)),
          SizedBox(height: 16),
          Expanded(child: Placeholder(color: Color(0xFFE0E0E0))),
        ])),
      ]),
    )),
    Container(width: 150, color: _navy, child: Column(children: [
      Container(height: 55, alignment: Alignment.centerLeft, padding: const EdgeInsets.only(left: 14), child: const Row(children: [
        Icon(Icons.token_outlined, color: Colors.white, size: 21),
        SizedBox(width: 7), Text('PIXELSTAT', style: TextStyle(color: Colors.white, fontSize: 13, letterSpacing: 1.2, fontWeight: FontWeight.bold)),
      ])),
      const Divider(color: Colors.white12, height: 1),
      _ermsMenu(Icons.home_outlined, 'Dashboard'),
      _ermsMenu(Icons.laptop_mac_outlined, 'Project'),
      _ermsMenu(Icons.view_sidebar_outlined, 'Work Planner'),
      _ermsMenu(Icons.timer_outlined, 'Timelog'),
      _ermsMenu(Icons.calendar_month_outlined, 'Attendance'),
      _ermsMenu(Icons.event_available_outlined, 'Leaves'),
      _ermsMenu(Icons.account_balance_wallet_outlined, 'Account'),
      _ermsMenu(Icons.description_outlined, 'Sample Document'),
      _ermsMenu(Icons.emoji_events_outlined, 'Goalset'),
      _ermsMenu(Icons.card_giftcard_outlined, 'Holidays'),
      _ermsMenu(Icons.help_outline, 'Help'),
    ])),
  ]);

  Widget _ermsCard(IconData icon, String label, String value) => Container(
    width: double.infinity, height: 53, color: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Row(children: [
      CircleAvatar(radius: 17, backgroundColor: const Color(0xFFD9F6FF), child: Icon(icon, color: const Color(0xFF00C9F4), size: 17)),
      const Spacer(),
      Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end, children: [
        Text(label, style: const TextStyle(fontSize: 7.5)),
        Text(value, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
      ]),
    ]),
  );

  Widget _ermsMenu(IconData icon, String label) => Padding(
    padding: const EdgeInsets.only(left: 14, top: 7),
    child: Row(children: [Icon(icon, color: _lavender, size: 13), const SizedBox(width: 12), Text(label, style: const TextStyle(color: _lavender, fontSize: 10))]),
  );

  Widget _edaWallet() => Stack(children: [
    Container(color: const Color(0xFFF4F4F4)),
    Column(children: [
      Container(height: 49, color: _blue, alignment: Alignment.centerRight, padding: const EdgeInsets.only(right: 13), child: const CircleAvatar(radius: 14, backgroundColor: _orange, child: Icon(Icons.menu, color: Colors.white, size: 17))),
      Container(height: 5, color: const Color(0xFF102B85)),
      Expanded(child: Padding(padding: const EdgeInsets.all(13), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Dashboard', style: TextStyle(color: _blue, fontSize: 15)),
        const SizedBox(height: 17),
        _edaTile('0', 'Total In', _blue),
        const SizedBox(height: 10),
        _edaTile('0', 'Total In(Current Month)', const Color(0xFF45B95F)),
        const SizedBox(height: 12),
        Container(height: 115, color: Colors.white, padding: const EdgeInsets.all(9), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Expenses Per Month', style: TextStyle(color: Color(0xFF478D4D), fontSize: 11)),
          Divider(color: Color(0xFF45B95F), thickness: 2),
        ])),
      ]))),
    ]),
    Container(width: 173, color: const Color(0xFFEAF7FF), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(height: 79, color: Colors.white, padding: const EdgeInsets.only(left: 13), alignment: Alignment.centerLeft, child: const Row(children: [
        Icon(Icons.account_balance_wallet_outlined, color: _orange, size: 26), SizedBox(width: 5), Text('EDA WALLET', style: TextStyle(color: _blue, fontSize: 10, fontWeight: FontWeight.bold)),
      ])),
      Align(alignment: Alignment.centerRight, child: Container(margin: const EdgeInsets.only(right: 9, top: 7), width: 27, height: 27, decoration: const BoxDecoration(color: _orange, shape: BoxShape.circle), child: const Icon(Icons.close, color: Colors.white, size: 17))),
      const SizedBox(height: 7),
      _edaMenu(Icons.dashboard_outlined, 'Dashboard'),
      _edaMenu(Icons.arrow_forward, 'Income'),
      _edaMenu(Icons.arrow_back, 'Expenses'),
      _edaMenu(Icons.receipt_long_outlined, 'Billing'),
      _edaMenu(Icons.person, 'Profile'),
      _edaMenu(Icons.logout, 'Logout'),
    ])),
  ]);

  Widget _edaTile(String number, String label, Color stripe) => Container(height: 59, color: Colors.white, child: Row(children: [
    Container(width: 5, color: stripe), const SizedBox(width: 11), Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [Text(number, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)), Text(label, style: const TextStyle(fontSize: 8))])
  ]));

  Widget _edaMenu(IconData icon, String label) => Padding(padding: const EdgeInsets.only(left: 13, top: 13), child: Row(children: [
    Container(width: 28, height: 28, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: _blue, style: BorderStyle.solid)), child: Icon(icon, color: _blue, size: 16)),
    const SizedBox(width: 7), Text(label, style: const TextStyle(color: _blue, fontSize: 11, decoration: TextDecoration.underline, decorationStyle: TextDecorationStyle.dotted)),
  ]));

  Widget _learningEcke() => Stack(children: [
    Container(color: const Color(0xFF303030)),
    Positioned.fill(child: Padding(padding: const EdgeInsets.only(left: 180, top: 22), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Welcome back', style: TextStyle(color: Colors.white, fontSize: 12)), const SizedBox(height: 12),
      Container(height: 100, color: Colors.black26), const SizedBox(height: 10),
      const Text('Keep learning every day', style: TextStyle(color: Colors.white70, fontSize: 9)),
    ]))),
    Container(width: 170, color: const Color(0xFFF7FAFA), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(height: 70, color: _red, alignment: Alignment.center, child: const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.menu_book_rounded, color: Colors.white, size: 25), SizedBox(height: 4), Text('LearningEcke', style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'serif')),
      ])),
      _eckeMenu(Icons.menu_book, 'LearningEcke'),
      _eckeMenu(Icons.phone_android_outlined, 'Why LearningEcke App?'),
      _eckeMenu(Icons.headset_mic_outlined, 'Help Desk'),
      _eckeMenu(Icons.description_outlined, 'Privacy Policy'),
      _eckeMenu(Icons.article_outlined, 'Terms and Condition'),
      _eckeMenu(Icons.person, 'Profile'),
      _eckeMenu(Icons.logout, 'Logout'),
    ])),
  ]);

  Widget _eckeMenu(IconData icon, String label) => Container(
    height: 54, padding: const EdgeInsets.symmetric(horizontal: 12), decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFF666666), width: .7))),
    child: Row(children: [Icon(icon, color: _red, size: 18), const SizedBox(width: 13), Expanded(child: Text(label, style: const TextStyle(color: Colors.black, fontSize: 10.5, fontWeight: FontWeight.w700)))]),
  );
}
