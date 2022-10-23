import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:moja_lodowka/app/injection_container.config.dart';

final getIt = GetIt.instance;

  
@InjectableInit( 
)  
void configureDependencies() => $initGetIt(getIt); 

@module  
abstract class RegisterModule { 
  @Named("BaseUrl")  
  String get baseUrl => 'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/{city}?unitGroup=metric&key=WCPLFA6FEK4E4CY7CCDRVBLAL&contentType=json';
  @lazySingleton  
  Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url));
}  

