abstract class newsStates{}

class appInitState extends newsStates{}
class appChangeScreentState extends newsStates{}

class appGetBusinessNewsStateLoading extends newsStates{}
class appGetBusinessNewsState extends newsStates{}
class appGetBusinessNewsStateErorr extends newsStates{
  final error;
  appGetBusinessNewsStateErorr(this.error);
}

class appGetScienceNewsStateLoading extends newsStates{}
class appGetScienceNewsState extends newsStates{}
class appGetScienceNewsStateErorr extends newsStates{
  final error;
  appGetScienceNewsStateErorr(this.error);}

class appGetSportsNewsStateLoading extends newsStates{}
class appGetSportsNewsState extends newsStates{}
class appGetSportsNewsStateErorr extends newsStates{
  final error;
  appGetSportsNewsStateErorr(this.error);}


class appChangeMode extends newsStates{}