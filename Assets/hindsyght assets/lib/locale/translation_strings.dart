import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:micatalogs/l10n/messages_all.dart';

class Translations {
  static Future<Translations> load(Locale locale) {
    final String name =
        (locale.countryCode != null && locale.countryCode.isEmpty)
            ? locale.languageCode
            : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((dynamic _) {
      Intl.defaultLocale = localeName;
      return new Translations();
    });
  }

  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  String get localeCode {
    return Intl.message(
      'EN',
      name: 'localeCode',
    );
  }

  String get youMustEnterMobileNumber {
    return Intl.message(
      'You must enter Mobile number',
      name: 'youMustEnterMobileNumber',
    );
  }

  String get pinMustBeAtleast4Character {
    return Intl.message(
      'Pin must be atleast 4 character',
      name: 'pinMustBeAtleast4Character',
    );
  }

  String get pinMustBeSame {
    return Intl.message(
      'Pin must be same',
      name: 'pinMustBeSame',
    );
  }

  String get pinNotMatched {
    return Intl.message(
      'Pin not matched',
      name: 'pinNotMatched',
    );
  }

  String get nameMustBeAtleast3Character {
    return Intl.message(
      'Name must be atleast 3 character',
      name: 'nameMustBeAtleast3Character',
    );
  }

  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
    );
  }

  String get businessName {
    return Intl.message(
      'Business name',
      name: 'businessName',
    );
  }

  String get pin {
    return Intl.message(
      'Pin',
      name: 'pin',
    );
  }

  String get varificationCode {
    return Intl.message(
      'Verification Code',
      name: 'varificationCode',
    );
  }

  String get plzTypeTheVerificationCodeSentTo {
    return Intl.message(
      'Please type the verification code sent to',
      name: 'plzTypeTheVerificationCodeSentTo',
    );
  }

  String get dontReceiveTheCode {
    return Intl.message(
      "Don't receive the code ?",
      name: 'dontReceiveTheCode',
    );
  }

  String get enterNewPin {
    return Intl.message(
      'Enter new pin',
      name: 'enterNewPin',
    );
  }

  String get confirmPin {
    return Intl.message(
      'Cofirm pin',
      name: 'confirmPin',
    );
  }

  String get firstName {
    return Intl.message(
      'First name',
      name: 'firstName',
    );
  }

  String get lastName {
    return Intl.message(
      'Last name',
      name: 'lastName',
    );
  }

  String get email {
    return Intl.message(
      'Email',
      name: 'email',
    );
  }

  String get phoneNo {
    return Intl.message(
      'Phone No',
      name: 'phoneNo',
    );
  }

  String get address {
    return Intl.message(
      'Address',
      name: 'address',
    );
  }

  String get productTitle {
    return Intl.message(
      'Product title',
      name: 'productTitle',
    );
  }

  String get productPrice {
    return Intl.message(
      'Product price',
      name: 'productPrice',
    );
  }

  String get description {
    return Intl.message(
      'Description',
      name: 'description',
    );
  }

  String get noInternetConnection {
    return Intl.message(
      'No internet connection',
      name: 'noInternetConnection',
    );
  }

  String get plzTurnOnInternetConnectionAndTryAgain {
    return Intl.message(
      'Please turn on internet connection and try again.',
      name: 'plzTurnOnInternetConnectionAndTryAgain',
    );
  }

  String get tryAgain {
    return Intl.message(
      'Try again',
      name: 'tryAgain',
    );
  }

  String get sessionExpired {
    return Intl.message(
      'Session Expired',
      name: 'sessionExpired',
    );
  }

  String get yourSessionIsExpired {
    return Intl.message(
      'Your session is expired.',
      name: 'yourSessionIsExpired',
    );
  }

  String get youWillBeRedirectedToTheLogin {
    return Intl.message(
      'You will be redirected to the login.',
      name: 'youWillBeRedirectedToTheLogin',
    );
  }

  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
    );
  }

  String get toAccessThisFunctionality {
    return Intl.message(
      'To access this functionality you need to purchase plans.',
      name: 'toAccessThisFunctionality',
    );
  }

  String get upgrade {
    return Intl.message(
      'Upgrade',
      name: 'upgrade',
    );
  }

  String get validationError {
    return Intl.message(
      'Validation error !',
      name: 'validationError',
    );
  }

  String get exitApp {
    return Intl.message(
      'Exit app ?',
      name: 'exitApp',
    );
  }

  String get areYouSureWantToExitApp {
    return Intl.message(
      'Are you sure you want to exit application ?',
      name: 'areYouSureWantToExitApp',
    );
  }

  String get no {
    return Intl.message(
      'No',
      name: 'no',
    );
  }

  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
    );
  }

  String get areYouSureWantToLogout {
    return Intl.message(
      'Are you sure you want to logout ?',
      name: 'areYouSureWantToLogout',
    );
  }

  String get changeStatus {
    return Intl.message(
      'Change Status',
      name: 'changeStatus',
    );
  }

  String get areYouSureYouWantToChangeStatus {
    return Intl.message(
      'Are you sure you want to change status ?',
      name: 'areYouSureYouWantToChangeStatus',
    );
  }

  String get intructions {
    return Intl.message(
      'Intructions',
      name: 'intructions',
    );
  }

  String get nameShouldNotIncludeSymbols {
    return Intl.message(
      'Name should not include symbols like @#%...',
      name: 'nameShouldNotIncludeSymbols',
    );
  }

  String get youCanUseToSaperateWords {
    return Intl.message(
      'You can use - or _ to saperate words.',
      name: 'youCanUseToSaperateWords',
    );
  }

  String get nameShouldNotIncludeCapitalLetters {
    return Intl.message(
      'Name should not include capital letters.',
      name: 'nameShouldNotIncludeCapitalLetters',
    );
  }

  String get youCannotChangeDomainOnceYouCreated {
    return Intl.message(
      'You cannot change domain name once you created.',
      name: 'youCannotChangeDomainOnceYouCreated',
    );
  }

  String get imageNotSelected {
    return Intl.message(
      'Image not selected',
      name: 'imageNotSelected',
    );
  }

  String get plzSelectAtleastOneImage {
    return Intl.message(
      'Please select atleast one image',
      name: 'plzSelectAtleastOneImage',
    );
  }

  String get sorry {
    return Intl.message(
      'Sorry !',
      name: 'sorry',
    );
  }

  String get youCanNotSelectMoreThanImages {
    return Intl.message(
      'You can not select more than 6 images',
      name: 'youCanNotSelectMoreThanImages',
    );
  }

  String get catalogNotSelected {
    return Intl.message(
      'Catalog not Selected',
      name: 'catalogNotSelected',
    );
  }

  String get newVersionAvailable {
    return Intl.message(
      'New version available',
      name: 'newVersionAvailable',
    );
  }

  String get update {
    return Intl.message(
      'Update',
      name: 'update',
    );
  }

  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
    );
  }

  String get whatsNew {
    return Intl.message(
      "What's New :",
      name: 'whatsNew',
    );
  }

  String get termsAndConditions {
    return Intl.message(
      'terms & conditions.',
      name: 'termsAndConditions',
    );
  }

  String get plzAgreeWithTermsAndConditions {
    return Intl.message(
      'Please Agree with terms & conditions.',
      name: 'plzAgreeWithTermsAndConditions',
    );
  }

  String get continu {
    return Intl.message(
      'Continue',
      name: 'continu',
    );
  }

  String get loading {
    return Intl.message(
      'Loading',
      name: 'loading',
    );
  }

  String get catalogTitle {
    return Intl.message(
      'Catalog title',
      name: 'catalogTitle',
    );
  }

  String get selectParentCatalog {
    return Intl.message(
      'Select Parent Catalog',
      name: 'selectParentCatalog',
    );
  }

  String get selectCatalog {
    return Intl.message(
      'Select Catalog',
      name: 'selectCatalog',
    );
  }

  String get makeItMainCatalog {
    return Intl.message(
      'Make it Main-Catalog',
      name: 'makeItMainCatalog',
    );
  }

  String get makeItSubCatalog {
    return Intl.message(
      'Make it Sub-Catalog',
      name: 'makeItSubCatalog',
    );
  }

  String get create {
    return Intl.message(
      'Create',
      name: 'create',
    );
  }

  String get selectParentCatalogFirst {
    return Intl.message(
      "Select parent catalog first",
      name: 'selectParentCatalogFirst',
    );
  }

  String get fieldCannotBeImpty {
    return Intl.message(
      "Field cannot be empty",
      name: 'fieldCannotBeImpty',
    );
  }

  String get confirmDeleteCatalog {
    return Intl.message(
      "Confirm delete catalog",
      name: 'confirmDeleteCatalog',
    );
  }

  String get areYouSureWantToDeleteThisCatalog {
    return Intl.message(
      "Are you want to sure delete this catalog.",
      name: 'areYouSureWantToDeleteThisCatalog',
    );
  }

  String get confirmDeleteProduct {
    return Intl.message(
      "Confirm delete product",
      name: 'confirmDeleteProduct',
    );
  }

  String get areYouWantToSureDeleteThisProduct {
    return Intl.message(
      "Are you want to sure delete this product.",
      name: 'areYouWantToSureDeleteThisProduct',
    );
  }

  String get noDataFound {
    return Intl.message(
      "No data Found",
      name: 'noDataFound',
    );
  }

  String get scanQRcode {
    return Intl.message(
      "Scan QR code",
      name: 'scanQRcode',
    );
  }

  String get scanQRgivenIn {
    return Intl.message(
      "Scan QR given in web.micatalogs.com to access Admin panel",
      name: 'scanQRgivenIn',
    );
  }

  String get or {
    return Intl.message(
      'OR',
      name: 'or',
    );
  }

  String get continuewithGoogle {
    return Intl.message(
      'Continue With Google',
      name: 'continuewithGoogle',
    );
  }

  String get enterNumber {
    return Intl.message(
      "Enter number",
      name: 'enterNumber',
    );
  }

  String get youNeedToFillDetailsFirst {
    return Intl.message(
      "You need to fill details first",
      name: 'youNeedToFillDetailsFirst',
    );
  }

  String get sorryThisFeatureIsNotLongerAvailable {
    return Intl.message(
      "Sorry this feature is not longer available",
      name: 'sorryThisFeatureIsNotLongerAvailable',
    );
  }

  String get plzContinueWithGoogle {
    return Intl.message(
      "Please ! Continue with google..",
      name: 'plzContinueWithGoogle',
    );
  }

  String get invalidNumber {
    return Intl.message(
      "Invalid number",
      name: 'invalidNumber',
    );
  }

  String get resetPin {
    return Intl.message(
      "Reset Pin",
      name: 'resetPin',
    );
  }

  String get sendVerificationCode {
    return Intl.message(
      "Send verification Code",
      name: 'sendVerificationCode',
    );
  }

  String get dontHaveAnAccount {
    return Intl.message(
      "Don't have an account ?",
      name: 'dontHaveAnAccount',
    );
  }

  String get signUp {
    return Intl.message(
      "Sign-Up",
      name: 'signUp',
    );
  }

  String get forgetYourPin {
    return Intl.message(
      "Forget your pin ? ",
      name: 'forgetYourPin',
    );
  }

  String get login {
    return Intl.message(
      'Login',
      name: 'login',
    );
  }

  String get enterYourPinToProceedFurther {
    return Intl.message(
      'Enter your pin to proceed further.',
      name: 'enterYourPinToProceedFurther',
    );
  }

  String get enterPin {
    return Intl.message(
      'Enter Pin',
      name: 'enterPin',
    );
  }

  String get plzEnterValidPin {
    return Intl.message(
      "Please enter valid pin",
      name: 'plzEnterValidPin',
    );
  }

  String get newPin {
    return Intl.message(
      "New Pin",
      name: 'newPin',
    );
  }

  String get wrongVerificationCode {
    return Intl.message(
      "Wrong verification code!",
      name: 'wrongVerificationCode',
    );
  }

  String get resend {
    return Intl.message(
      "Resend",
      name: 'resend',
    );
  }

  String get verify {
    return Intl.message(
      "Verify",
      name: 'verify',
    );
  }

  String get domainName {
    return Intl.message(
      "Domain name",
      name: 'domainName',
    );
  }

  String get businessname {
    return Intl.message(
      "business-name",
      name: 'businessname',
    );
  }

  String get selectCategory {
    return Intl.message(
      "Select category",
      name: 'selectCategory',
    );
  }

  String get selectYourCurrency {
    return Intl.message(
      "Select your currency",
      name: 'selectYourCurrency',
    );
  }

  String get plzSelectCategory {
    return Intl.message(
      "Please select category",
      name: 'plzSelectCategory',
    );
  }

  String get whatsappNumber {
    return Intl.message(
      "Whatsapp Number",
      name: 'whatsappNumber',
    );
  }

  String get addProduct {
    return Intl.message(
      "Add Product",
      name: 'addProduct',
    );
  }

  String get save {
    return Intl.message(
      'Save',
      name: 'save',
    );
  }

  String get images {
    return Intl.message(
      'Images',
      name: 'images',
    );
  }

  String get sizaAndColor {
    return Intl.message(
      "Size and Color",
      name: 'sizaAndColor',
    );
  }

  String get basicInfo {
    return Intl.message(
      "Basic Info",
      name: 'basicInfo',
    );
  }

  String get discountPrice {
    return Intl.message(
      "Discount price",
      name: 'discountPrice',
    );
  }

  String get color {
    return Intl.message(
      'Color',
      name: 'color',
    );
  }

  String get colorNameMustBeSame {
    return Intl.message(
      'Color name must be same',
      name: 'colorNameMustBeSame',
    );
  }

  String get minimumOrderQty {
    return Intl.message(
      "Minimum Order Quantity",
      name: 'minimumOrderQty',
    );
  }

  String get maximumOrderQty {
    return Intl.message(
      "Maximum Order Quantity",
      name: 'maximumOrderQty',
    );
  }

  String get size {
    return Intl.message(
      'Size',
      name: 'size',
    );
  }

  String get sizeNameMustBeSame {
    return Intl.message(
      "Size name must be same",
      name: 'sizeNameMustBeSame',
    );
  }

  String get stockAvailability {
    return Intl.message(
      "Stock Availability",
      name: 'stockAvailability',
    );
  }

  String get available {
    return Intl.message(
      'Available',
      name: 'available',
    );
  }

  String get outOfStock {
    return Intl.message(
      "Out of Stock",
      name: 'outOfStock',
    );
  }

  String get availableQuantity {
    return Intl.message(
      "Availabile Quantity",
      name: 'availableQuantity',
    );
  }

  String get quantity {
    return Intl.message(
      "Quantity",
      name: 'quantity',
    );
  }

  String get setOrderQuantity {
    return Intl.message(
      "Set Order Quantity",
      name: 'setOrderQuantity',
    );
  }

  String get showOfStockProductToCatalogV {
    return Intl.message(
      "Show out of stock product to catalog visitor",
      name: 'showOfStockProductToCatalogV',
    );
  }

  String get allowVisitorsToPlaceAnOrderOn {
    return Intl.message(
      "Allow visitors to place an order on your out of stock product",
      name: 'allowVisitorsToPlaceAnOrderOn',
    );
  }

  String get addTagOnProduct {
    return Intl.message(
      "Add Tag on Product",
      name: 'addTagOnProduct',
    );
  }

  String get featuredProduct {
    return Intl.message(
      "Featured Product",
      name: 'featuredProduct',
    );
  }

  String get newProduct {
    return Intl.message(
      "New Product",
      name: 'newProduct',
    );
  }

  String get enterValidMinimunAndMaximunQty {
    return Intl.message(
      "Enter valid Minimum & Maximum order qty.",
      name: 'enterValidMinimunAndMaximunQty',
    );
  }

  String get plzPurchasePremiumPlan {
    return Intl.message(
      "Please purchase premium plan",
      name: 'plzPurchasePremiumPlan',
    );
  }

  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
    );
  }

  String get share {
    return Intl.message(
      'Share',
      name: 'share',
    );
  }

  String get whatsappShare {
    return Intl.message(
      'Whatsapp Share',
      name: 'whatsappShare',
    );
  }

  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
    );
  }

  String get sharePdf {
    return Intl.message(
      'Share PDF',
      name: 'sharePdf',
    );
  }

  String get removeFeatured {
    return Intl.message(
      "Remove Featured",
      name: 'removeFeatured',
    );
  }

  String get makeFeatured {
    return Intl.message(
      "Make Featured",
      name: 'makeFeatured',
    );
  }

  String get catalogActions {
    return Intl.message(
      "Catalog Actions",
      name: 'catalogActions',
    );
  }

  String get catalogs {
    return Intl.message(
      "Catalogs",
      name: 'catalogs',
    );
  }

  String get products {
    return Intl.message(
      "Products",
      name: 'products',
    );
  }

  String get search {
    return Intl.message(
      "Search",
      name: 'search',
    );
  }

  String get searchCatalog {
    return Intl.message(
      "Search catalog",
      name: 'searchCatalog',
    );
  }

  String get searchProduct {
    return Intl.message(
      "Search product",
      name: 'searchProduct',
    );
  }

  String get limitExceed {
    return Intl.message(
      "Limit Exceed",
      name: 'limitExceed',
    );
  }

  String get featured {
    return Intl.message(
      "Featured",
      name: 'featured',
    );
  }

  String get editProduct {
    return Intl.message(
      "Edit Product",
      name: 'editProduct',
    );
  }

  String get inquiries {
    return Intl.message(
      "Inquiries",
      name: 'inquiries',
    );
  }

  String get inquiryDetails {
    return Intl.message(
      "Inquiry details",
      name: 'inquiryDetails',
    );
  }

  String get message {
    return Intl.message(
      "Message",
      name: 'message',
    );
  }

  String get orderDetails {
    return Intl.message(
      "Orders details",
      name: 'orderDetails',
    );
  }

  String get totalPayment {
    return Intl.message(
      "Total Payment",
      name: 'totalPayment',
    );
  }

  String get note {
    return Intl.message(
      "Note",
      name: 'note',
    );
  }

  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
    );
  }

  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
    );
  }

  String get cancelled {
    return Intl.message(
      'Cancelled',
      name: 'cancelled',
    );
  }

  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
    );
  }

  String get businessDetails {
    return Intl.message(
      "Business Details",
      name: 'businessDetails',
    );
  }

  String get customDomain {
    return Intl.message(
      "Custom Domain",
      name: 'customDomain',
    );
  }

  String get extraNote {
    return Intl.message(
      "Extra Note",
      name: 'extraNote',
    );
  }

  String get details {
    return Intl.message(
      "Details",
      name: 'details',
    );
  }

  String get setDomain {
    return Intl.message(
      "Set Domain",
      name: 'setDomain',
    );
  }

  String get ifYouWillPurchaseYearlyPlan {
    return Intl.message(
      "If you will purchase yearly plan. you can set custom domain in",
      name: 'ifYouWillPurchaseYearlyPlan',
    );
  }

  String get free {
    return Intl.message(
      "Free.",
      name: 'free',
    );
  }

  String get ifYouWillPurchaseMonthlyPlan {
    return Intl.message(
      "If you will purchase monthly plan you need to pay extra",
      name: 'ifYouWillPurchaseMonthlyPlan',
    );
  }

  String get editDetails {
    return Intl.message(
      "Edit Details",
      name: 'editDetails',
    );
  }

  String get businessTagLine {
    return Intl.message(
      "Business Tag-line",
      name: 'businessTagLine',
    );
  }

  String get showBusinessTagLine {
    return Intl.message(
      "Show business Tag-line.",
      name: 'showBusinessTagLine',
    );
  }

  String get accountNumber {
    return Intl.message(
      "Account number",
      name: 'accountNumber',
    );
  }

  String get ifscCode {
    return Intl.message(
      "IFSC code",
      name: 'ifscCode',
    );
  }

  String get gstinNumber {
    return Intl.message(
      "GSTIN number",
      name: 'gstinNumber',
    );
  }

  String get bankName {
    return Intl.message(
      "Bank name",
      name: 'bankName',
    );
  }

  String get bankAddress {
    return Intl.message(
      "Bank address",
      name: 'bankAddress',
    );
  }

  String get hideBankDetailsFromCheckoutPage {
    return Intl.message(
      "Hide bank details from checkout page",
      name: 'hideBankDetailsFromCheckoutPage',
    );
  }

  String get showBusinessLogoInsteadOfName {
    return Intl.message(
      "Show business Logo instead of name.",
      name: 'showBusinessLogoInsteadOfName',
    );
  }

  String get businessEmail {
    return Intl.message(
      "Business-Email",
      name: 'businessEmail',
    );
  }

  String get businessAddress {
    return Intl.message(
      "Business address",
      name: 'businessAddress',
    );
  }

  String get editProfile {
    return Intl.message(
      "Edit Profile",
      name: 'editProfile',
    );
  }

  String get purchase {
    return Intl.message(
      "Purchase",
      name: 'purchase',
    );
  }

  String get paymentSuccessful {
    return Intl.message(
      "Payment successful",
      name: 'paymentSuccessful',
    );
  }

  String get planHistory {
    return Intl.message(
      "Plan history",
      name: 'planHistory',
    );
  }

  String get plans {
    return Intl.message(
      'Plans',
      name: 'plans',
    );
  }

  String get increaseCatalogAndProduct {
    return Intl.message(
      "Increase catalog and product storage and get more features by purchasing plans.",
      name: 'increaseCatalogAndProduct',
    );
  }

  String get features {
    return Intl.message(
      "Features",
      name: 'features',
    );
  }

  String get selected {
    return Intl.message(
      "Selected",
      name: 'selected',
    );
  }

  String get settings {
    return Intl.message(
      "Settings",
      name: 'settings',
    );
  }

  String get profile {
    return Intl.message(
      "Profile",
      name: 'profile',
    );
  }

  String get language {
    return Intl.message(
      "Language",
      name: 'language',
    );
  }

  String get upgradeYourPlan {
    return Intl.message(
      "Upgrade Your Plan",
      name: 'upgradeYourPlan',
    );
  }

  String get support {
    return Intl.message(
      "Support",
      name: 'support',
    );
  }

  String get logout {
    return Intl.message(
      "Logout",
      name: 'logout',
    );
  }

  String get pullUpLoad {
    return Intl.message(
      "pull up load",
      name: 'pullUpLoad',
    );
  }

  String get loadFailedClickRetry {
    return Intl.message(
      "Load Failed!Click retry!",
      name: 'loadFailedClickRetry',
    );
  }

  String get releaseToLoadMore {
    return Intl.message(
      "release to load more",
      name: 'releaseToLoadMore',
    );
  }

  String get noMoreData {
    return Intl.message(
      "No more Data",
      name: 'noMoreData',
    );
  }

  String get orderCount {
    return Intl.message(
      "Order Count",
      name: 'orderCount',
    );
  }

  String get inquiryCount {
    return Intl.message(
      "Inquiry Count",
      name: 'inquiryCount',
    );
  }

  String get webAdmin {
    return Intl.message(
      "Web Admin",
      name: 'webAdmin',
    );
  }

  String get myStore {
    return Intl.message(
      "My Store",
      name: 'myStore',
    );
  }

  String get copyUrl {
    return Intl.message(
      "Copy url",
      name: 'copyUrl',
    );
  }

  String get storeUrlCopied {
    return Intl.message(
      "Store url copied.",
      name: 'storeUrlCopied',
    );
  }

  String get createAtleastOneCatalog {
    return Intl.message(
      "Create atleast one Catalog",
      name: 'createAtleastOneCatalog',
    );
  }

  String get shareStore {
    return Intl.message(
      "Share Store",
      name: 'shareStore',
    );
  }

  String get preview {
    return Intl.message(
      "Preview",
      name: 'preview',
    );
  }

  String get paymentDetails {
    return Intl.message(
      "Payment details",
      name: 'paymentDetails',
    );
  }

  String get companyName {
    return Intl.message(
      "Company Name",
      name: 'companyName',
    );
  }

  String get currency {
    return Intl.message(
      "Currency",
      name: 'currency',
    );
  }

  String get selectYourLanguage {
    return Intl.message(
      "Select your language",
      name: 'selectYourLanguage',
    );
  }

  String get error {
    return Intl.message(
      "Error",
      name: 'error',
    );
  }

  String get plzSelectAnyOneCatalog {
    return Intl.message(
      "Please select any one catalog",
      name: 'plzSelectAnyOneCatalog',
    );
  }

  String get plzEnterValidMobileNumber {
    return Intl.message(
      "Please enter valid mobile number",
      name: 'plzEnterValidMobileNumber',
    );
  }

  String get enterValidEmail {
    return Intl.message(
      "Enter valid Email",
      name: 'enterValidEmail',
    );
  }

  String get plzFillTheFollowingDetails {
    return Intl.message(
      "Please fill the following details",
      name: 'plzFillTheFollowingDetails',
    );
  }

  String get enterValidWhatsappNumber {
    return Intl.message(
      "Enter valid Whatsapp number",
      name: 'enterValidWhatsappNumber',
    );
  }

  String get itIncludesSpecialCharacters {
    return Intl.message(
      "It includes special characters",
      name: 'itIncludesSpecialCharacters',
    );
  }

  String get egSmall {
    return Intl.message(
      "eg: Small",
      name: 'egSmall',
    );
  }

  String get egRed {
    return Intl.message(
      "eg: Red",
      name: 'egRed',
    );
  }

  String get enterValidQuantity {
    return Intl.message(
      "Enter valid quantity",
      name: 'enterValidQuantity',
    );
  }

  String get enterValidDomainName {
    return Intl.message(
      "Enter valid Domain name.",
      name: 'enterValidDomainName',
    );
  }

  String get tagLineMaxIn20Characters {
    return Intl.message(
      "Tag line text max in 20 characters.",
      name: 'tagLineMaxIn20Characters',
    );
  }

  String get category {
    return Intl.message(
      "Category",
      name: 'category',
    );
  }

  String get showAndEditProfileDetails {
    return Intl.message(
      "Show and edit your profile details",
      name: 'showAndEditProfileDetails',
    );
  }

  String get showAndEditBusinessDetails {
    return Intl.message(
      "Show and edit your business details",
      name: 'showAndEditBusinessDetails',
    );
  }

  String get subscriptions {
    return Intl.message(
      "Subscriptions",
      name: 'subscriptions',
    );
  }

  String get subscribeOurPremiumPlanToGet {
    return Intl.message(
      "Subscribe our premium plan to get more features",
      name: 'subscribeOurPremiumPlanToGet',
    );
  }

  String get languages {
    return Intl.message(
      "Languages",
      name: 'languages',
    );
  }

  String get availableInSixLanguages {
    return Intl.message(
      "Available in multiple languages",
      name: 'availableInSixLanguages',
    );
  }

  String get paymentMethod {
    return Intl.message(
      "Payment Method",
      name: 'paymentMethod',
    );
  }

  String get setPaymentMethodsForYourShop {
    return Intl.message(
      "Set payment methods for your shop",
      name: 'setPaymentMethodsForYourShop',
    );
  }

  String get setYourOwnDomainName {
    return Intl.message(
      "Set your own domain name",
      name: 'setYourOwnDomainName',
    );
  }

  String get getInstantSupportFromTeam {
    return Intl.message(
      "Get instant support from MiCatalogs team",
      name: 'getInstantSupportFromTeam',
    );
  }

  String get logoutYourAcc {
    return Intl.message(
      "Logout your account",
      name: 'logoutYourAcc',
    );
  }

  String get paymentMethods {
    return Intl.message(
      "Payment Methods",
      name: 'paymentMethods',
    );
  }

  String get selectPaymentMethods {
    return Intl.message(
      "Select Payment Method",
      name: 'selectPaymentMethods',
    );
  }

  String get cod {
    return Intl.message(
      "Cash On Delivery",
      name: 'cod',
    );
  }

  String get active {
    return Intl.message(
      "Active",
      name: 'active',
    );
  }

  String get deactive {
    return Intl.message(
      "Deactive",
      name: 'deactive',
    );
  }

  String get areYouSureWantToDeleteThisMethod {
    return Intl.message(
      "Are you sure want to delete this method ?",
      name: 'areYouSureWantToDeleteThisMethod',
    );
  }

  String get plzSelectPaymentMethod {
    return Intl.message(
      "Please select payment method",
      name: 'plzSelectPaymentMethod',
    );
  }

  String get paymentKeys {
    return Intl.message(
      "Payment keys",
      name: 'paymentKeys',
    );
  }

  String get selectYourPaymentMethod {
    return Intl.message(
      "Select your payment method",
      name: 'selectYourPaymentMethod',
    );
  }

  String get publicKey {
    return Intl.message(
      "Public Key",
      name: 'publicKey',
    );
  }

  String get privateKey {
    return Intl.message(
      "Private Key",
      name: 'privateKey',
    );
  }

  String get sendRequest {
    return Intl.message(
      "Send Request",
      name: 'sendRequest',
    );
  }

  String get accepted {
    return Intl.message(
      "Accepted",
      name: 'accepted',
    );
  }

  String get packingAndShippingOptinal {
    return Intl.message(
      "Packing & Shipping(optional)",
      name: 'packingAndShippingOptinal',
    );
  }

  String get estimatedDeliveryDate {
    return Intl.message(
      "Estimated delivery date",
      name: 'estimatedDeliveryDate',
    );
  }

  String get selectDate {
    return Intl.message(
      "Select Date",
      name: 'selectDate',
    );
  }

  String get done {
    return Intl.message(
      "Done",
      name: 'done',
    );
  }

  String get writeReason {
    return Intl.message(
      "Write reason",
      name: 'writeReason',
    );
  }

  String get inProcess {
    return Intl.message(
      "In Process",
      name: 'inProcess',
    );
  }

  String get shippingDetails {
    return Intl.message(
      "Shipping Details",
      name: 'shippingDetails',
    );
  }

  String get orderTrackingLink {
    return Intl.message(
      "Order tracking link",
      name: 'orderTrackingLink',
    );
  }

  String get entertrackingLink {
    return Intl.message(
      "Enter tracking link",
      name: 'entertrackingLink',
    );
  }

  String get orderCancellationReason {
    return Intl.message(
      "Order cancellation reason",
      name: 'orderCancellationReason',
    );
  }

  String get enterValidLink {
    return Intl.message(
      "Enter valid link",
      name: 'enterValidLink',
    );
  }

  String get selectCountry {
    return Intl.message(
      "Select country",
      name: 'selectCountry',
    );
  }

  String get selectState {
    return Intl.message(
      "Select state",
      name: 'selectState',
    );
  }

  String get selectCity {
    return Intl.message(
      "Select city",
      name: 'selectCity',
    );
  }

  String get webStoreLang {
    return Intl.message(
      "Web store language",
      name: 'webStoreLang',
    );
  }

  String get selectStoreLang {
    return Intl.message(
      "Select store language",
      name: 'selectStoreLang',
    );
  }

  String get customers {
    return Intl.message(
      "Customers",
      name: 'customers',
    );
  }

  String get remainingTime {
    return Intl.message(
      "Remaining Time",
      name: 'remainingTime',
    );
  }

  String get days {
    return Intl.message(
      "Days",
      name: 'days',
    );
  }

  String get currentPlan {
    return Intl.message(
      "Current Plan",
      name: 'currentPlan',
    );
  }

  String get planExtension {
    return Intl.message(
      "Plan Extension",
      name: 'planExtension',
    );
  }

  String get convertYourplanMonthlyToYearly {
    return Intl.message(
      "Convert your plan monthly to yearly",
      name: 'convertYourplanMonthlyToYearly',
    );
  }

  String get reviewUsOnPlayStore {
    return Intl.message(
      "Review us on play store",
      name: 'reviewUsOnPlayStore',
    );
  }

  String get expiryDate {
    return Intl.message(
      "Expiry Date",
      name: 'expiryDate',
    );
  }

  String get subscribeNow {
    return Intl.message(
      "Subscribe Now",
      name: 'subscribeNow',
    );
  }

  String get rateAndReview {
    return Intl.message(
      "Rate & Review",
      name: 'rateAndReview',
    );
  }

  String get deleteInquiries {
    return Intl.message(
      "Delete Inquiries",
      name: 'deleteInquiries',
    );
  }

  String get areYouSureWantToDeleteThisInquiries {
    return Intl.message(
      "Are you sure want to delete this inquiries?",
      name: 'areYouSureWantToDeleteThisInquiries',
    );
  }

  String get manufacturer {
    return Intl.message(
      "Manufacturer",
      name: 'manufacturer',
    );
  }

  String get wholesaler {
    return Intl.message(
      "Wholesaler",
      name: 'wholesaler',
    );
  }

  String get distributor {
    return Intl.message(
      "Distributor",
      name: 'distributor',
    );
  }

  String get exporter {
    return Intl.message(
      "Exporter",
      name: 'exporter',
    );
  }

  String get reseller {
    return Intl.message(
      "Reseller",
      name: 'reseller',
    );
  }

  String get agent {
    return Intl.message(
      "Agent",
      name: 'agent',
    );
  }

  String get referAndEarn {
    return Intl.message(
      "Refer & Earn",
      name: 'referAndEarn',
    );
  }

  String get referYourFriendsAndEarnExtraRewards {
    return Intl.message(
      "Refer your friends and earn extra rewards.",
      name: 'referYourFriendsAndEarnExtraRewards',
    );
  }

  String get shareYourReferralCodeWithYourFriends {
    return Intl.message(
      "Share your referral code with your friends.",
      name: 'shareYourReferralCodeWithYourFriends',
    );
  }

  String get referralCode {
    return Intl.message(
      "Referral Code:",
      name: 'referralCode',
    );
  }

  String get successfullyCopied {
    return Intl.message(
      "Sucessfully Copied",
      name: 'successfullyCopied',
    );
  }

  String get shareWithWhatsapp {
    return Intl.message(
      "Share with Whatsapp",
      name: 'shareWithWhatsapp',
    );
  }

  String get referOneYearlySubscriptionAnd {
    return Intl.message(
      "Refer 1 yearly subscripiton and get 3 months extension.",
      name: 'referOneYearlySubscriptionAnd',
    );
  }

  String get referThreeMonthlySubscriptionAnd {
    return Intl.message(
      "Refer 3 monthly subscription and get 1 month extension.",
      name: 'referThreeMonthlySubscriptionAnd',
    );
  }

  String get registerWithReferralCodeAnd {
    return Intl.message(
      "Register with referral code and get 2 month extra on yearly subscription.",
      name: 'registerWithReferralCodeAnd',
    );
  }

  String get doYouHaveAnyReferralCode {
    return Intl.message(
      "Dou you have referral code?",
      name: 'doYouHaveAnyReferralCode',
    );
  }

  String get enterReferralCode {
    return Intl.message(
      "Enter referral code",
      name: 'enterReferralCode',
    );
  }

  String get storeBanners {
    return Intl.message(
      "Store Banners",
      name: 'storeBanners',
    );
  }

  String get showAndEditYourStoreBanners {
    return Intl.message(
      "Show and edit your store banners",
      name: 'showAndEditYourStoreBanners',
    );
  }

  String get navigationLink {
    return Intl.message(
      "Navigation link",
      name: 'navigationLink',
    );
  }

  String get youCantUploadMoreBanners {
    return Intl.message(
      "You can't upload more banners",
      name: 'youCantUploadMoreBanners',
    );
  }

  String get editBanner {
    return Intl.message(
      "Edit Banner",
      name: 'editBanner',
    );
  }

  String get deleteBanner {
    return Intl.message(
      "Delete Banner",
      name: 'deleteBanner',
    );
  }

  String get bannerRemoveMsg {
    return Intl.message(
      "Are you sure want to remove this banner from your web store",
      name: 'bannerRemoveMsg',
    );
  }

  String get addImage {
    return Intl.message(
      "Add Image",
      name: 'addImage',
    );
  }

  String get addBanner {
    return Intl.message(
      "Add Banner",
      name: 'addBanner',
    );
  }

  String get enterBannerNavigationLink {
    return Intl.message(
      "Enter banner navigation link",
      name: 'enterBannerNavigationLink',
    );
  }

  String get plzSelectTheBannerImage {
    return Intl.message(
      "Please select the banner image",
      name: 'plzSelectTheBannerImage',
    );
  }

  String get trial {
    return Intl.message(
      "Trial",
      name: 'trial',
    );
  }

  String get premium {
    return Intl.message(
      "Premium",
      name: 'premium',
    );
  }

  String get emailNotAvailable {
    return Intl.message(
      "Email not available",
      name: 'emailNotAvailable',
    );
  }

  String get checkOutMyStore {
    return Intl.message(
      "Check out my store",
      name: 'checkOutMyStore',
    );
  }

  String get bannerSizeMustBeInpx {
    return Intl.message(
      "Your banner size must be in 1920px x 500px.",
      name: 'bannerSizeMustBeInpx',
    );
  }

  String get createMenu {
    return Intl.message(
      "Create Menu",
      name: 'createMenu',
    );
  }

  String get enterYourCuisineTypes {
    return Intl.message(
      "Enter your Cuisine Types",
      name: 'enterYourCuisineTypes',
    );
  }

  String get exSouthIndianEtc {
    return Intl.message(
      "Ex.South Indian, etc.",
      name: 'exSouthIndianEtc',
    );
  }

  String get enterYourDishName {
    return Intl.message(
      "Enter your Dish Name",
      name: 'enterYourDishName',
    );
  }

  String get exMasalaDhosaEtc {
    return Intl.message(
      "Ex.Masala Dhosa, etc.",
      name: 'exMasalaDhosaEtc',
    );
  }

  String get enterDishDescription {
    return Intl.message(
      "Enter Dish Description",
      name: 'enterDishDescription',
    );
  }

  String get enterPrice {
    return Intl.message(
      "Enter Price",
      name: 'enterPrice',
    );
  }

  String get exRs200etc {
    return Intl.message(
      "Ex.Rs220, etc.",
      name: 'exRs200etc',
    );
  }

  String get discountedPrice {
    return Intl.message(
      "Discounted Price",
      name: 'discountedPrice',
    );
  }

  String get exRs199etc {
    return Intl.message(
      "Ex.Rs199, etc.",
      name: 'exRs199etc',
    );
  }

  String get createTags {
    return Intl.message(
      "Create Tags",
      name: 'createTags',
    );
  }

  String get enterTagName {
    return Intl.message(
      "Enter tag name",
      name: 'enterTagName',
    );
  }

  String get addRestaurant {
    return Intl.message(
      "Add Restaurant",
      name: 'addRestaurant',
    );
  }

  String get addLogo {
    return Intl.message(
      "Add Logo",
      name: 'addLogo',
    );
  }

  String get whereIsYourRestaurant {
    return Intl.message(
      "Where is your restaurant?",
      name: 'whereIsYourRestaurant',
    );
  }

  String get enterYourAddress {
    return Intl.message(
      "Enter your address",
      name: 'enterYourAddress',
    );
  }

  String get whichTypeOfRestaurant {
    return Intl.message(
      "Which type of restaurant?",
      name: 'whichTypeOfRestaurant',
    );
  }

  String get vegetarian {
    return Intl.message(
      "Vegetarian",
      name: 'vegetarian',
    );
  }

  String get nonVegetarian {
    return Intl.message(
      "Non Vegetarian",
      name: 'nonVegetarian',
    );
  }

  String get both {
    return Intl.message(
      "Both",
      name: 'both',
    );
  }

  String get next {
    return Intl.message(
      "NEXT",
      name: 'next',
    );
  }

  String get changeAddress {
    return Intl.message(
      "Change Address",
      name: 'changeAddress',
    );
  }

  String get enterRestaurantAddress {
    return Intl.message(
      "Enter Restaurant Address",
      name: 'enterRestaurantAddress',
    );
  }

  String get localityName {
    return Intl.message(
      "Locality Name",
      name: 'localityName',
    );
  }

  String get enterValidAddressField {
    return Intl.message(
      "Enter valid address field",
      name: 'enterValidAddressField',
    );
  }

  String get enterValidLocalityField {
    return Intl.message(
      "Enter valid locality field",
      name: 'enterValidLocalityField',
    );
  }

  String get allDishes {
    return Intl.message(
      "All Dishes",
      name: 'allDishes',
    );
  }

  String get addDish {
    return Intl.message(
      "Add Dish",
      name: 'addDish',
    );
  }

  String get off {
    return Intl.message(
      "OFF",
      name: 'off',
    );
  }

  String get availability {
    return Intl.message(
      "Availability",
      name: 'availability',
    );
  }

  String get inWhichDaysWillYourRestaurantContinue {
    return Intl.message(
      "In which days will your restaurant continue?",
      name: 'inWhichDaysWillYourRestaurantContinue',
    );
  }

  String get allDays {
    return Intl.message(
      "All Days",
      name: 'allDays',
    );
  }

  String get selectDays {
    return Intl.message(
      "Select Days",
      name: 'selectDays',
    );
  }

  String get setTimeSlot {
    return Intl.message(
      "Set time slot",
      name: 'setTimeSlot',
    );
  }

  String get maximumDistanceForFoodDelivery {
    return Intl.message(
      "Maximum distance for food delivery",
      name: 'maximumDistanceForFoodDelivery',
    );
  }

  String get currentLocation {
    return Intl.message(
      "Current Location",
      name: 'currentLocation',
    );
  }

  String get selectDeliveryMode {
    return Intl.message(
      "Select delivery mode",
      name: 'selectDeliveryMode',
    );
  }

  String get pickUpByYourself {
    return Intl.message(
      "Pick up by yourself",
      name: 'pickUpByYourself',
    );
  }

  String get deliveryByRestaurant {
    return Intl.message(
      "Delivery by Restaurant",
      name: 'deliveryByRestaurant',
    );
  }

  String get pleaseEnableYourLocation {
    return Intl.message(
      "Please enable your location",
      name: 'pleaseEnableYourLocation',
    );
  }

  String get createYourOnlineStore {
    return Intl.message(
      "Create your online store",
      name: 'createYourOnlineStore',
    );
  }

  String get restaurant {
    return Intl.message(
      "Restaurant",
      name: 'restaurant',
    );
  }

  String get all {
    return Intl.message(
      "All",
      name: 'all',
    );
  }

  String get startTime {
    return Intl.message(
      "Start Time",
      name: 'startTime',
    );
  }

  String get endTime {
    return Intl.message(
      "End Time",
      name: 'endTime',
    );
  }

  String get timeMustBeSame {
    return Intl.message(
      "Time must be same",
      name: 'timeMustBeSame',
    );
  }

  String get enterValidTime {
    return Intl.message(
      "Enter valid time",
      name: 'enterValidTime',
    );
  }

  String get open24hours {
    return Intl.message(
      "Open 24 hours",
      name: 'open24hours',
    );
  }

  String get setLocation {
    return Intl.message(
      "Set Location",
      name: 'setLocation',
    );
  }

  String get yourLocation {
    return Intl.message(
      "Your location",
      name: 'yourLocation',
    );
  }

  String get localityNotFound {
    return Intl.message(
      "Locality not found",
      name: 'localityNotFound',
    );
  }

  String get change {
    return Intl.message(
      "CHANGE",
      name: 'change',
    );
  }

  String get addressNotFound {
    return Intl.message(
      "Address not found",
      name: 'addressNotFound',
    );
  }

  String get pleaseSelectYourAddress {
    return Intl.message(
      "Please select your address",
      name: 'pleaseSelectYourAddress',
    );
  }

  String get confirmLocation {
    return Intl.message(
      "Confirm Location",
      name: 'confirmLocation',
    );
  }

  String get storeDeliveryCharge {
    return Intl.message(
      "Store Delivery Charge",
      name: 'storeDeliveryCharge',
    );
  }

  String get freeDelivery {
    return Intl.message(
      "Free delivery",
      name: 'freeDelivery',
    );
  }

  String get addDeliveryCharge {
    return Intl.message(
      "Add Delivery Charge",
      name: 'addDeliveryCharge',
    );
  }

  String get enterDeliveryCharge {
    return Intl.message(
      "Enter Delivery Charge",
      name: 'enterDeliveryCharge',
    );
  }

  String get restaurantAvailability {
    return Intl.message(
      "Restaurant Availability",
      name: 'restaurantAvailability',
    );
  }

  String get availabilityOfYourRestaurant {
    return Intl.message(
      "Availability of your restaurant",
      name: 'availabilityOfYourRestaurant',
    );
  }

  String get unlimited {
    return Intl.message(
      "Unlimited",
      name: 'unlimited',
    );
  }

  String get freee {
    return Intl.message(
      "Free",
      name: 'freee',
    );
  }

  String get shippingCharge {
    return Intl.message(
      "Shipping Charge",
      name: 'shippingCharge',
    );
  }

  String get shippingCharge2 {
    return Intl.message(
      "SHIPPING CHARGE",
      name: 'shippingCharge2',
    );
  }

  String get invoice {
    return Intl.message(
      "INVOICE",
      name: 'invoice',
    );
  }

  String get date {
    return Intl.message(
      "DATE",
      name: 'date',
    );
  }

  String get orderNo {
    return Intl.message(
      "ORDER NO.",
      name: 'orderNo',
    );
  }

  String get address2 {
    return Intl.message(
      "ADDRESS",
      name: 'address2',
    );
  }

  String get name2 {
    return Intl.message(
      "NAME",
      name: 'name2',
    );
  }

  String get email2 {
    return Intl.message(
      "EMAIL",
      name: 'email2',
    );
  }

  String get phoneNumber {
    return Intl.message(
      "PHONE NUMBER",
      name: 'phoneNumber',
    );
  }

  String get subTotal {
    return Intl.message(
      "SUB TOTAL",
      name: 'subTotal',
    );
  }

  String get totalAmount {
    return Intl.message(
      "TOTAL AMOUNT",
      name: 'totalAmount',
    );
  }

  String get markAsCompleted {
    return Intl.message(
      "Mark as Completed",
      name: 'markAsCompleted',
    );
  }

  String get markAsCancelled {
    return Intl.message(
      "Mark as Cancelled",
      name: 'markAsCancelled',
    );
  }

  String get markAsPending {
    return Intl.message(
      "Mark as Pending",
      name: 'markAsPending',
    );
  }

  String get productName {
    return Intl.message(
      "PRODUCT NAME",
      name: 'productName',
    );
  }

  String get quantity2 {
    return Intl.message(
      "QUANTITY",
      name: 'quantity2',
    );
  }

  String get totalPrice {
    return Intl.message(
      "TOTAL PRICE",
      name: 'totalPrice',
    );
  }

  String get enterValidPixelId {
    return Intl.message(
      "Enter valid pixel id",
      name: 'enterValidPixelId',
    );
  }

  String get analytics {
    return Intl.message(
      "Analytics",
      name: 'analytics',
    );
  }

  String get faceboolPixelAndGoogleAnalytics {
    return Intl.message(
      "Facebook Pixel and Google Analytics",
      name: 'faceboolPixelAndGoogleAnalytics',
    );
  }

  String get facebookPixel {
    return Intl.message(
      "Facebook Pixel",
      name: 'facebookPixel',
    );
  }

  String get enterKeyId {
    return Intl.message(
      "Enter Key ID",
      name: 'enterKeyId',
    );
  }

  String get getHelp {
    return Intl.message(
      "Get Help ?",
      name: 'getHelp',
    );
  }

  String get googleAnalytics {
    return Intl.message(
      "Google Analytics",
      name: 'googleAnalytics',
    );
  }

  String get enterTrackingId {
    return Intl.message(
      "Enter Tracking ID",
      name: 'enterTrackingId',
    );
  }

  String get trialplan {
    return Intl.message(
      "Trial",
      name: 'trialplan',
    );
  }

  String get monthlyPlan {
    return Intl.message(
      "Monthly",
      name: 'monthlyPlan',
    );
  }

  String get yearlyplan {
    return Intl.message(
      "Yearly",
      name: 'yearlyplan',
    );
  }
}
