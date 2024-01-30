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
      case AppError.createAccountFail:
        errorTitle = L10n.of(context).error;
        errorMessage = L10n.of(context).failedCreateAccount;
      case AppError.createAccountNameExists:
        errorTitle = L10n.of(context).usernameExists;
        errorMessage = L10n.of(context).usernameExistsMessage;
      case AppError.getListsFail:
        errorTitle = L10n.of(context).error;
        errorMessage = L10n.of(context).failedLoadLists;
      case AppError.getTodosFail:
        errorTitle = L10n.of(context).error;
        errorMessage = L10n.of(context).failedLoadTodos;
      case AppError.saveListFail:
        errorTitle = L10n.of(context).error;
        errorMessage = L10n.of(context).failedSaveList;
      case AppError.deleteListFail:
        errorTitle = L10n.of(context).error;
        errorMessage = L10n.of(context).faileDeleteList;
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