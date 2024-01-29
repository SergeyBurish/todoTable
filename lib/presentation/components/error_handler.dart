import 'package:flutter/material.dart';
import 'package:todo_table/businessLogic/state/app_state.dart';
import 'package:todo_table/l10n/l10n.dart';
import 'package:todo_table/presentation/todo_lists_page.dart';

class ErrorHandler {
  static showError(context) {
    final String errorTitle;
    final String errorMessage;

    switch (appState.currentError) {
      case AppError.connectionFail:
        errorTitle = L10n.of(context).error;
        errorMessage = L10n.of(context).cantConnect;
      case AppError.authFail:
        errorTitle = L10n.of(context).authorisationError;
        errorMessage = L10n.of(context).authorisationMessage;
      default:
        errorTitle = '';
        errorMessage = 'Unknown error';
    }

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(errorTitle),
        content: Text(errorMessage),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'OK');
            },
            child: Text(L10n.of(context).ok),
          ),
        ],
      ),
    );
  }
}