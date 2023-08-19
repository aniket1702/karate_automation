function fn()
 {
    var RandomStringUtils = Java.type('org.example.util.RandomStringUtils')

  var config =
  {

      baseUrl:'https://practice.expandtesting.com/notes/api',
      randomStringUtils: new RandomStringUtils(),
      logPrettyRequest: true,
      logPrettyResponse: true

  };

  return config;
}