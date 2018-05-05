import 'package:angular/angular.dart';
import 'scout.dart';
import 'package:http_reqs_dart/scout_service.dart';
import 'dart:async';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'my-scouts',
  directives: const [CORE_DIRECTIVES],
  template: '''
    <h2>Scouts:</h2>
  <ul class="scouts">
      <li *ngFor="let scout of scouts">
          <span class="badge">{{scout.id}}</span> {{scout.name}}
      </li>
  </ul>
  ''',
  //templateUrl: 'scouts_component.html',
  styleUrls: const ['scouts_component.css'],
  pipes: const [COMMON_PIPES],
)
class ScoutsComponent implements OnInit {
  final ScoutService _scoutService;
  final Router _router;
  List<Scout> scouts;
  Scout selectedScout;

  ScoutsComponent(this._scoutService, this._router);

  Future<Null> getScouts() async {
    scouts = await _scoutService.getScouts();
  }
  void ngOnInit() => getScouts();

}