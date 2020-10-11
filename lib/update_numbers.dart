import 'main_page.dart';

int affected;
int death;
int recovered;
int active;
int serious;

int todayAffect;
int todayDeath;
int todayRecovered;
int todayActive;
int todaySerious;

int yesterdayAffect;
int yesterdayDeath;
int yesterdayRecovered;
int yesterdayActive;
int yesterdaySerious;

int dayAfterAffect;
int dayAfterDeath;
int dayAfterRecovered;
int dayAfterActive;
int dayAfterSerious;

int affectDiff;
int deathDiff;
int recoveredDiff;
int activeDiff;
int seriousDiff;

class GlobalTotalNumbers {
  void updateGlobalTotal(dynamic globalData, dynamic globalActiveData) {
    if (globalData == null && globalActiveData == null) {
      affectedNumber = 'error';
      deathNumber = 'error';
      recoveredNumber = 'error';
      activeNumber = 'error';
      seriousNumber = 'error';
    }
    affected = globalData['Global']['TotalConfirmed'];
    death = globalData['Global']['TotalDeaths'];
    recovered = globalData['Global']['TotalRecovered'];
    active = globalActiveData['activeCases']['total'];
    serious = globalActiveData['activeCases']['critical'];

    isIntgerValid(affected) == true
        ? affectedNumber = globalData['Global']['TotalConfirmed'].toString()
        : affectedNumber = 'Unknown';
    isIntgerValid(death) == true
        ? deathNumber = globalData['Global']['TotalDeaths'].toString()
        : deathNumber = 'Unknown';
    isIntgerValid(recovered) == true
        ? recoveredNumber = globalData['Global']['TotalRecovered'].toString()
        : recoveredNumber = 'Unknown';
    isIntgerValid(active) == true
        ? activeNumber = globalActiveData['activeCases']['total'].toString()
        : activeNumber = 'Unknown';
    isIntgerValid(serious) == true
        ? seriousNumber = globalActiveData['activeCases']['critical'].toString()
        : seriousNumber = 'Unknown';
  }
}

class CountryTotalNumber {
  void updateCountryTotal(dynamic countryData) {
    if (countryData == null) {
      affectedNumber = 'error';
      deathNumber = 'error';
      recoveredNumber = 'error';
      activeNumber = 'error';
      seriousNumber = 'error';
    }
    affected = countryData.last['npatients'];
    death = countryData.last['ndeaths'];
    recovered = countryData.last['nexits'];
    active = countryData.last['ncurrentpatients'];
    serious = countryData.last['nheavycurrentpatients'];

    isIntgerValid(affected) == true
        ? affectedNumber = countryData.last['npatients'].toString()
        : affectedNumber = 'Unknown';
    isIntgerValid(death) == true
        ? deathNumber = countryData.last['ndeaths'].toString()
        : deathNumber = 'Unknown';
    isIntgerValid(recovered) == true
        ? recoveredNumber = countryData.last['nexits'].toString()
        : recoveredNumber = 'Unknown';
    isIntgerValid(active) == true
        ? activeNumber = countryData.last['ncurrentpatients'].toString()
        : activeNumber = 'Unknown';
    isIntgerValid(serious) == true
        ? seriousNumber = countryData.last['nheavycurrentpatients'].toString()
        : seriousNumber = 'Unknown';
  }
}

class CountryTodayNumber {
  void updateCountryToday(dynamic countryData) {
    if (countryData == null) {
      affectedNumber = 'error';
      deathNumber = 'error';
      recoveredNumber = 'error';
      activeNumber = 'error';
      seriousNumber = 'error';
    }
    todayAffect = countryData.last['npatients'];
    todayDeath = countryData.last['ndeaths'];
    todayRecovered = countryData.last['nexits'];
    todayActive = countryData.last['ncurrentpatients'];
    todaySerious = countryData.last['nheavycurrentpatients'];

    yesterdayAffect = countryData[countryData.length - 2]['npatients'];
    yesterdayDeath = countryData[countryData.length - 2]['ndeaths'];
    yesterdayRecovered = countryData[countryData.length - 2]['nexits'];
    yesterdayActive = countryData[countryData.length - 2]['ncurrentpatients'];
    yesterdaySerious =
        countryData[countryData.length - 2]['nheavycurrentpatients'];

    isIntgerValid(yesterdayAffect) == true
        ? affectDiff = todayAffect - yesterdayAffect
        : affectDiff = null;
    isIntgerValid(yesterdayDeath) == true
        ? deathDiff = todayDeath - yesterdayDeath
        : deathDiff = null;
    isIntgerValid(yesterdayRecovered) == true
        ? recoveredDiff = todayRecovered - yesterdayRecovered
        : recoveredDiff = null;
    isIntgerValid(yesterdayActive) == true
        ? activeDiff = todayActive - yesterdayActive
        : activeDiff = null;
    isIntgerValid(yesterdaySerious) == true
        ? seriousDiff = todaySerious - yesterdaySerious
        : seriousDiff = null;

    isIntgerValid(affectDiff) == true
        ? affectedNumber = affectDiff.toString()
        : affectedNumber = '0';
    isIntgerValid(deathDiff) == true
        ? deathNumber = deathDiff.toString()
        : deathNumber = '0';
    isIntgerValid(recoveredDiff) == true
        ? recoveredNumber = recoveredDiff.toString()
        : recoveredNumber = '0';
    isIntgerValid(activeDiff) == true
        ? activeNumber = activeDiff.toString()
        : activeNumber = '0';
    isIntgerValid(seriousDiff) == true
        ? seriousNumber = seriousDiff.toString()
        : seriousNumber = '0';
  }
}

class CountryDayAfterNumber {
  void updateCountryDayAfter(dynamic countryData) {
    if (countryData == null) {
      affectedNumber = 'error';
      deathNumber = 'error';
      recoveredNumber = 'error';
      activeNumber = 'error';
      seriousNumber = 'error';
    }
    yesterdayAffect = countryData[countryData.length - 2]['npatients'];
    yesterdayDeath = countryData[countryData.length - 2]['ndeaths'];
    yesterdayRecovered = countryData[countryData.length - 2]['nexits'];
    yesterdayActive = countryData[countryData.length - 2]['ncurrentpatients'];
    yesterdaySerious =
        countryData[countryData.length - 2]['nheavycurrentpatients'];

    dayAfterAffect = countryData[countryData.length - 3]['npatients'];
    dayAfterDeath = countryData[countryData.length - 3]['ndeaths'];
    dayAfterRecovered = countryData[countryData.length - 3]['nexits'];
    dayAfterActive = countryData[countryData.length - 3]['ncurrentpatients'];
    dayAfterSerious =
        countryData[countryData.length - 3]['nheavycurrentpatients'];

    isIntgerValid(yesterdayAffect) == true
        ? affectDiff = yesterdayAffect - dayAfterAffect
        : affectDiff = null;
    isIntgerValid(yesterdayDeath) == true
        ? deathDiff = yesterdayDeath - dayAfterDeath
        : deathDiff = null;
    isIntgerValid(yesterdayRecovered) == true
        ? recoveredDiff = yesterdayRecovered - dayAfterAffect
        : recoveredDiff = null;
    isIntgerValid(yesterdayActive) == true
        ? activeDiff = yesterdayActive - dayAfterActive
        : activeDiff = null;
    isIntgerValid(yesterdaySerious) == true
        ? seriousDiff = yesterdaySerious - dayAfterSerious
        : seriousDiff = null;

    isIntgerValid(affectDiff) == true
        ? affectedNumber = affectDiff.toString()
        : affectedNumber = '0';
    isIntgerValid(deathDiff) == true
        ? deathNumber = deathDiff.toString()
        : deathNumber = '0';
    isIntgerValid(recoveredDiff) == true
        ? recoveredNumber = recoveredDiff.toString()
        : recoveredNumber = '0';
    isIntgerValid(activeDiff) == true
        ? activeNumber = activeDiff.toString()
        : activeNumber = '0';
    isIntgerValid(seriousDiff) == true
        ? seriousNumber = seriousDiff.toString()
        : seriousNumber = '0';
  }
}

bool isIntgerValid(int target) {
  if (target == null) {
    return false;
  } else {
    return true;
  }
}
