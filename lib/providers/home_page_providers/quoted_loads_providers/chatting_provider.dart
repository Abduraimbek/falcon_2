///
/// Created by Abduraimbek Yarkinov at 21:38 on 11.01.2022.
///

import 'dart:developer';

// import 'package:async/async.dart';
import 'package:enough_mail/enough_mail.dart';
import 'package:falcon_2/providers/providers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:falcon_2/utils/utils.dart';
import 'package:falcon_2/singletons/singletons.dart';
import 'package:collection/collection.dart';

final chattingProvider = ChangeNotifierProvider<_Chatting2>((ref) {
  return _Chatting2();
});

class _Chatting2 extends ChangeNotifier {
  Future<void> pickFile(int quoteId) async {
    final sendMessageModel = SendMessageModel(
      createdData: messages.lastOrNull?.createdData ?? "" "Z",
      subject: subject,
      isSend: true,
      text: "",
      sending: true,
    );
    sendMessageModel.contentType = 2;

    FilePickerResult? result = await FilePicker.platform.pickFiles();
    final filePath = result?.files.single.path;
    if (filePath == null) {
      return;
    }

    messages.add(sendMessageModel);
    notifyListeners();

    final path = await MessageApi.uploadImage(filePath);

    if (path != null) {
      final result = await MessageApi.sendMessage(
        quoteId: quoteId,
        message: "",
        image: path,
      );
      if (result) fetchMessagesWithCompleter();
    } else {
      messages.removeLast();
    }

    notifyListeners();
  }

  // ******************************************************************
  // ******************************************************************
  // ******************************************************************
  // fetching messages
  // ******************************************************************
  // ******************************************************************
  // ******************************************************************

  bool shouldFetchMessages = false;
  bool isFalcon = true;
  List<SendMessageModel> messages = [];
  String subject = "";

  // CancelableCompleter cancelableCompleter = CancelableCompleter();

  void onDispose() async {
    messages = [];
    shouldFetchMessages = false;
    // await cancelableCompleter.operation.cancel();
  }

  Future<void> sendMessage({
    required int quoteId,
    required String message,
  }) async {
    messages.add(SendMessageModel(
      createdData: messages.lastOrNull?.createdData ?? "" "Z",
      subject: subject,
      text: message,
      isSend: true,
      sending: true,
    ));
    notifyListeners();
    final result =
        await MessageApi.sendMessage(quoteId: quoteId, message: message);
    if (result) fetchMessagesWithCompleter();
  }

  // ******************************************************************
  // ******************************************************************
  // ******************************************************************
  // fetching messages
  // ******************************************************************
  // ******************************************************************
  // ******************************************************************

  Future<void> fetchMessagesWithCompleter() async {
    // await cancelableCompleter.operation.cancel();
    // cancelableCompleter = CancelableCompleter();
    // cancelableCompleter.complete(isFalcon
    //     ? _fetchFalconMessagesBySubject()
    //     : _fetchAzamMessagesBySubject());
    if (isFalcon) {
      await _fetchFalconMessagesBySubject();
    } else {
      await _fetchAzamMessagesBySubject();
    }
  }

  Future<List<SendMessageModel>> _fetchFalconMessagesBySubject() async {
    final b = await _initializeFalcon();
    if (b) {
      final mailSearch = MailSearch(
        subject,
        SearchQueryType.subject,
        pageSize: 10,
        messageType: SearchMessageType.all,
        fetchPreference: FetchPreference.full,
      );

      try {
        final searchResult = await _fMailClient!.searchMessages(mailSearch);
        final mimeMessages =
            await _fMailClient!.searchMessagesNextPage(searchResult);

        final list1 = mimeMessages
            .map((e) => SendMessageModel.fromMimeMessage(e))
            .toList();

        final list2 = await MessageApi.sentMessages(subject: subject);
        final list = [...list1, ...list2];
        list.sort((a, b) => a.createdData.compareTo(b.createdData));
        messages = list;
        notifyListeners();
        return list;
      } catch (e) {
        log("chatting_provider.dart --> _fetchFalconMessagesBySubject --> error $e");
        return [];
      }
    } else {
      return [];
    }
  }

  Future<List<SendMessageModel>> _fetchAzamMessagesBySubject() async {
    final b = await _initializeAzam();
    if (b) {
      final mailSearch = MailSearch(
        subject,
        SearchQueryType.subject,
        pageSize: 30,
        messageType: SearchMessageType.all,
        fetchPreference: FetchPreference.full,
      );

      try {
        final searchResult = await _aMailClient!.searchMessages(mailSearch);
        final mimeMessages =
            await _aMailClient!.searchMessagesNextPage(searchResult);

        final list1 = mimeMessages
            .map((e) => SendMessageModel.fromMimeMessage(e))
            .toList();

        final list2 = await MessageApi.sentMessages(subject: subject);
        final list = [...list1, ...list2];
        list.sort((a, b) => a.createdData.compareTo(b.createdData));
        messages = list;
        notifyListeners();
        return list;
      } catch (e) {
        log("chatting_provider.dart --> _fetchAzamMessagesBySubject --> error $e");
        return [];
      }
    } else {
      return [];
    }
  }

  // ******************************************************************
  // ******************************************************************
  // ******************************************************************
  // initializing
  // ******************************************************************
  // ******************************************************************
  // ******************************************************************

  Future<void> startListeningFalcon() async {
    bool b = await _initializeFalcon();
    if (b) {
      await _mailLoadEventOnGivenMailClient(_fMailClient);
    }
  }

  Future<void> startListeningAzam() async {
    bool b = await _initializeAzam();
    if (b) {
      await _mailLoadEventOnGivenMailClient(_aMailClient);
    }
  }

  MailClient? _fMailClient;
  MailClient? _aMailClient;

  // Future<void> _customDispose() async {
  //   if (_fMailClient?.isPolling() ?? false) await _fMailClient?.stopPolling();
  //   if (_aMailClient?.isPolling() ?? false) await _aMailClient?.stopPolling();
  //   if (_fMailClient?.isConnected ?? false) await _fMailClient?.disconnect();
  //   if (_aMailClient?.isConnected ?? false) await _aMailClient?.disconnect();
  //   _fMailClient = null;
  //   _aMailClient = null;
  // }

  Future<bool> _initializeFalcon() async {
    if (_fMailClient != null && (_fMailClient?.isConnected ?? false == true)) {
      return true;
    }

    String fMail = MyPrefsFields.fMail;
    String fPassword = MyPrefsFields.fPassword;

    if (fMail.isEmpty || fPassword.isEmpty) return false;

    final config = await Discover.discover(fMail);
    if (config == null) return false;

    final account =
        MailAccount.fromDiscoveredSettings("", fMail, fPassword, config);
    _fMailClient = MailClient(account);
    await _fMailClient?.connect();
    await _fMailClient?.selectInbox();
    return true;
  }

  Future<bool> _initializeAzam() async {
    if (_aMailClient != null && (_aMailClient?.isConnected ?? false == true)) {
      return true;
    }

    String aMail = MyPrefsFields.aMail;
    String aPassword = MyPrefsFields.aPassword;

    if (aMail.isEmpty || aPassword.isEmpty) return false;

    final config = await Discover.discover(aMail);
    if (config == null) return false;

    final account =
        MailAccount.fromDiscoveredSettings("", aMail, aPassword, config);
    _aMailClient = MailClient(account);
    await _aMailClient?.connect();
    await _aMailClient?.selectInbox();
    return true;
  }

  Future<void> _mailLoadEventOnGivenMailClient(MailClient? mailClient) async {
    if (mailClient == null) return;

    mailClient.eventBus.on<MailLoadEvent>().listen((event) {
      final box = MyObjectbox.store.box<QuotedOrderModel>();
      String? nullOrSubject = event.message.decodeSubject();
      if (nullOrSubject != null) {
        String subject =
            nullOrSubject.replaceAll(RegExp(r"\s+"), "").toLowerCase();
        final list = box.getAll().where((quote) {
          if (quote.subject != null) {
            String quoteSubject =
                quote.subject!.replaceAll(RegExp(r"\s+"), "").toLowerCase();
            if (subject.contains(quoteSubject) && quoteSubject.isNotEmpty) {
              return true;
            } else {
              return false;
            }
          } else {
            return false;
          }
        }).toList();

        for (int i = 0; i < list.length; i++) {
          int count = list[i].notificationCount + 1;
          list[i].notificationCount = count;
        }

        if (list.isNotEmpty) {
          box.putMany(list);
        }

        if (shouldFetchMessages) fetchMessagesWithCompleter();
      }
    });

    await mailClient.startPolling();
  }
}
