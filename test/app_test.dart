@Tags(const ['aot'])
@TestOn('browser')
import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_test/angular_test.dart';
import 'package:test/test.dart';

import 'package:http_reqs_scouts/app_component.dart';

NgTestFixture<AppComponent> fixture;

void main() {
  final testBed = new NgTestBed<AppComponent>();

  setUp(() async {
    fixture = await testBed.create();
  });

  tearDown(disposeAnyRunningTest);

  test('title', () async {
    expect(await fixture.text, 'My First AngularDart App');
  });

  // Testing info: https://webdev.dartlang.org/angular/guide/testing
}

