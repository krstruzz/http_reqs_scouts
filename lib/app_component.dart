//import 'package:angular/angular.dart';
//import 'package:angular_components/angular_components.dart';
//
//import 'scout_service.dart';
//import 'src/scouts/scouts_component.dart';
//
//// AngularDart info: https://webdev.dartlang.org/angular
//// Components info: https://webdev.dartlang.org/components
//
//@Component(
//  selector: 'my-app',
//  styleUrls: const ['app_component.css'],
//  templateUrl: 'src/scouts/scouts_component.html',
//  directives: const [materialDirectives, ScoutsComponent],
//  providers: const [materialProviders, ScoutService],
//)
//class AppComponent {
//  // Nothing here yet. All logic is in TodoListComponent.
//}

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'scout_service.dart';
import 'src/scouts/scout.dart';
import 'dart:async';


@Component(
  selector: 'my-app',
  template: '''
    <h2>Scouts:</h2>
    <ul class="scouts">
      <li *ngFor="let scout of scouts">
          <span class="badge">{{scout.id}}</span> {{scout.firstName}}
      </li>
    </ul>
  ''',
  directives: const [coreDirectives, routerDirectives],
  providers: const [ScoutService],
  styleUrls: const ['app_component.css'],
  pipes: const [commonPipes],
)

class AppComponent implements OnInit {
  final title = 'Cub Scouts Pack 22';
  final ScoutService _scoutService;
  List<Scout> scouts;
  Scout selectedScout;

  AppComponent(this._scoutService);

  Future<Null> getScouts() async {
    scouts = await _scoutService.getScouts();
  }
  void ngOnInit() => getScouts();
}