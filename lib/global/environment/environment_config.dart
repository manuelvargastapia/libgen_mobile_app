class EnvironmentConfig {
  static const libgenApiURL = String.fromEnvironment(
    'LIBGEN_API_URL',
    defaultValue: 'http://10.0.2.2:3000',
  );
}
