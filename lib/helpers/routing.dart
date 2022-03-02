
const String PROTOCOL = "http";
const String PORT = "8000";
const String DOMAIN = "192.168.1.9"; // acer
// const String DOMAIN = "192.168.1.7";  // lenovo
//const String BASE_URL = "https://srmcapi.loca.lt/api/main/pat";
const String BASE_URL =  "$PROTOCOL://$DOMAIN:$PORT/api/main/pat"; 

/*-------Home Screen API ------- */
const String HOME_SCREEN_URL = "$BASE_URL/home-screen/";

/*-------Home Screen API ------- */
const String LOGIN_URL = "$BASE_URL/login-user/";
const String OTP_URL = "$BASE_URL/validate-user/";
const String REGISTER_URL = "$BASE_URL/register-user/";

/*-------Notification Screen API ------- */
const String NOTIFICATION_SCREEN_URL = "$BASE_URL/patient-notification/";

/*-------Profile Screen API ------- */
const String PROFILE_SCREEN_URL = "$BASE_URL/profile/";

/*-------Family members Screen API ------- */
const String FAMILY_MEMBERS_SCREEN_URL = "$BASE_URL/all-family-members/";

/*------Appointment  Screen API ------- */
const String APPOINTMENT_PENDING_URL = "$BASE_URL/appointment-pending/";
const String APPOINTMENT_HISTORY_URL = "$BASE_URL/appointment-history/";

/*------- All Categories Screen API ------- */
const String ALL_CATEGORIES_SCREEN_URL = "$BASE_URL/all-categories/";

/*------- Medical Records API ------- */
const String FAMILY_MEMBERS_RECORDS_URL = "$BASE_URL/family-medical-records/";

/*------Raise Issues API ------- */
const String PATIENT_TICKETS = "$BASE_URL/patient-tickets/";



