// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome to Ticketel app`
  String get welcomeToTicketelApp {
    return Intl.message(
      'Welcome to Ticketel app',
      name: 'welcomeToTicketelApp',
      desc: '',
      args: [],
    );
  }

  /// `Please choose to continue as a Guest or an Administrator`
  String get chooseUserType {
    return Intl.message(
      'Please choose to continue as a Guest or an Administrator',
      name: 'chooseUserType',
      desc: '',
      args: [],
    );
  }

  /// `Guest`
  String get guest {
    return Intl.message(
      'Guest',
      name: 'guest',
      desc: '',
      args: [],
    );
  }

  /// `Administrator`
  String get administrator {
    return Intl.message(
      'Administrator',
      name: 'administrator',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Mail`
  String get mail {
    return Intl.message(
      'Mail',
      name: 'mail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your mail`
  String get enterYourMail {
    return Intl.message(
      'Enter your mail',
      name: 'enterYourMail',
      desc: '',
      args: [],
    );
  }

  /// `Room Number`
  String get roomNumber {
    return Intl.message(
      'Room Number',
      name: 'roomNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Room number`
  String get enterYourRoomNumber {
    return Intl.message(
      'Enter your Room number',
      name: 'enterYourRoomNumber',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `First Name:`
  String get firstNameColon {
    return Intl.message(
      'First Name:',
      name: 'firstNameColon',
      desc: '',
      args: [],
    );
  }

  /// `Enter your First Name`
  String get enterYourFirstName {
    return Intl.message(
      'Enter your First Name',
      name: 'enterYourFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name:`
  String get lastNameColon {
    return Intl.message(
      'Last Name:',
      name: 'lastNameColon',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Last Name`
  String get enterYourLastName {
    return Intl.message(
      'Enter your Last Name',
      name: 'enterYourLastName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter {field}`
  String pleaseEnter(String field) {
    return Intl.message(
      'Please enter $field',
      name: 'pleaseEnter',
      desc: '',
      args: [field],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Guests`
  String get guests {
    return Intl.message(
      'Guests',
      name: 'guests',
      desc: '',
      args: [],
    );
  }

  /// `for any guest`
  String get forAnyGuest {
    return Intl.message(
      'for any guest',
      name: 'forAnyGuest',
      desc: '',
      args: [],
    );
  }

  /// `New Requests`
  String get newRequests {
    return Intl.message(
      'New Requests',
      name: 'newRequests',
      desc: '',
      args: [],
    );
  }

  /// `Pending Requests`
  String get pendingRequests {
    return Intl.message(
      'Pending Requests',
      name: 'pendingRequests',
      desc: '',
      args: [],
    );
  }

  /// `Active Requests`
  String get activeRequests {
    return Intl.message(
      'Active Requests',
      name: 'activeRequests',
      desc: '',
      args: [],
    );
  }

  /// `Closed Requests`
  String get closedRequests {
    return Intl.message(
      'Closed Requests',
      name: 'closedRequests',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get feedback {
    return Intl.message(
      'Feedback',
      name: 'feedback',
      desc: '',
      args: [],
    );
  }

  /// `Closed Feedback`
  String get closedFeedback {
    return Intl.message(
      'Closed Feedback',
      name: 'closedFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Closed Work Orders`
  String get closedWorkOrders {
    return Intl.message(
      'Closed Work Orders',
      name: 'closedWorkOrders',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get reports {
    return Intl.message(
      'Reports',
      name: 'reports',
      desc: '',
      args: [],
    );
  }

  /// `Administration`
  String get administration {
    return Intl.message(
      'Administration',
      name: 'administration',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Search for any {type}`
  String searchForAny(String type) {
    return Intl.message(
      'Search for any $type',
      name: 'searchForAny',
      desc: '',
      args: [type],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Last Replay`
  String get lastReplay {
    return Intl.message(
      'Last Replay',
      name: 'lastReplay',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Department`
  String get department {
    return Intl.message(
      'Department',
      name: 'department',
      desc: '',
      args: [],
    );
  }

  /// `Worker`
  String get worker {
    return Intl.message(
      'Worker',
      name: 'worker',
      desc: '',
      args: [],
    );
  }

  /// `Start Time`
  String get startTime {
    return Intl.message(
      'Start Time',
      name: 'startTime',
      desc: '',
      args: [],
    );
  }

  /// `Dep Time`
  String get depTime {
    return Intl.message(
      'Dep Time',
      name: 'depTime',
      desc: '',
      args: [],
    );
  }

  /// `Problem`
  String get problem {
    return Intl.message(
      'Problem',
      name: 'problem',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Requested By`
  String get requestedBy {
    return Intl.message(
      'Requested By',
      name: 'requestedBy',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Accepted`
  String get accepted {
    return Intl.message(
      'Accepted',
      name: 'accepted',
      desc: '',
      args: [],
    );
  }

  /// `Close time`
  String get closeTime {
    return Intl.message(
      'Close time',
      name: 'closeTime',
      desc: '',
      args: [],
    );
  }

  /// `Requested by :`
  String get requestedByColon {
    return Intl.message(
      'Requested by :',
      name: 'requestedByColon',
      desc: '',
      args: [],
    );
  }

  /// `Worker :`
  String get workerColon {
    return Intl.message(
      'Worker :',
      name: 'workerColon',
      desc: '',
      args: [],
    );
  }

  /// `Close time :`
  String get closeTimeColon {
    return Intl.message(
      'Close time :',
      name: 'closeTimeColon',
      desc: '',
      args: [],
    );
  }

  /// `Problem :`
  String get problemColon {
    return Intl.message(
      'Problem :',
      name: 'problemColon',
      desc: '',
      args: [],
    );
  }

  /// `Message :`
  String get messageColon {
    return Intl.message(
      'Message :',
      name: 'messageColon',
      desc: '',
      args: [],
    );
  }

  /// `Add Request`
  String get addRequest {
    return Intl.message(
      'Add Request',
      name: 'addRequest',
      desc: '',
      args: [],
    );
  }

  /// `View Request`
  String get viewRequest {
    return Intl.message(
      'View Request',
      name: 'viewRequest',
      desc: '',
      args: [],
    );
  }

  /// `Edit Request`
  String get editRequest {
    return Intl.message(
      'Edit Request',
      name: 'editRequest',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Replay`
  String get replay {
    return Intl.message(
      'Replay',
      name: 'replay',
      desc: '',
      args: [],
    );
  }

  /// `Choose files`
  String get chooseFiles {
    return Intl.message(
      'Choose files',
      name: 'chooseFiles',
      desc: '',
      args: [],
    );
  }

  /// `File`
  String get file {
    return Intl.message(
      'File',
      name: 'file',
      desc: '',
      args: [],
    );
  }

  /// `Room`
  String get room {
    return Intl.message(
      'Room',
      name: 'room',
      desc: '',
      args: [],
    );
  }

  /// `Room:`
  String get roomColon {
    return Intl.message(
      'Room:',
      name: 'roomColon',
      desc: '',
      args: [],
    );
  }

  /// `Request Type`
  String get requestType {
    return Intl.message(
      'Request Type',
      name: 'requestType',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Add Department`
  String get addDepartment {
    return Intl.message(
      'Add Department',
      name: 'addDepartment',
      desc: '',
      args: [],
    );
  }

  /// `Update Department`
  String get updateDepartment {
    return Intl.message(
      'Update Department',
      name: 'updateDepartment',
      desc: '',
      args: [],
    );
  }

  /// `Add Location`
  String get addLocation {
    return Intl.message(
      'Add Location',
      name: 'addLocation',
      desc: '',
      args: [],
    );
  }

  /// `Update Location`
  String get updateLocation {
    return Intl.message(
      'Update Location',
      name: 'updateLocation',
      desc: '',
      args: [],
    );
  }

  /// `Add Member`
  String get addMember {
    return Intl.message(
      'Add Member',
      name: 'addMember',
      desc: '',
      args: [],
    );
  }

  /// `Update Member`
  String get updateMember {
    return Intl.message(
      'Update Member',
      name: 'updateMember',
      desc: '',
      args: [],
    );
  }

  /// `Add Problem`
  String get addProblem {
    return Intl.message(
      'Add Problem',
      name: 'addProblem',
      desc: '',
      args: [],
    );
  }

  /// `Update Problem`
  String get updateProblem {
    return Intl.message(
      'Update Problem',
      name: 'updateProblem',
      desc: '',
      args: [],
    );
  }

  /// `Add Request Type`
  String get addRequestType {
    return Intl.message(
      'Add Request Type',
      name: 'addRequestType',
      desc: '',
      args: [],
    );
  }

  /// `Update Request Type`
  String get updateRequestType {
    return Intl.message(
      'Update Request Type',
      name: 'updateRequestType',
      desc: '',
      args: [],
    );
  }

  /// `Add Topic`
  String get addTopic {
    return Intl.message(
      'Add Topic',
      name: 'addTopic',
      desc: '',
      args: [],
    );
  }

  /// `Update Topic`
  String get updateTopic {
    return Intl.message(
      'Update Topic',
      name: 'updateTopic',
      desc: '',
      args: [],
    );
  }

  /// `Add User`
  String get addUser {
    return Intl.message(
      'Add User',
      name: 'addUser',
      desc: '',
      args: [],
    );
  }

  /// `Update User`
  String get updateUser {
    return Intl.message(
      'Update User',
      name: 'updateUser',
      desc: '',
      args: [],
    );
  }

  /// `Add Worker`
  String get addWorker {
    return Intl.message(
      'Add Worker',
      name: 'addWorker',
      desc: '',
      args: [],
    );
  }

  /// `Update Worker`
  String get updateWorker {
    return Intl.message(
      'Update Worker',
      name: 'updateWorker',
      desc: '',
      args: [],
    );
  }

  /// `Worker Name`
  String get workerName {
    return Intl.message(
      'Worker Name',
      name: 'workerName',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number:`
  String get phoneNumberColon {
    return Intl.message(
      'Phone Number:',
      name: 'phoneNumberColon',
      desc: '',
      args: [],
    );
  }

  /// `Allow Whatsapp`
  String get allowWhatsapp {
    return Intl.message(
      'Allow Whatsapp',
      name: 'allowWhatsapp',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Name:`
  String get nameColon {
    return Intl.message(
      'Name:',
      name: 'nameColon',
      desc: '',
      args: [],
    );
  }

  /// `Email:`
  String get emailColon {
    return Intl.message(
      'Email:',
      name: 'emailColon',
      desc: '',
      args: [],
    );
  }

  /// `Role`
  String get role {
    return Intl.message(
      'Role',
      name: 'role',
      desc: '',
      args: [],
    );
  }

  /// `Role:`
  String get roleColon {
    return Intl.message(
      'Role:',
      name: 'roleColon',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active {
    return Intl.message(
      'Active',
      name: 'active',
      desc: '',
      args: [],
    );
  }

  /// `Inactive`
  String get inactive {
    return Intl.message(
      'Inactive',
      name: 'inactive',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Type:`
  String get typeColon {
    return Intl.message(
      'Type:',
      name: 'typeColon',
      desc: '',
      args: [],
    );
  }

  /// `Topic`
  String get topic {
    return Intl.message(
      'Topic',
      name: 'topic',
      desc: '',
      args: [],
    );
  }

  /// `Topic:`
  String get topicColon {
    return Intl.message(
      'Topic:',
      name: 'topicColon',
      desc: '',
      args: [],
    );
  }

  /// `Location:`
  String get locationColon {
    return Intl.message(
      'Location:',
      name: 'locationColon',
      desc: '',
      args: [],
    );
  }

  /// `Department:`
  String get departmentColon {
    return Intl.message(
      'Department:',
      name: 'departmentColon',
      desc: '',
      args: [],
    );
  }

  /// `Status:`
  String get statusColon {
    return Intl.message(
      'Status:',
      name: 'statusColon',
      desc: '',
      args: [],
    );
  }

  /// `Requests`
  String get requests {
    return Intl.message(
      'Requests',
      name: 'requests',
      desc: '',
      args: [],
    );
  }

  /// `Requests:`
  String get requestsColon {
    return Intl.message(
      'Requests:',
      name: 'requestsColon',
      desc: '',
      args: [],
    );
  }

  /// `Delete {item}`
  String deleteConfirmation(String item) {
    return Intl.message(
      'Delete $item',
      name: 'deleteConfirmation',
      desc: '',
      args: [item],
    );
  }

  /// `Report by Date`
  String get reportByDate {
    return Intl.message(
      'Report by Date',
      name: 'reportByDate',
      desc: '',
      args: [],
    );
  }

  /// `Report by Room`
  String get reportByRoom {
    return Intl.message(
      'Report by Room',
      name: 'reportByRoom',
      desc: '',
      args: [],
    );
  }

  /// `Generate`
  String get generate {
    return Intl.message(
      'Generate',
      name: 'generate',
      desc: '',
      args: [],
    );
  }

  /// `Schedule a Report`
  String get scheduleAReport {
    return Intl.message(
      'Schedule a Report',
      name: 'scheduleAReport',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Up Today`
  String get upToday {
    return Intl.message(
      'Up Today',
      name: 'upToday',
      desc: '',
      args: [],
    );
  }

  /// `New Request`
  String get newRequest {
    return Intl.message(
      'New Request',
      name: 'newRequest',
      desc: '',
      args: [],
    );
  }

  /// `for any request`
  String get forAnyRequest {
    return Intl.message(
      'for any request',
      name: 'forAnyRequest',
      desc: '',
      args: [],
    );
  }

  /// `Request added successfully!`
  String get successMessage {
    return Intl.message(
      'Request added successfully!',
      name: 'successMessage',
      desc: '',
      args: [],
    );
  }

  /// `Request added successfully!`
  String get requestAddedSuccessfully {
    return Intl.message(
      'Request added successfully!',
      name: 'requestAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `IT`
  String get sampleDataIt {
    return Intl.message(
      'IT',
      name: 'sampleDataIt',
      desc: '',
      args: [],
    );
  }

  /// `John Doe`
  String get sampleDataJohnDoe {
    return Intl.message(
      'John Doe',
      name: 'sampleDataJohnDoe',
      desc: '',
      args: [],
    );
  }

  /// `Ahmed mohamed`
  String get sampleDataAhmedMohamed {
    return Intl.message(
      'Ahmed mohamed',
      name: 'sampleDataAhmedMohamed',
      desc: '',
      args: [],
    );
  }

  /// `09:00 AM`
  String get sampleDataNineAM {
    return Intl.message(
      '09:00 AM',
      name: 'sampleDataNineAM',
      desc: '',
      args: [],
    );
  }

  /// `10:00 AM`
  String get sampleDataTenAM {
    return Intl.message(
      '10:00 AM',
      name: 'sampleDataTenAM',
      desc: '',
      args: [],
    );
  }

  /// `No internet`
  String get sampleDataNoInternet {
    return Intl.message(
      'No internet',
      name: 'sampleDataNoInternet',
      desc: '',
      args: [],
    );
  }

  /// `Bed leg broken`
  String get sampleDataBedLegBroken {
    return Intl.message(
      'Bed leg broken',
      name: 'sampleDataBedLegBroken',
      desc: '',
      args: [],
    );
  }

  /// `Work order`
  String get sampleDataWorkOrder {
    return Intl.message(
      'Work order',
      name: 'sampleDataWorkOrder',
      desc: '',
      args: [],
    );
  }

  /// `14-7-2025`
  String get sampleDataFourteenJuly2025 {
    return Intl.message(
      '14-7-2025',
      name: 'sampleDataFourteenJuly2025',
      desc: '',
      args: [],
    );
  }

  /// `9301`
  String get sampleDataRoom9301 {
    return Intl.message(
      '9301',
      name: 'sampleDataRoom9301',
      desc: '',
      args: [],
    );
  }

  /// `tasneem@gmail.com`
  String get sampleDataTasneemEmail {
    return Intl.message(
      'tasneem@gmail.com',
      name: 'sampleDataTasneemEmail',
      desc: '',
      args: [],
    );
  }

  /// `01246534`
  String get sampleDataPhoneNumberSample {
    return Intl.message(
      '01246534',
      name: 'sampleDataPhoneNumberSample',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this {item}?`
  String deleteConfirmationMessage(String item) {
    return Intl.message(
      'Are you sure you want to delete this $item?',
      name: 'deleteConfirmationMessage',
      desc: '',
      args: [item],
    );
  }

  /// `No requests found for Room {roomNumber}`
  String noRequestsFound(String roomNumber) {
    return Intl.message(
      'No requests found for Room $roomNumber',
      name: 'noRequestsFound',
      desc: '',
      args: [roomNumber],
    );
  }

  /// `Replay Message`
  String get replayMessage {
    return Intl.message(
      'Replay Message',
      name: 'replayMessage',
      desc: '',
      args: [],
    );
  }

  /// `The replay has been added successfully`
  String get theReplayHasBeenAddedSuccessfully {
    return Intl.message(
      'The replay has been added successfully',
      name: 'theReplayHasBeenAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Request ID`
  String get requestId {
    return Intl.message(
      'Request ID',
      name: 'requestId',
      desc: '',
      args: [],
    );
  }

  /// `Vacant`
  String get vacant {
    return Intl.message(
      'Vacant',
      name: 'vacant',
      desc: '',
      args: [],
    );
  }

  /// `Compensation`
  String get compensation {
    return Intl.message(
      'Compensation',
      name: 'compensation',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Date From`
  String get dateFrom {
    return Intl.message(
      'Date From',
      name: 'dateFrom',
      desc: '',
      args: [],
    );
  }

  /// `Date To`
  String get dateTo {
    return Intl.message(
      'Date To',
      name: 'dateTo',
      desc: '',
      args: [],
    );
  }

  /// `Report Name`
  String get reportName {
    return Intl.message(
      'Report Name',
      name: 'reportName',
      desc: '',
      args: [],
    );
  }

  /// `Report Time`
  String get reportTime {
    return Intl.message(
      'Report Time',
      name: 'reportTime',
      desc: '',
      args: [],
    );
  }

  /// `Run Date`
  String get runDate {
    return Intl.message(
      'Run Date',
      name: 'runDate',
      desc: '',
      args: [],
    );
  }

  /// `Hide Details`
  String get hideDetails {
    return Intl.message(
      'Hide Details',
      name: 'hideDetails',
      desc: '',
      args: [],
    );
  }

  /// `View Details`
  String get viewDetails {
    return Intl.message(
      'View Details',
      name: 'viewDetails',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error occurred.`
  String get unknownErrorOccurred {
    return Intl.message(
      'Unknown error occurred.',
      name: 'unknownErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get user {
    return Intl.message(
      'User',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `Operational`
  String get operational {
    return Intl.message(
      'Operational',
      name: 'operational',
      desc: '',
      args: [],
    );
  }

  /// `Please select a {label}`
  String pleaseSelect(Object label) {
    return Intl.message(
      'Please select a $label',
      name: 'pleaseSelect',
      desc: '',
      args: [label],
    );
  }

  /// `Admin`
  String get admin {
    return Intl.message(
      'Admin',
      name: 'admin',
      desc: '',
      args: [],
    );
  }

  /// `Operator`
  String get operator {
    return Intl.message(
      'Operator',
      name: 'operator',
      desc: '',
      args: [],
    );
  }

  /// `No Requests`
  String get noRequests {
    return Intl.message(
      'No Requests',
      name: 'noRequests',
      desc: '',
      args: [],
    );
  }

  /// `Generic`
  String get generic {
    return Intl.message(
      'Generic',
      name: 'generic',
      desc: '',
      args: [],
    );
  }

  /// `Engineering`
  String get engineering {
    return Intl.message(
      'Engineering',
      name: 'engineering',
      desc: '',
      args: [],
    );
  }

  /// `Front Office`
  String get frontOffice {
    return Intl.message(
      'Front Office',
      name: 'frontOffice',
      desc: '',
      args: [],
    );
  }

  /// `Housekeeping`
  String get housekeeping {
    return Intl.message(
      'Housekeeping',
      name: 'housekeeping',
      desc: '',
      args: [],
    );
  }

  /// `Registration Date`
  String get registrationDate {
    return Intl.message(
      'Registration Date',
      name: 'registrationDate',
      desc: '',
      args: [],
    );
  }

  /// `IP Address`
  String get ipAddress {
    return Intl.message(
      'IP Address',
      name: 'ipAddress',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred`
  String get anUnexpectedErrorOccurred {
    return Intl.message(
      'An unexpected error occurred',
      name: 'anUnexpectedErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection. Please check your internet.`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection. Please check your internet.',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Problem Topic`
  String get problemTopic {
    return Intl.message(
      'Problem Topic',
      name: 'problemTopic',
      desc: '',
      args: [],
    );
  }

  /// `SLA`
  String get sla {
    return Intl.message(
      'SLA',
      name: 'sla',
      desc: '',
      args: [],
    );
  }

  /// `Mr.`
  String get mr {
    return Intl.message(
      'Mr.',
      name: 'mr',
      desc: '',
      args: [],
    );
  }

  /// `Ms.`
  String get ms {
    return Intl.message(
      'Ms.',
      name: 'ms',
      desc: '',
      args: [],
    );
  }

  /// `Mrs.`
  String get mrs {
    return Intl.message(
      'Mrs.',
      name: 'mrs',
      desc: '',
      args: [],
    );
  }

  /// `Dr.`
  String get dr {
    return Intl.message(
      'Dr.',
      name: 'dr',
      desc: '',
      args: [],
    );
  }

  /// `Eng.`
  String get eng {
    return Intl.message(
      'Eng.',
      name: 'eng',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Member`
  String get member {
    return Intl.message(
      'Member',
      name: 'member',
      desc: '',
      args: [],
    );
  }

  /// `Topic Name`
  String get topicName {
    return Intl.message(
      'Topic Name',
      name: 'topicName',
      desc: '',
      args: [],
    );
  }

  /// `Request type deleted`
  String get requestTypeDeleted {
    return Intl.message(
      'Request type deleted',
      name: 'requestTypeDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Request type updated`
  String get requestTypeUpdated {
    return Intl.message(
      'Request type updated',
      name: 'requestTypeUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Request type added`
  String get requestTypeAdded {
    return Intl.message(
      'Request type added',
      name: 'requestTypeAdded',
      desc: '',
      args: [],
    );
  }

  /// `Member deleted`
  String get memberDeleted {
    return Intl.message(
      'Member deleted',
      name: 'memberDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Member updated`
  String get memberUpdated {
    return Intl.message(
      'Member updated',
      name: 'memberUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Member added`
  String get memberAdded {
    return Intl.message(
      'Member added',
      name: 'memberAdded',
      desc: '',
      args: [],
    );
  }

  /// `Problem deleted`
  String get problemDeleted {
    return Intl.message(
      'Problem deleted',
      name: 'problemDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Problem updated`
  String get problemUpdated {
    return Intl.message(
      'Problem updated',
      name: 'problemUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Problem added`
  String get problemAdded {
    return Intl.message(
      'Problem added',
      name: 'problemAdded',
      desc: '',
      args: [],
    );
  }

  /// `Request deleted`
  String get requestDeleted {
    return Intl.message(
      'Request deleted',
      name: 'requestDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Request updated`
  String get requestUpdated {
    return Intl.message(
      'Request updated',
      name: 'requestUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Request added`
  String get requestAdded {
    return Intl.message(
      'Request added',
      name: 'requestAdded',
      desc: '',
      args: [],
    );
  }

  /// `Topic deleted`
  String get topicDeleted {
    return Intl.message(
      'Topic deleted',
      name: 'topicDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Topic updated`
  String get topicUpdated {
    return Intl.message(
      'Topic updated',
      name: 'topicUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Topic added`
  String get topicAdded {
    return Intl.message(
      'Topic added',
      name: 'topicAdded',
      desc: '',
      args: [],
    );
  }

  /// `User deleted`
  String get userDeleted {
    return Intl.message(
      'User deleted',
      name: 'userDeleted',
      desc: '',
      args: [],
    );
  }

  /// `User updated`
  String get userUpdated {
    return Intl.message(
      'User updated',
      name: 'userUpdated',
      desc: '',
      args: [],
    );
  }

  /// `User added`
  String get userAdded {
    return Intl.message(
      'User added',
      name: 'userAdded',
      desc: '',
      args: [],
    );
  }

  /// `Worker deleted`
  String get workerDeleted {
    return Intl.message(
      'Worker deleted',
      name: 'workerDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Worker updated`
  String get workerUpdated {
    return Intl.message(
      'Worker updated',
      name: 'workerUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Worker added`
  String get workerAdded {
    return Intl.message(
      'Worker added',
      name: 'workerAdded',
      desc: '',
      args: [],
    );
  }

  /// `Department deleted`
  String get departmentDeleted {
    return Intl.message(
      'Department deleted',
      name: 'departmentDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Department updated`
  String get departmentUpdated {
    return Intl.message(
      'Department updated',
      name: 'departmentUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Department added`
  String get departmentAdded {
    return Intl.message(
      'Department added',
      name: 'departmentAdded',
      desc: '',
      args: [],
    );
  }

  /// `Location deleted`
  String get locationDeleted {
    return Intl.message(
      'Location deleted',
      name: 'locationDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Location updated`
  String get locationUpdated {
    return Intl.message(
      'Location updated',
      name: 'locationUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Location added`
  String get locationAdded {
    return Intl.message(
      'Location added',
      name: 'locationAdded',
      desc: '',
      args: [],
    );
  }

  /// `Server error`
  String get serverError {
    return Intl.message(
      'Server error',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get warning {
    return Intl.message(
      'Warning',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `Info`
  String get info {
    return Intl.message(
      'Info',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get loading {
    return Intl.message(
      'Loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `No data available`
  String get noDataAvailable {
    return Intl.message(
      'No data available',
      name: 'noDataAvailable',
      desc: '',
      args: [],
    );
  }

  /// `TicketAdded`
  String get ticketAdded {
    return Intl.message(
      'TicketAdded',
      name: 'ticketAdded',
      desc: '',
      args: [],
    );
  }

  /// `Closed Work Order`
  String get closedWorkOrder {
    return Intl.message(
      'Closed Work Order',
      name: 'closedWorkOrder',
      desc: '',
      args: [],
    );
  }

  /// `Open Work Order`
  String get openWorkOrder {
    return Intl.message(
      'Open Work Order',
      name: 'openWorkOrder',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get rating {
    return Intl.message(
      'Rating',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `By`
  String get by {
    return Intl.message(
      'By',
      name: 'by',
      desc: '',
      args: [],
    );
  }

  /// `Send Request`
  String get sendRequest {
    return Intl.message(
      'Send Request',
      name: 'sendRequest',
      desc: '',
      args: [],
    );
  }

  /// `Verfication Code`
  String get verficationCode {
    return Intl.message(
      'Verfication Code',
      name: 'verficationCode',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Cell Phone`
  String get cellPhone {
    return Intl.message(
      'Cell Phone',
      name: 'cellPhone',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Report fetched successfully`
  String get reportFetchedSuccessfully {
    return Intl.message(
      'Report fetched successfully',
      name: 'reportFetchedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Report`
  String get report {
    return Intl.message(
      'Report',
      name: 'report',
      desc: '',
      args: [],
    );
  }

  /// `Report added successfully`
  String get reportAddedSuccessfully {
    return Intl.message(
      'Report added successfully',
      name: 'reportAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Report updated successfully`
  String get reportUpdatedSuccessfully {
    return Intl.message(
      'Report updated successfully',
      name: 'reportUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Report deleted successfully`
  String get reportDeletedSuccessfully {
    return Intl.message(
      'Report deleted successfully',
      name: 'reportDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Report deleted`
  String get reportDeleted {
    return Intl.message(
      'Report deleted',
      name: 'reportDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Created at`
  String get createdAt {
    return Intl.message(
      'Created at',
      name: 'createdAt',
      desc: '',
      args: [],
    );
  }

  /// `Fixed at`
  String get fixedAt {
    return Intl.message(
      'Fixed at',
      name: 'fixedAt',
      desc: '',
      args: [],
    );
  }

  /// `Dep Time at`
  String get depTimeAt {
    return Intl.message(
      'Dep Time at',
      name: 'depTimeAt',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get duration {
    return Intl.message(
      'Duration',
      name: 'duration',
      desc: '',
      args: [],
    );
  }

  /// `for any closed feedback`
  String get forAnyClosedFeedback {
    return Intl.message(
      'for any closed feedback',
      name: 'forAnyClosedFeedback',
      desc: '',
      args: [],
    );
  }

  /// `for any closed work order`
  String get forAnyClosedWorkOrder {
    return Intl.message(
      'for any closed work order',
      name: 'forAnyClosedWorkOrder',
      desc: '',
      args: [],
    );
  }

  /// `for any feedback`
  String get forAnyFeedback {
    return Intl.message(
      'for any feedback',
      name: 'forAnyFeedback',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get neW {
    return Intl.message(
      'New',
      name: 'neW',
      desc: '',
      args: [],
    );
  }

  /// `Ticket updated`
  String get ticketUpdated {
    return Intl.message(
      'Ticket updated',
      name: 'ticketUpdated',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
