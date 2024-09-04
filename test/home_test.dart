import 'package:estilizacao_componentes/components/box_card.dart';
import 'package:estilizacao_componentes/data/bank_inherited.dart';
import 'package:estilizacao_componentes/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'bank_http.mocks.dart';

void main() {

  final MockBankHttp httpMock = MockBankHttp();

  testWidgets('My widget has a text spent', (tester) async {

    reset(httpMock);

    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));

    await tester.pumpWidget(MaterialApp(
      home: BankInherited(child: Home(api: httpMock.dolarToReal())),
    ));

    final spentFinder = find.text('Spent');
    expect(spentFinder, findsOneWidget);

  });

  testWidgets('finds a LinearProgressIndicator', (tester) async {

    reset(httpMock);

    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));

    await tester.pumpWidget(MaterialApp(
      home: BankInherited(child: Home(api: httpMock.dolarToReal())),
    ));

    expect(find.byType(LinearProgressIndicator), findsOneWidget );

  });

  testWidgets('finds a AccountStatus', (tester) async {

    reset(httpMock);
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));

    await tester.pumpWidget(MaterialApp(
      home: BankInherited(child: Home(api: httpMock.dolarToReal())),
    ));

    expect(find.byKey(Key('testKey')), findsOneWidget );

  });

  testWidgets('find 5 BoxCards', (tester) async {

    reset(httpMock);
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));

    await tester.pumpWidget(MaterialApp(
      home: BankInherited(child: Home(api: httpMock.dolarToReal())),
    ));

    expect(find.byWidgetPredicate((widget) {
      if(widget is BoxCard){
        return true;
      }else{
        return false;
      }
    }), findsNWidgets(5) );

  });



  testWidgets('Testing MockHttp dolarToReal', (tester) async {

    reset(httpMock);
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(child: Home(api: httpMock.dolarToReal())),
    ));

    verify(httpMock.dolarToReal()).called(1);

  });

}
