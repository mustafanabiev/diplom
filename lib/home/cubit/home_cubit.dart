import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/plant_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(HomeState(
          plantModel: plants,
          plantModel2: jerJemister,
        ));

  void toggleFavorite(BuildContext context, PlantModel plant) {
    final plantIndex = plants.indexWhere((p) => p.id == plant.id);
    if (plantIndex != -1) {
      final updatedPlant = plant.copyWith(isFavorites: !plant.isFavorites);
      plants[plantIndex] = updatedPlant;
      emit(state.copyWith(plantModel: List.from(plants)));
    }
  }
}

List<PlantModel> plants = [
  const PlantModel(
    id: 1,
    image: 'klubnika.png',
    name: 'Кулпунай',
    description:
        '''Отургузуу: күз (августтун ортосунан октябрдын ортосуна чейин) жана эрте жаз.
Жарыктандыруу: Жарык күн нуру.
Топурак: жеңил - рН 5,7-6,2 болгон органикалык заттарга бай саздак, кумдуу чопо, кара топурак же токой топурактары.
Сугаруу: эртең менен, апрелдин аягында - 10-12 күндө бир жолу, ар бир м² жерге 10-12 литр суу сарпташат. Жайкы ысыкта - жумасына 3-4 жолу, августтан октябрга чейин - жумасына эки жолу. Гүлдөрдүн сабагы пайда болгонго чейин топуракты нымдаштыруунун оптималдуу жолу - чачуу, ал эми гүлдөө учурунда - тамчылатып сугаруу.
Азыктандыруу: жылына үч жолудан кем эмес: эрте жазда, бүчүрлөр жана август айында.
Бутоо: Жалбырактар ​​саргайып, тактар ​​болуп, кургап баштаганда, аларды кайра кыркыңыз.
Көбөйтүү: муруттары (розеткалары), бадалдын бөлүү жолу менен. Чакан мөмөлүү кулпунайды уруктар менен көбөйтсө болот.
Зыянкечтери: кулпунай нематоддору, жөргөмүш кенелери, күңүрт коңуздар, жалбырак коңуздары, отоо чөптөр, үлүлдөр жана шляпалар.
Оорулары: боз, тамыр жана мөмө чириги, күрөң, ак жана күрөң тактар, порошок, фузариоз, кеч күйүүчү жана вертикиллий.''',
    isFavorites: false,
    text: 'ды',
  ),
  const PlantModel(
    id: 2,
    image: 'alcha.png',
    name: 'Алча',
    description:
        '''Отургузуу: жазында, топурак ысып, бирок дарактардын бүчүрлөрү ачыла элек.
Гүлдөө: Сортуна жараша апрелдин аягынан майдын аягына чейин.
Жарыктандыруу: Жарык күн нуру.
Топурак: кумдуу, кумдак же чополуу, нейтралдуу реакция, жер астындагы суулар терең жана суу токтоп калбаган жерде.
Сугаруу: сезондо 3—4 жолу: гулдегенден кийин, жумурткалардын пайда болушунда, тушум жыйноодон кийин жана куздо, 20-октябрга чейин.
Азыктандыруу: жазында 3 жолу тамыр менен азыктандыруу: 1- суюк азот жер семирткичтери менен гүлдөө алдында, 2- чөптөрдөн жасалган “чай” же тоок кык эритмеси (1:10) менен гүлдөө учурунда, 3- – компост же башка органикалык аралашмалар менен гүлдөө. Жайында азот камтыган препараттар менен эки жалбырактан азыктандыруу жүргүзүлөт: июлдун ортосунда жана 3 жумадан кийин. Алча жалбырактары жана жетишпеген микроэлементтердин эритмелери менен дарыланат. Мөмө бергенден кийин азотту камтыган органикалык жер семирткичтер колдонулат. Күзүндө бак-дарактар ​​​​чөйрөсүндөгү топурак толук минералдык жер семирткич менен каныккан, ал эми кыш алдында - калий жана фосфор менен гана.
Бутоо: жазында, март айында, шире агымы башталганга чейин, ал эми күзүндө, вегетациялык мезгилдин аягында. Кээде жайында, жемиш бүткөндөн кийин.
Көбөйтүү: уруктар, кесүү, тамыр бутактары, кыйыштыруу.
Зыянкечтери: кара өрүк көпөлөктөрү, алча жана чымчык алчалары, былжырлуу, социалдык жана боз буттуу араа чымындары, кабык астындагы жалбырак роликтери, алча жалбырактары, долоно.
Оорулары: күрөң так, кластероспориоз, алча мозаикасы жана мозаика шакекчеси, бутактардын өлүшү, котур, мөмө чириги, коккомикоз, монилиоз, тамырдын рак оорусу, сагыз оорусу жана бакшы шыпыргысы.''',
    isFavorites: false,
    text: 'ны',
  ),
  const PlantModel(
    id: 3,
    image: 'almurut.png',
    name: 'Алмурут',
    description:
        '''Отургузуу: эрте жаз (шире агымы башталганга чейин) же сентябрдын аягында.
Гүлдөө: май.
Жарыктандыруу: Жарык күн нуру.
Топурак: кара топурак же боз токой, жер астындагы суулары тереңде, бийиктикте.
Сугаруу: бир мезгилде орточо эки жолу: гүлдөгөнгө чейин жана кийин. Суу керектөө - дарактын ар бир м² үчүн 2 чака: топурак 80 см тереңдикте нымдуу болушу керек.
Жер семирткичтер: Шире агып чыга электе алмуруттун дарагына жети пайыздык карбамид эритмеси же карбамид, аммоний селитрасы же тооктун кыгы эритмеси менен чачылат. Гүлдөөдөн кийин топурак жашыл жер семирткич менен 8-10 см тереңдикке чейин казылат же дарактын сөңгөгүнүн айланасы Nitroammofoska эритмеси менен сугарылат. Июнь жана июлдун экинчи жарымында, алмурут азот эритмеси менен жалбырак жалбырак менен дарыланат, ал эми июлдук жер семирткичтерди эки жума өткөндөн кийин, калий-фосфор жер семирткичтери бойго жеткен дарактардын астындагы топуракка чачылат. Сентябрдын башынан ортосуна чейин алмурут акыркы жолу азот менен, ал эми октябрда - калий-фосфор жер семирткичтери менен азыктандырылат.
Бутоо: жазында, бүчүрлөр ачыла электе, же күзүндө, жалбырак түшүү учурунда. Зарыл болсо, бутоо жайкысын жасалышы мүмкүн.
Көбөйтүү: катмарлануу, кыюу жана кыйыштыруу, азыраак - уруктар.
Зыянкечтери: коко көпөлөк, алма жана жашыл жалбырак, өт кенеси, алмурут жез башы, кызыл алма кенеси, кабык астындагы бүчүр курту, алма айнек көпөлөгү, көк аскер курту, тери көпөлөгү жана кышкы көпөлөк, жемиш көпөлөгү, цыган, эмен жалбырактуу жана шакекчелүү жибек курту, жалбырак көпөлөк, батыш цыган кабыгынын коңузу, кара жыгач, алмурут жана алма гүл коңуздары, алмурут түтүк курттары, алмурут пиллинги, жалбырак жана мөмө-жемиш өт курту, алмурут кычышуусу, долоно.
Оорулары: тери астындагы вирустук так, кара рак (Антонов оту), көө кычыткы, порошок, күйүк, вирустук мозаика, дат, цитоспороз (сабак чириги), котур, монилиоз (мөмө чириги), резина, бутак өлүү, жалпы рак, чымын коңуз , мозаикалык шакекче, жалган полипор, ак так (септориа).''',
    isFavorites: false,
    text: 'ду',
  ),
  const PlantModel(
    id: 4,
    image: 'vinograt.png',
    name: 'Жүзүм',
    description:
        '''Отургузуу: марттын аягынан майдын аягына чейин лигнификацияланган көчөттөр, майдын ортосунан июндун аягына чейин жашыл, вегетативдик көчөттөр отургузулат. Жылуу жерлерге күзүндө жүзүм отургузса болот.
Жарыктандыруу: Жарык күн нуру. Эң жакшы жер түштүк, батыш же түштүк-батыш тарабындагы жантайыңкы орто бөлүгүндө жайгашкан жер.
Топурак: кумдуу, кумдак, чополуу, чополуу, эң жакшысы аралаш, мисалы, чопо, таш жана органикалык заттар менен ылай аралашмасы.
Сугаруу: жазында, капкакты алып салгандан кийин. Бир бадалдын керектөөсү - 4 чака суу, аларга жарым литрлик күл аралаштырылган. Кийинки сугаруу гүлдөөдөн бир жума мурун, үчүнчүсү - гүлдөөдөн кийин. Мөмөлөр түстүү баштаганда, сугаруу токтотулат, бирок баш калкалоодон бир жума мурун, кышкы сугаруу жүргүзүлөт.
Жер семирткичтер: Отургузулган чуңкурга кошулган жер семирткичтер 3-4 жылга жетет. Бешинчи сезондун башында, эрте жазда, жүзүм чөйрөсүнө толук минералдык жер семирткич, ал эми гүлдөө алдында бир жарым жума мурун - суюк органикалык жер семирткичтер (фосфаттарды жана калий жер семирткичтерин кошуу менен тоок кыгын же коровиктин эритмеси) колдонулат. ). Мөмө-жемиш бышканда топуракты калий-фосфор комплекси менен азыктандырат. Сиз ошондой эле жүзүмдү жалбырактары менен азыктандырсаңыз болот, негизги жер семирткичтер менен жана өсүмдүктө жетишсиз болгон микроэлементтердин эритмелери менен.
Бутоо: күз гана.
Гартер: талап кылынат.
Көбөйтүү: катмарлануу, кыйыштыруу, кесүү, азыраак - уруктар.
Зыянкечтери: жүзүм бүргө коңузу, жүзүм жалбырагы, жүзүм жаздык көпөлөктөрү, жүзүм чиркейи, боз жана кара кызылча чөптөрү жана чоң беде чөптөрү, алтын коңуз, жыпар жыттуу жыгач тешкич, жүзүм жөргөмүш, жүзүм кийиз жана европалык кызыл кенелер, жүзүм кычышы, жүзүм, эки жылдык жана бир тутам бүчүр курттары, аарылар, жүзүм трипстери, унчуктар жана Комсток, цикадалар жана филлоксера.
Оорулары: альтернариоз, бактериялык рак, апоплексия, вертикиллиоз, армиллярия, ак, кара, кычкыл жана тамыр чириги, диплодия, некроздун ар кандай түрлөрү, фузариоз, пеницеллез, бактериоз, церкоспориоз, хлороз, эскориоз (кара тактар, кара тактар) dieback, же phomopsis) , oidium (же жүзүм порошок көк), көк (же жүзүмдүн түктүү көгөрү), антракноз.''',
    isFavorites: false,
    text: 'дү',
  ),
  const PlantModel(
    id: 5,
    image: 'persik.png',
    name: 'Шабдалы',
    description:
        '''Отургузуу: салкын климаты бар жерлерде - жазында (ширин агымы башталганга чейин), жылуу аймактарда - жазында жана күзүндө.
Гүлдөө: апрелдин ортосунан.
Жарыктандыруу: Жарык күн.
Топурак: ар кандай жакшы дренаждуу топурак.
Сугаруу: эрте сорттор - сезондо орточо 2-3 жолу, кеч сорттору - 5-6 жолу. Сууну керектөө жашына жана өлчөмүнө жараша ар бир дарак үчүн 2ден 5 чакага чейин. Шабдалыларды эртең менен же кечинде сугарыңыз. Биринчи сугаруу майдын аягында же июнь айынын башында, экинчиси — июлдун биринчи жарымында, учунчусу — августтун биринчи жарымында. Топурак 60-70 см тереңдикке чейин суу менен малынган, мөмө-жемиштин сапаты үчүн, түшүм жыйноодон 3-4 жума мурун сугаруу маанилүү: дарактын жашына жараша 30дан 60 литрге чейин суу керектелет. Кийинки сугаруу тушум жыйноодон кийин гана жургузулет. Акыркы сугаруу кыш алдындагы, октябрь. Нымдуулук менен сугаруу үчүн суунун чыгымы бак-дарактын чөйрөсүнүн 1 м² үчүн 90-100 литрди түзөт.
Жер семирткичтер: начар топурактар ​​жыл сайын органикалык жана минералдык жер семирткичтер менен азыктандырылып, 2-3 жылда бир жолу кошулат.
Бутоо: санитардык жана калыптандыруучу - жазында, шире агымынын башталышы менен шабдаалы гүлдөөнүн ортосунда. Күзүндө - санитардык максатта бутоо.
Көбөйтүү: уруктар, кыйыштыруу, кесүү.
Зыянкечтери: кара өрүк жана чыгыш көпөлөктөрү, мите курт-кумурскалар, чаар көпөлөктөр, гүл коңуздары, мөмө-жемиш жана жалбырак өстүрүүчү көпөлөктөр, жөргөмүш кенелери.
Оорулары: кластероспориоз, монилиоз, порошок, жалбырактардын тармалдары, коккомикоз, котур, мөмө жана боз чириктер, цитоспороз, сүттөй жылтыл, бүйлө оорусу, вертикиллиоз, гомоз (грибок күйүк).''',
    isFavorites: false,
    text: 'ны',
  ),
  const PlantModel(
    id: 6,
    image: 'malina.png',
    name: 'Малина',
    description: '''отургузуу: жазында же сентябрда-октябрда.
Жарыктандыруу: Жарык күн нуру.
Топурак: жеңил түшүмдүү топурак, оптималдуу рН -5,7-6,5 рН. Бадалдарды өстүрүү үчүн ойдуңдар да, тик беттер да, бийик жерлер да ылайыктуу эмес.
Сугаруу: кургак жайында - мол, топурак 30-40 см тереңдикке чейин нымдуу болушу үчүн, өсүмдүк май айында, мөмө-жемиштердин өсүү жана бышкан мезгилинде жана күзүндө эң көп керектелет. Сугаруунун эң жакшы ыкмасы - тамчылатып сугаруу. Кадимки жаан-чачындуу мезгилде малина сугарылбайт.
Гартер: Жазында малина торго байланат.
Малинаны бутоо: санитардык максатта - эрте жазда, ширеси агып баштаганга чейин.
Жер семирткичтер: жазында - азот жер семирткичтери менен, күзүндө - калий-фосфор жер семирткичтери менен. Суук аба ырайынын алдында топурак компост жана күл менен казылып алынат.
Көбөйүшү: кыюулар, соргучтар, кээ бир түрлөрү чокусун тамырлоо аркылуу.
Зыянкечтери: бүчүр жана сабагы өт миджалары, жөргөмүш кенелери, бит, малина сабагы чымындары, малина коңуздары, өт коңуздары, отоо чөптөр.
Оорулары: дат, хлороз, тамыр рак, кызгылт көк так, атракноз, вирустук мозаика, бакшы шыпыргы, боз көк, ак так, тамыр чириги, рак.''',
    isFavorites: false,
    text: 'ны',
  ),
  const PlantModel(
    id: 7,
    image: 'алма.png',
    name: 'Алма',
    description: '''Отургузуу: жазында, шире агымынын алдында жана күзүндө.
Гүлдөө: май-июнь 6 күндөн 18 күнгө чейин.
Жарыктандыруу: Жарык күн нуру.
Топурак: түшүмдүү, нейтралдуу реакция.
Сугаруу: отургузгандан кийин, ар бир көчөттүн астына жумасына бир чака суу куюп, андан кийин 2-3 жумада бир жолу, катуу ысыкта жана кургакчылыкта - жумасына 1-2 жолу.
Азыктандыруу: 1-апрелдин аягында органикалык жер семирткичтер менен, 2-гүлдөө алдында, 3-мөмө берүү мезгилинде, 4-күзүндө.
Бутоо: жазында, шире агымынын алдында жана күзүндө, жалбырак түшкөндөн кийин.
Көбөйтүү: негизинен вегетативдик: кесүү, катмарлоо жана кыйыштыруу. Алма бактарын үрөн менен көбөйтүү сейрек ышкыбоздук багбанчылыкта колдонулат.
Зыянкечтери: күрөң жемиш кенеси, долоно тегерек көпөлөк, долоно; алма, роуан, мөмө, мөмө чаар жана үстүнкү жемиш көпөлөктөрү; алма гүл коңузу, алмурут чымырыгы жана чоор чөбү, чыгыш жана алма көпөлөктөрү, эмен жалбырактуу жибек курту, тал жыгачы, батыш цыган кабыгынын коңузу, кышкы көпөлөк; жашыл алма, плантан, кызыл өт жана кан мите; каз, шакектүү жана цыган көпөлөктөрү, алма жана алмурут жез баштары, алма кенелери, жалбырактуу көпөлөктөр; карагат, жемиш жана кабык астындагы жалбырактар; алма көпөлөгү, көк баштуу кесүү курт, алма көпөлөк, алма айнек көпөлөк, көпөлөк, алма араа чымыны.
Оорулары: алма дарактарынын көбөйүшү (бүбү шыпыргы), ачуу жана мөмө чириги, мозаика оорусу, мозаика шакекчеси, сүттүү жылтыл, чымын коңуз, чыныгы тыт, кеңири таралган рак, дат, кара рак, бутак өлүү, котур, тери астындагы вирустук тактар, порошок , резина сымал, жалпак бутактар, айнек сымал мөмөлөр, цитоспороз, кара так.''',
    isFavorites: false,
    text: 'ны',
  ),
  const PlantModel(
    id: 8,
    image: 'ORUK.png',
    name: 'Өрүк',
    description:
        '''Отургузуу: апрель айынын ортосуна чейин, түштүктө сентябрдын аягында же октябрдын башында отургузса болот.
Гүлдөө: апрель айынын башынан баштап.
Жарыктандыруу: Жарык күн нуру.
Топурак: нейтралдуу же бир аз щелочтуу реакциянын жеңил саз.
Сугаруу: тегерек арыктарда жургузулет. Биринчиси - гүлдөө учурунда, экинчиси - май айында, бүчүрүнүн интенсивдүү өсүшү мезгилинде, үчүнчүсү - июлдун башында, түшүм жыйноодон эки жума мурун. Суу толтуруучу сугат октябрь айында жургузулет.
Азыктандыруу: жазында азоттук жер семирткичтер (тооктун кыгы, шлам, карбамид же селитра) менен жазында 2-3 жолу азыктандыруу: эрте жазда, гүлдөө алдында жана гүлдөөдөн кийин. Жайында жалбырактар ​​микроэлементтердин эритмелери менен дарыланат. Жайдын экинчи жарымынан баштап азот чачуу токтотулуп, калий-фосфор жер семирткичтери августтун аягында же сентябрдын аягында чачылат. Органикалык заттар 2-3 жылда бир жолу кошулат, бирок казууга кыкты 4-5 жылда бир жолу гана салууга болот.
Бутоо: октябрдын орто ченинде - ченемдик жана санитардык бутоо, эрте жазда - санитардык жана калыптандыруучу. Июнь айынын ортосунда, үч жылда бир жолу - жаңы бүчүрлөрдүн өсүшүнө түрткү берүү үчүн санитардык тазалоо жана жашартуучу бутоо.
Көбөйүүсү: бутактары, тамыр соргучтары, кыйыштыруу.
Зыянкечтери: көпөлөктөр, долоно курттары, жалбырак роликтери, мите.
Оорулары: монилиоз, кластероспориоз (тешик тактары), Вальс грибогу, вертикиллиоз, чечек, вирустук оорулар жана мозаика.''',
    isFavorites: false,
    text: 'тү',
  ),
  //////////////////////////
];

List<PlantModel> jerJemister = [
  const PlantModel(
    id: 1,
    image: 'karto.png',
    name: 'Картошка',
    description:
        '''Отургузуу: ачык жерге тамырларды отургузуу - апрелдин аягында же майдын башында.
Жарыктандыруу: Жарык күн нуру.
Топурак: оптималдуу - кара топурак, чополуу же кумдуу, рН 5,0-5,5.
Сугаруу: бүчүрлөр пайда боло электе сугаруу талап кылынбайт, андан кийин топурак 6-8 см тереңдикте кургаганда, кечинде нымдоо жүргүзүлөт. Суу керектөө ар бир бадал үчүн 2-3 литрди түзөт. Кургак мезгилде 3—5 жолу сугаруу, андан кийин жерди жумшартуу талап кылынат.
Үстүнкү азыктандыруу: күзүндө, топурак 1 м² үчүн гумус (3 кг) жана күл (100 г) менен 30 см тереңдикке чейин казуу үчүн жер семирткичтер. Өсүмдүк мезгилинде, начар топуракта картошка өстүрүү учурунда, жер семирткичтер шлам, тоок кыгын же минералдык жер семирткичтер менен жүзөгө ашырылат.
Дөңсөө: сугаруудан же жамгырдан кийин сезондо 2 жолу: бадалдар 14-16 см бийиктикке жеткенде жана гүлдөө башталганга чейин.
Көбөйүүсү: вегетативдик - тамыры же алардын бөлүктөрү менен.
Зыянкечтери: сымал курттар, жалган курттар, сабагы жана картошка нематоддору, Колорадо коңуздары, моль крикеттери.
Оорулары: фитоспороз, сабактын чириги, ризоктония, макроспориоз, котур, фомоз, күрөң так, рак, жалбырак коло жана башкалар.''',
    isFavorites: false,
    text: 'ны',
  ),
  const PlantModel(
    id: 2,
    image: 'cabiz.png',
    name: 'Сабиз',
    description:
        '''Отургузуу: топуракка орто жана кеч сорттордун үрөндөрүн себүү, анын курамына жараша апрелдин аягынан майдын аягына чейин. Эрте сорттор кыштын алдында, октябрдын аягында же ноябрдын башында себилет.
Жарыктандыруу: Күн бою жаркыраган жарык.
Топурак: борпоң жана жакшы жер семирткич.
Мурункулар: жакшылары - картошка, кабак, бадыраң, пияз, сарымсак, помидор, капуста. Керексиз: петрушка, фенхель, укроп, пастернап, зире жана сабиз.
Сугаруу: жумасына бир жолу. Себүүдөн кийин суунун чыгымдалышы 1 м2 аянтка 3 литр, экинчи суюлтулгандан кийин – 10 литр, тамыр өсө баштагандан тартып – 20 литр, түшүм жыйноого бир жарым-эки ай калганда, участок сугарылат. бир жарым жумада бир жолу, 1 м² үчүн 10 литрден ашык эмес, жана түшүм жыйноодон 2-3 жума мурун, сугаруу токтотулат.
Азыктандыруу: суюк жер семирткичтерди сезондо эки жолу: пайда болгондон кийин бир ай жана биринчи азыктандыруудан эки айдан кийин.
Көбөйтүү: үрөн.
Зыянкечтери: шляпалар, сымал курттар, сабиз чымындары, күзгү курт курттары.
Оорулары: септориоз, фомоз, бактериоз, боз, ак, кара жана кызыл чириктер.''',
    isFavorites: false,
    text: 'ди',
  ),
  const PlantModel(
    id: 3,
    image: 'redisca.png',
    name: 'Редиска',
    description:
        '''Отургузуу: жерге уруктарды себүү - кыш алдында же жазда, марттын аягынан апрелдин ортосуна чейин.
Жарыктандыруу: Жарык күн нуру.
Топурак: нейтралдуу же бир аз щелочтуу реакциядагы борпоң, жеңил топурак (рН 5,5-7,0).
Мурункулар: керексиз - ар кандай крест өсүмдүктөрү. Жакшылары картошка, бадыраң, буурчак өсүмдүктөрү. Редискадан кийин сайтта помидор өстүргөн жакшы.
Сугаруу: тез-тез жана көп: жаан-чачындуу жана күн күркүрөгөн жазында - күнүнө бир жолу, эртең менен же 17.00 кийин, ал эми аномалдуу ысык жана кургак аба ырайы - эртең менен жана кечинде. Сайттагы топурак ар дайым бир аз нымдуу болушу керек.
Жер семирткичтер: начар топуракта өскөндө жер семирткич эки жолу, бай кыртышта өскөндө бир жолу колдонулат. Комплекстуу минералдык жер семирткичтер колдонулат.
Көбөйтүү: үрөн.
Зыянкечтери: крест түрүндөгү бүргө коңуздары жана моль крикеттери.
Оорулары: бактериоз, тамыр тамыр, кара бут.''',
    isFavorites: false,
    text: 'ны',
  ),
  const PlantModel(
    id: 4,
    image: 'ogurec.png',
    name: 'Бадырын',
    description:
        '''Отургузуу: көчөттөр үчүн үрөн себүү - апрелде, жерге көчөт отургузуу - майдын башында же орто ченинде.
Жарыктандыруу: жаркыраган же жарым-жартылай көлөкө.
Топурак: жогорку түшүмдүү, жакшы дренаждуу, азот аз, нейтралдуу же бир аз щелочтуу.
Мурдагылар: эң жакшысы - жашыл кык, пияз, капуста, помидор. Керексиз - lagenaria жана ар кандай ашкабак өсүмдүктөрү.
Сугаруу: көчөттөрдү жерге көчүргөндөн кийин биринчи жолу - бат-баттан, тамырлагандан кийин - 5-7 күндө бир жолу м2 үчүн 3-6 литр суу керектөө менен, гүлдөө мезгилинде - эки эселенген суу менен 2-3 күндө бир жолу бир эле аянттын бирдигине керектөө.
Азыктандыруу: органикалык жана минералдык жер семирткичтер менен сезондо 6-8 жолу. Капыстан суук түшкөн мезгилде уруктандырууга болбойт.
Garter: горизонталдуу жана вертикалдуу. Алар бадыраңдарды жерге отургузгандан кийин дароо кирпиктерин тирөөчкө байлай башташат.
Чымчымдоо: ачык жерде, каптал бутактарынын өсүшүн стимулдаштыруу үчүн, бутактары 5-6 жалбырактан жогору чымчып жатат.
Чымчым: өнүгүү стадиясында 3-4 жалбырак, андан кийин өнүгүү стадиясында 8 жалбырак, андан кийин өнүгүү стадиясында 12 жалбырак.
Көбөйтүү: үрөн.
Зыянкечтери: мите, тамыр нематоддору, кескич курттар, моль крикеттери, тамеки трипстери, жөргөмүш кенелери, микроб чымындары, сымал курттар.
Оорулар: Антракнох, аскохита, вертикиллий, порошок, көк көк, кара бут, боз көк, кара чирик, зайтун тактары жана шакекче мозаика вирусу.''',
    isFavorites: false,
    text: 'ды',
  ),
  const PlantModel(
    id: 5,
    image: 'kap.png',
    name: 'Капуста',
    description:
        '''Отургузуу: эрте сорттордун көчөттөрү марттын башынан айдын үчүнчү он күндүгүнө чейин себилет, орто сезондогу сорттор - 25-марттан баштап ай ичинде, кеч сорттор - апрелдин башынан айдын үчүнчү он күндүгүнө чейин себилет. . көчөттөрдү ачык жерге көчүрүү - 45-50 күндөн кийин.
Жарыктандыруу: Таңдан кечке чейин ачык күн.
Топурак: эрте уюктар үчүн – чополуу жана кумдуу, мезгилдин ортосу жана кечки бал үчүн – чопо жана чопо. Суутек индекси 6,0-7,0 рН.
Мурдагылар: айкаш жыгачтан кийин өстүрүү туура эмес.
Сугаруу: Жерге отургузулгандан кийин көчөттөр бир жума бою күн сайын кечинде сугарылат. Андан кийин сугаруу кечинде же булуттуу аба ырайында 5-7 күндө бир жолу, ал эми ысыкта жана кургакчылыкта - 2-3 күндө бир жолу жүргүзүлөт.
Толкундоо: отургузуудан кийин үч жума, андан кийин дагы 10 күн.
Мульчирование: калыңдыгы 5 см ге чейин торф мульча катмары сунушталат.
Азыктандыруу: көчөт мезгилинде толук минералдык жер семирткич менен үч жолу азыктандыруу, андан кийин жалбырактар ​​өсө баштаганда аммиак селитрасы менен, акыркысы жалбырактар ​​башына ийри баштаганда.
Көбөйтүү: уруктардан көчөттөр.
Зыянкечтери: мите, курт, сливки жана үлүлдөр, крест түрүндөгү мүчүлүштүктөр жана бүргө коңуздары, капуста жалбырак коңуздары жана сырдуу ботко.
Оорулары: тамыр тамыры, кара бут, мамык көк, фузариоз, ризоктония, ак жана боз чирик.''',
    isFavorites: false,
    text: 'ны',
  ),
  const PlantModel(
    id: 6,
    image: 'piaz.png',
    name: 'Пияз',
    description:
        '''Отургузуу: ачык жерге үрөн себүү - майдын биринчи он күндүгүндө, жерге көчөт отургузуу - жазында, үрөн себүү менен бир убакта, жерге жапайы сулу отургузуу - кышка чейин (5-октябрдан 20-октябрга чейин) ).
Гүлдөө: Гүлдүн жебесинин пайда болушуна уруктар керек болгондо гана жол берилет.
Жарыктандыруу: Жарык күн нуру.
Топурак: кургак, органикалык заттарга бай, рН 6,5-8,0. Пияз үчүн кычкыл топурак акиташталган.
Сугаруу: орточо жумасына бир жолу, м² үчүн 5-10 литр суу керек.
Жер семирткичтер: жерди даярдоодо, себүү же отургузуу алдында - толук минералдык жер семирткичтерди колдонуу; Келечекте жалбырактары жай өскөндө гана азыктандыруу керек. Органикалык жер семирткичтер менен 2-3 жол берилет. Акыркысы - лампалар жаңгактын өлчөмүнө жеткенде.
Көбөйтүү: уруктар, топтомдор (майда пияз) жана жапайы сулу (майда топтом).
Зыянкечтери: пияз көпөлөктөрү, чымындар жана сырдуу чымындар, өскөн чымындар, мең чымындары, кесүүчү курттар (бакча, капуста жана кыш), тамеки трипстери.
Оорулары: ак жана боз чириктер, сарык, мамык, фузариоз, дат, трахеомикоз, пияздын моюн чириги, вирустук мозаика.''',
    isFavorites: false,
    text: 'ды',
  ),
  const PlantModel(
    id: 7,
    image: 'chesnok.png',
    name: 'Чеснок',
    description:
        '''Отургузуу: апрель айынын биринчи жарымынан кеч эмес күзүндө даярдалган сайтка, же кыш алдында, сентябрдын экинчи жарымынан октябрдын ортосуна чейин.
Жарыктандыруу: жарык күн нуру же жарым-жартылай көлөкө.
Топурак: оптималдуу топурак нейтралдуу реакциянын орточо нымдуу, түшүмдүү топурак болуп саналат.
Сугаруу: кургакчылык учурунда – мол (м² үчүн 10-12 литр). Август айында сугаруу токтотулат.
Азыктандыруу: пайда болгондон кийин - mullein же мочевина менен, андан кийин сарымсак эки жумалык интервал менен азыктанат. Сезондо төрт гана тамактандыруу жетиштүү.
Көбөйүүсү: вегетативдик - тиш менен.
Зыянкечтери: бакча курттары, кыш, капуста жана гамма кесүүчү курттары, кыркаяқтар, пияз көпөлөктөрү жана чымындары, моль крикеттери, сабагы нематоддор, жашыруун тумшуктар, тамеки трипстери.
Оорулары: боз, ак жана моюн чириги, мамык көгөрүп, сарык, фузариоз, гельминтоспориоз, дат, дат, вирустук мозаика, трахеомикоз.''',
    isFavorites: false,
    text: 'ту',
  ),
  const PlantModel(
    id: 8,
    image: 'ashkabak.png',
    name: 'Ашкабак',
    description:
        '''Отургузуу: жерге үрөн себүү - 7-8 см тереңдиктеги топурак 12-13 ˚C чейин жылыганда; көчөттөр үчүн үрөн себүү - апрелде же майдын башында, ачык жерге көчөт отургузуу - майдын аягында же июндун башында.
Топурак: ар кандай топурак, бирок жакшыраак түшүмдүү, органикалык жана минералдык жер семирткичтер менен алдын ала казып.
Сугаруу: көчөттөрдү отургузгандан кийин - көчөттөр тамыр алганга чейин күн сайын, андан кийин сейрек жумурткалары муштумга жеткенге чейин. Кадимки жаан-чачындуу мезгилде, сиз такыр сугаруунун кереги жок болушу мүмкүн. Мөмө-жемиштер салмакка ээ боло баштаганда, акырындык менен сууну 1 чоң өсүмдүккө 1 чакага чейин көбөйтүү керек.
Азыктандыруу: 1 - көчөттөр отургузулгандан кийин бир жумадан кийин тоок кыгын же коровик эритмеси менен, андан кийин ай сайын 3-4 органикалык азыктандыруу жүргүзүлөт.
Көбөйтүү: үрөн көчөттөрү менен жана көчөтсүз.
Зыянкечтери: коондун биттери, жаз куйруктары (же ак булак куйруктары), сымал курттар, шляпалар.
Оорулары: ак чирик, антракноз, аскохита, порошок жана кара көк.''',
    isFavorites: false,
    text: 'ты',
  ),
];