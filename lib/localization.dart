class L10n {
  static const Map<String, Map<String, String>> _strings = {
    'en': {
      'jobs': 'Jobs',
      'dashboard': 'Dashboard',
      'profile': 'Profile',
      'settings': 'Settings',
      'create_job': 'Create Job',
      'title': 'Title',
      'description': 'Description',
      'salary': 'Salary',
      'location': 'Location',
      'post': 'Post',
      'saved_jobs': 'Saved Jobs',
      'apply': 'Apply',
      'save': 'Save',
      'dark_mode': 'Dark Mode',
      'language': 'Language',
      'employer_stats': 'Employer Stats',
      'posted_jobs': 'Posted Jobs',
      'requirements': 'Requirements',
      'recommended': 'Recommended',
      'onboarding_title': 'Welcome to Job Finder',
      'onboarding_subtitle': 'Connect employers with great talent. Post, discover and apply to jobs.',
      'role_employer': 'Employer',
      'role_employee': 'Employee',
    },
    'ne': {
      'jobs': 'कामहरू',
      'dashboard': 'ड्यासबोर्ड',
      'profile': 'प्रोफाइल',
      'settings': 'सेटिङ्स',
      'create_job': 'नयाँ जागिर',
      'title': 'शीर्षक',
      'description': 'विवरण',
      'salary': ' तलब',
      'location': 'स्थान',
      'post': 'पोस्ट गर्नुहोस्',
      'saved_jobs': 'सेभ गरिएका कामहरू',
      'apply': 'आवेदन',
      'save': 'सेभ',
      'dark_mode': 'डार्क मोड',
      'language': 'भाषा',
      'employer_stats': 'नियोक्ताका तथ्याङ्क',
      'posted_jobs': 'पोस्ट गरिएका जागिरहरू',
      'requirements': 'आवश्यकताहरू',
      'recommended': 'सिफारिस गरिएका',
      'onboarding_title': 'Job Finder मा स्वागत छ',
      'onboarding_subtitle': 'नियोक्ता र प्रतिभालाई जोड्नुहोस्। पोस्ट गर्नुहोस्, पत्ता लगाउनुहोस् र आवेदन दिनुहोस्।',
      'role_employer': 'नियोक्ता',
      'role_employee': 'कर्मचारी',
    }
  };

  static String t(String key, String lang) {
    return _strings[lang]?[key] ?? _strings['en']![key] ?? key;
  }
}
