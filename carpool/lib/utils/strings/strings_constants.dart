import 'package:flutter/rendering.dart';

import '../strings/models/app_language_model.dart';

const appLanguages = [
  AppLanguageModel(
    languageCode: "pt",
    languageStringsJsonPath: "assets/strings/strings_pt.json",
  ),
  AppLanguageModel(
    languageCode: "en",
    languageStringsJsonPath: "assets/strings/strings_en.json",
  ),
];

// Strings Keys
const String app_title = "app_title";
const String common_app_title = "common_app_title";
const String common_login_title = "common_login_title";
const String home_page_metrics_label = "home_page_metrics_label";
const String home_page_schedule_label = "home_page_schedule_label";
const String home_page_messages_label = "home_page_messages_label";
const String home_page_publish_label = "home_page_publish_label";
const String home_page_search_label = "home_page_search_label";
const String home_page_search_from_label = "home_page_search_from_label";
const String home_page_search_to_label = "home_page_search_to_label";
const String home_page_search_to_optional_label =
    "home_page_search_to_optional_label";
const String home_page_search_date_label = "home_page_search_date_label";
const String home_page_disable = "home_page_disable";
const String home_page_search_hour_label = "home_page_search_hour_label";
const String home_page_search_number_of_passengers_label =
    "home_page_search_number_of_passengers_label";
const String home_page_publish_google_unable = "home_page_publish_google_unable";
const String home_page_publish_google_autocomplete = "home_page_publish_google_autocomplete";
const String home_page_publish_number_of_passengers_label =
    "home_page_publish_number_of_passengers_label";
const String home_page_search_enter_start_msg =
    "home_page_search_enter_start_msg";
const String home_page_search_enter_destination_msg =
    "home_page_search_enter_destination_msg";
const String home_page_search_enter_number_of_passengers_msg =
    "home_page_search_enter_number_of_passengers_msg";
const String home_page_search_enter_valid_number_msg =
    "home_page_search_enter_valid_number_msg";
const String home_page_navigation_search_quote_one =
    "home_page_navigation_search_quote_one";
const String home_page_navigation_schedule_quote_one =
    "home_page_navigation_schedule_quote_one";
const String home_page_navigation_schedule_quote_one_expired =
    "home_page_navigation_schedule_quote_one_expired";
const String home_page_navigation_search_quote_two =
    "home_page_navigation_search_quote_two";
const String home_page_navigation_schedule_quote_two =
    "home_page_navigation_schedule_quote_two";
const String home_page_navigation_schedule_quote_two_expired =
    "home_page_navigation_schedule_quote_two_expired";

const String home_page_navigation_publish_quote_one =
    "home_page_navigation_publish_quote_one";
const String home_page_navigation_publish_quote_two =
    "home_page_navigation_publish_quote_two";
const String home_page_publish_car = "home_page_publish_car";
const String home_page_publish_car_name = "home_page_publish_car_name";
const String home_page_publish_car_save = "home_page_publish_car_save";
const String home_page_publish_invalid_car_consumption =
    "home_page_publish_invalid_car_consumption";
const String home_page_publish_enter_car_consumption =
    "home_page_publish_enter_car_consumption";
const String home_page_publish_enter_car_name =
    "home_page_publish_enter_car_name";
const String home_page_publish_enter_date = "home_page_publish_enter_date";
const String home_page_publish_enter_hour = "home_page_publish_enter_hour";
const String home_page_publish_car_consumption =
    "home_page_publish_car_consumption";
const String home_page_search_dialog_title = "home_page_search_dialog_title";
const String home_page_search_dialog_body = "home_page_search_dialog_body";
const String home_page_search_dialog_cancel = "home_page_search_dialog_cancel";
const String home_page_search_dialog_login = "home_page_search_dialog_login";
const String home_page_navigation_cancel_ride =
    "home_page_navigation_cancel_ride";
const String home_page_navigation_confirm_ride =
    "home_page_navigation_confirm_ride";
const String home_page_navigation_user_removed_success =
    "home_page_navigation_user_removed_success";
const String home_page_navigation_error_removing_user =
    "home_page_navigation_error_removing_user";
const String home_page_navigation_no_rides_msg =
    "home_page_navigation_no_rides_msg";
const String home_page_navigation_error_fetching =
    "home_page_navigation_error_fetching";
const String home_page_navigation_seats = "home_page_navigation_seats";
const String home_page_navigation_seats_to_remove =
    "home_page_navigation_seats_to_remove";
const String home_page_navigation_remove_seats =
    "home_page_navigation_remove_seats";
const String home_page_navigation_active = "home_page_navigation_active";
const String home_page_navigation_expired = "home_page_navigation_expired";
const String home_page_navigation_waiting = "home_page_navigation_waiting";
const String home_page_navigation_no_active_rides_one =
    "home_page_navigation_no_active_rides_one";
const String home_page_navigation_no_active_rides_two =
    "home_page_navigation_no_active_rides_two";
const String home_page_navigation_no_expired_rides =
    "home_page_navigation_no_expired_rides";

const String home_page_navigation_other = "home_page_navigation_other";
const String home_page_unable_to_fetch_cars = "home_page_unable_to_fetch_cars";

const String home_page_navigation_metrics_quote_one =
    "home_page_navigation_metrics_quote_one";
const String home_page_navigation_metrics_quote_two =
    "home_page_navigation_metrics_quote_two";

const String home_page_navigation_distance = "home_page_navigation_distance";
const String home_page_navigation_expected_duration =
    "home_page_navigation_expected_duration";
const String home_page_navigation_allocated_seats =
    "home_page_navigation_allocated_seats";
const String home_page_navigation_available_seats =
    "home_page_navigation_available_seats";
const String home_page_navigation_reserved_seats =
    "home_page_navigation_reserved_seats";
const String home_page_navigation_available_disable_friendly =
    "home_page_navigation_available_disable_friendly";
const String home_page_navigation_ride_confirm_notifications_sent_sucessfully =
    "home_page_navigation_ride_confirm_notifications_sent_sucessfully";
const String home_page_navigation_ride_added_successfully =
    "home_page_navigation_ride_added_successfully";
const String home_page_navigation_failed_to_add_ride =
    "home_page_navigation_failed_to_add_ride";
const String home_page_navigation_error_loading_chats =
    "home_page_navigation_error_loading_chats";
const String home_page_navigation_please_login =
    "home_page_navigation_please_login";
const String home_page_navigation_rate = "home_page_navigation_rate";
const String home_page_navigation_passenger_rated_successfuly =
    "home_page_navigation_passenger_rated_successfuly";
const String home_page_navigation_error_rating_passenger =
    "home_page_navigation_error_rating_passenger";


const String metrics_page_total_distance = "metrics_page_total_distance";
const String metrics_page_accumulated_usage = "metrics_page_accumulated_usage";
const String metrics_page_total_rides = "metrics_page_total_rides";
const String home_page_navigation_no_chats = "home_page_navigation_no_chats";
const String metrics_page_CO2_saved = "metrics_page_CO2_saved";
const String metrics_page_fuel_saved = "metrics_page_fuel_saved";
const String metrics_page_graph_description = "metrics_page_graph_description";
const String metrics_page_graph_subtitle_last_week =
    "metrics_page_graph_subtitle_last_week";
const String metrics_page_graph_subtitle_this_week =
    "metrics_page_graph_subtitle_this_week";
const String metrics_page_graph_day_mon = "metrics_page_graph_day_mon";
const String metrics_page_graph_day_tue = "metrics_page_graph_day_tue";
const String metrics_page_graph_day_wed = "metrics_page_graph_day_wed";
const String metrics_page_graph_day_thu = "metrics_page_graph_day_thu";
const String metrics_page_graph_day_fri = "metrics_page_graph_day_fri";
const String metrics_page_graph_day_sat = "metrics_page_graph_day_sat";
const String metrics_page_graph_day_sun = "metrics_page_graph_day_sun";
const String metrics_page_error_fetching = "metrics_page_error_fetching";
const String metrics_page_error_no_metrics = "metrics_page_error_no_metrics";

const String show_rides_page_title = "show_rides_page_title";
const String show_rides_page_back = "show_rides_page_back";
const String show_rides_page_error_msg = "show_rides_page_error_msg";
const String show_rides_page_no_rides_error = "show_rides_page_no_rides_error";
const String show_rides_page_error_adding_user =
    "show_rides_page_error_adding_user";
const String show_rides_page_hour = "show_rides_page_hour";
const String show_rides_page_from = "show_rides_page_from";
const String show_rides_page_to = "show_rides_page_to";
const String show_rides_page_passengers_joined =
    "show_rides_page_passengers_joined";
const String show_rides_page_contact_driver = "show_rides_page_contact_driver";
const String show_rides_page_join_ride = "show_rides_page_join_ride";
const String show_rides_page_seats_by_passenger =
    "show_rides_page_seats_by_passenger";
const String show_rides_page_user_added_success =
    "show_rides_page_user_added_success";
const String show_rides_page_no_passengers = "show_rides_page_no_passengers";
const String show_rides_page_request_sent_to_driver =
    "show_rides_page_request_sent_to_driver";
const String show_rides_page_failed_to_send_request_to_driver =
    "show_rides_page_failed_to_send_request_to_driver";

const String signup_page_back_button = "signup_page_back_button";
const String signup_page_title = "signup_page_title";
const String signup_page_name = "signup_page_name";
const String signup_page_username = "signup_page_username";
const String signup_page_email = "signup_page_email";
const String signup_page_password = "signup_page_password";
const String signup_page_confirm_pass = "signup_page_confirm_pass";
const String signup_page_gender = "signup_page_gender";
const String signup_page_gender_male = "signup_page_gender_male";
const String signup_page_gender_female = "signup_page_gender_female";
const String signup_page_gender_other = "signup_page_gender_other";
const String signup_page_or = "signup_page_or";
const String signup_page_sign_up_button = "signup_page_sign_up_button";
const String signup_page_already_have_an_account =
    "signup_page_already_have_an_account";
const String signup_page_already_have_an_account_sing_in =
    "signup_page_already_have_an_account_sing_in";
const String signup_page_validate_null_name = "signup_page_validate_null_name";
const String signup_page_validate_null_username =
    "signup_page_validate_null_username";
const String signup_page_validate_null_email = "signup_page_validate_null";
const String signup_page_validate_email_expression =
    "signup_page_validate_expression";
const String signup_page_validate_password_null =
    "signup_page_validate_password_null";
const String signup_page_validate_password_min_length =
    "signup_page_validate_password_min_length";
const String signup_page_validate_password_check_uppercase =
    "signup_page_validate_password_check_uppercase";
const String signup_page_validate_password_check_numbers =
    "signup_page_validate_password_check_numbers";
const String signup_page_validate_password_check_special_characters =
    "signup_page_validate_password_check_special_characters";
const String signup_page_validate_password_check_other_pass =
    "signup_page_validate_password_check_other_pass";
const String signup_page_signup_successful = "signup_page_signup_successful";
const String signup_page_signup_unsuccessfull =
    "signup_page_signup_unsuccessfull";

const String initial_page_create_account = "initial_page_create_account";
const String initial_page_log_in = "initial_page_log_in";
const String initial_page_create_proccede_without_log_in =
    "initial_page_create_proccede_without_log_in";
const String initial_page_welcome = "initial_page_welcome";
const String initial_page_string = "initial_page_string";

const String login_page_string = "login_page_string";
const String login_page_not_yet_registered = "login_page_not_yet_registered";
const String login_page_signup = "login_page_signup";

const String login_page_login_successful = "login_page_login_successful";
const String login_page_login_failed = "login_page_login_failed";
const String login_page_empty_fields = "login_page_empty_fields";

const String home_page_navigation_message_quote_one =
    "home_page_navigation_message_quote_one";
const String home_page_navigation_message_quote_two =
    "home_page_navigation_message_quote_two";

const String chat_page_type_a_message = "chat_page_type_a_message";
const String chat_page_error = "chat_page_error";
const String chat_page_start_conversation = "chat_page_start_conversation";
const String chat_page_error_fetching_messages =
    "chat_page_error_fetching_messages";

const String settings_page_remove_car_no_car = "settings_page_remove_car_no_car";
const String settings_page_title = "settings_page_title";
const String settings_page_english = "settings_page_english";
const String settings_page_portuguse = "settings_page_portuguse";
const String settings_page_profile = "settings_page_profile";
const String settings_page_language = "settings_page_language";
const String settings_page_theme = "settings_page_theme";
const String settings_page_change_dark_mode = "settings_page_change_dark_mode";
const String settings_page_logout = "settings_page_logout";
const String settings_page_change_password = "settings_page_change_password";
const String settings_page_old_password = "settings_page_old_password";
const String settings_page_new_password = "settings_page_new_password";
const String settings_page_confirm_new_password =
    "settings_page_confirm_new_password";
const String settings_page_update_password_successful =
    "settings_page_update_password_successful";
const String settings_page_update_password_old_pass_wrong =
    "settings_page_update_password_old_pass_wrong";

const String settings_page_update_password_failed =
    "settings_page_update_password_failed";
const String settings_page_add_car = "settings_page_add_car";

const String settings_page_car_name = "settings_page_car_name";

const String settings_page_car_consumption = "settings_page_car_consumption";
const String settings_page_car_added_successfully =
    "settings_page_car_added_successfully";
const String settings_page_error_adding_car = "settings_page_error_adding_car";
const String settings_page_remove_car = "settings_page_remove_car";
const String settings_page_car_remove_successfully =
    "settings_page_car_remove_successfully";
const String settings_page_car_remove_error = "settings_page_car_remove_error";
const String settings_page_error = "settings_page_error";
const String settings_page_rating_as_driver = "settings_page_rating_as_driver";
const String settings_page_rating_as_passenger =
    "settings_page_rating_as_passenger";

const String notification_page_has_confirmed_the_ride =
    "notification_page_has_confirmed_the_ride";

const String notification_page_rate_driver = "notification_page_rate_driver";
const String notification_page_rating_sent = "notification_page_rating_sent";
const String notification_page_error_sending_rating =
    "notification_page_error_sending_rating";
const String notification_page_ride_was_done =
    "notification_page_ride_was_done";
const String notification_page_at = "notification_page_at";
const String notification_page_from = "notification_page_from";
const String notification_page_to = "notification_page_to";
const String notification_contact_user = "notification_contact_user";
const String notification_page_rated = "notification_page_rated";
const String notification_page_no_notifications =
    "notification_page_no_notifications";
const String notification_page_notifications =
    "notification_page_notifications";
const String notification_page_just_now = "notification_page_just_now";
const String notification_page_min_ago = "notification_page_min_ago";
const String notification_page_hour = "notification_page_hour";
const String notification_page_ago = "notification_page_ago";
const String notification_page_day = "notification_page_day";
const String home_page_navigation_price_per_passenger ="home_page_navigation_price_per_passenger";
