import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';

class KinoBusiness {
  
  static final kbHost = 'https://kinobusiness.com';

  static final yearBoxOffice = '$kbHost/kassovye_sbory/films_year/';

  static final weekendBoxOffice = '$kbHost/kassovye_sbory/weekend/';

  static final thursdayBoxOffice = '$kbHost/kassovye_sbory/thursday/';
  
  static final dayBoxOffice = '$kbHost/kassovye_sbory/day/';  
  
}
