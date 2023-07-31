
class NearbyPlaceModel {
  final String image;
  final String name;
  final String distance;
  final String description;
  final String bus;
  final String bike;
  final String car;
  final String walk;
  final String type;

  NearbyPlaceModel({
    required this.image,
    required this.name,
    required this.distance,
    required this.description,
    required this.bus,
    required this.bike,
    required this.car,
    required this.walk,
    required this.type,
  });
}

List<NearbyPlaceModel> nearbyPlaces = [
  NearbyPlaceModel(
    image: "assets/places/BayfrontPark.jpg",
    name: "Bayfront Park",
    description: "Found along the banks of Lake Ontario, Bayfront Park is a 40-acre park in the West-end of Hamilton Harbour. Connected to the beautiful Hamilton Waterfront Trail, specifically the Desjardins Trail, the park is a great place to start or end a waterfront stroll. It includes a lower shoreline walkway, naturalized areas of shrubs, trees, and wildflowers, a public boat launch, numerous benches, picnic areas, a natural grass amphitheatre and a beach volleyball court.",
    distance: "5 km",
    car: "15 min",
    bus: "50 min",
    bike: "20 min",
    walk: "1h 15 min",
    type: "Park",
  ),
  NearbyPlaceModel(
    image: "assets/places/ChristieLake.jpg",
    name: "Christie Lake",
    description: "Christie Lake is one of the most beautiful lakeside conservation areas on the Niagara Escarpment that offers plenty of activities for visitors to enjoy. A mere 45 minute bike ride from McMaster, Christie has a large 18 hole Disc Golf course, canoe rentals, a beach with swim area, hike trails and over 4km of mountain biking trails that range from beginner to advanced.",
    distance: "11 km",
    car: "15 min",
    bus: "N/A",
    bike: "50 min",
    walk: "2h 30 min",
    type: "Lake",
  ),
  NearbyPlaceModel(
    image: "assets/places/CootesParadiseTrail.jpg",
    name: "Cootes Paradise",
    description: "Cootes Paradise sanctuary is significant as a migratory bird flyover zone and is home to a wide variety of flora and fauna. Featuring over 320 hectares of marshland, 16 creeks and 25 km of shoreline, Cootes Paradise is RBGs largest and most diverse sanctuary. Cootes is also home to a thriving population of mute swans, Red Knots, Cormorants, Great Blue Herons and in recent years Bald Eagles who have made their home in Cootes Paradise.",
    distance: '3.4 km',
    car: "9 min",
    bus: "23 min",
    bike: "9 min",
    walk: "34 min",
    type: "Trail",
  ),
  NearbyPlaceModel(
    image: "assets/places/GagePark.jpg",
    name: "Gage Park",
    description: "Gage Park is a large, multi-purpose park with recreational opportunities, passive areas, and historical significance. It offers a variety of sports activities, such as baseball, tennis, shuffleboard, horseshoes, and lawn bowling, and has lots of open space, which makes it an excellent location for festivals. Gage Park also has two playgrounds (one is wheelchair accessible), a bandshell, greenhouses, gardens, spray pad, wading pool, the Children’s Museum where there is a creative play structure with spring toys and swings, and the beautiful Gage Park Fountain. Gage Park also features a cycling pump track built in 2015.",
    distance: "9 km",
    car: "15 min",
    bus: "56 min",
    bike: "35 min",
    walk: "1h 38 min",
    type: "Park",
  ),
  NearbyPlaceModel(
    image: "assets/places/TiffanyFalls.jpg",
    name: "Tiffany Falls",
    description: "If you’re looking for a unique natural area to get you out-and-about, consider visiting Tiffany Falls Conservation Area! Designated as an Area of Natural and Scientific Interest (ANSI) this conservation area boasts unique land formations and ‘plush’ bedrock exposures with the added bonus of Tiffany and Washboard Falls.",
    distance: "4.7 km",
    car: "10 min",
    bus: "25 min",
    bike: "25 min",
    walk: "1h",
    type: "Waterfalls",
  ),
  NearbyPlaceModel(
    image: "assets/places/WaterfrontTrail.jpg",
    name: "Waterfront Trail",
    description: "The Hamilton Waterfront Trail is a 7.5km paved trail forming part of the Great Lakes Waterfront Trail “HamBur Loop”. It spans from Pier 7 to the east, passing through Bayfront Park before continuing along the waterfront where it is known as Desjardins Trail as it passes through the Desjardins Canal with a floating walkway paralleling the boat channel and terminating at Princess Point.",
    distance: "3.4 km",
    car: "20 min",
    bus: "60 min",
    bike: "60 min",
    walk: "2h 50 min",
    type: "Trail",
  ),
  NearbyPlaceModel(
    image: "assets/places/DevilPunchbowlFalls.jpg",
    name: "Devils Punchbowl",
    description: "Consisting of colourful layers of stratified rock, Devil’s Punchbowl is widely considered to be one of the Escarpment’s most unforgettable sights. The conservation area itself consists of two separate falls, the Lower Punchbowl Falls with a 5.5-metres drop and the Upper Punchbowl Falls with a 33.8 meter drop making it the third highest waterfall in Hamilton.",
    distance: "22.1 km",
    car: "30 min",
    bus: "1h 20 min",
    bike: "1h 25 min",
    walk: "3h 30 min",
    type: "Waterfalls",
  ),
];
List<NearbyPlaceModel> nearbyPlacesCN = [
  NearbyPlaceModel(
    image: "assets/places/BayfrontPark.jpg",
    name: "岸前公园",
    description: "海湾公园位于安大略湖沿岸，是汉密尔顿港西端的一个占地 40 英亩的公园。该公园与美丽的汉密尔顿海滨步道（特别是加丁步道）相连，是开始或结束海滨漫步的绝佳场所。它包括一条较低的海岸线走道、灌木、树木和野花的自然化区域、公共船只下水道、众多长椅、野餐区、天然草地圆形剧场和沙滩排球场。",
    distance: "5 km",
    car: "15 min",
    bus: "50 min",
    bike: "20 min",
    walk: "1h 15 min",
    type: "Park",
  ),
  NearbyPlaceModel(
    image: "assets/places/ChristieLake.jpg",
    name: "克里斯蒂湖",
    description: "克里斯蒂湖是尼亚加拉悬崖上最美丽的湖滨保护区之一，为游客提供了大量的活动。克里斯蒂距离麦克马斯特仅 45 分钟自行车车程，拥有大型 18 洞飞盘高尔夫球场、独木舟租赁服务、带游泳区的海滩、远足小径以及超过 4 公里的山地自行车道，从初级到高级都有",
    distance: "11 km",
    car: "15 min",
    bus: "N/A",
    bike: "50 min",
    walk: "2h 30 min",
    type: "Lake",
  ),
  NearbyPlaceModel(
    image: "assets/places/CootesParadiseTrail.jpg",
    name: "CP 小道",
    description: "库特天堂保护区是重要的候鸟飞越区，也是多种动植物的家园。库特天堂 (Cootes Paradise) 拥有超过 320 公顷的沼泽地、16 条小溪和 25 公里的海岸线，是 RBG 最大、最多样化的保护区。库特斯也是疣鼻天鹅、红腹滨鹬、鸬鹚、大蓝鹭以及近年来在库特斯天堂安家的秃鹰的家园。",
    distance: '3.4 km',
    car: "9 min",
    bus: "23 min",
    bike: "9 min",
    walk: "34 min",
    type: "Trail",
  ),
  NearbyPlaceModel(
    image: "assets/places/GagePark.jpg",
    name: "盖奇公园",
    description: "盖奇公园是一座大型多功能公园，拥有休闲场所、休闲区和历史意义。这里提供各种体育活动，如棒球、网球、沙狐球、马蹄铁和草地保龄球，并拥有大量的开放空间，这使其成为举办节日的绝佳场所。盖奇公园还设有两个游乐场（其中一个可供轮椅通行）、露天剧场、温室、花园、喷水池、浅水池、儿童博物馆（设有带弹簧玩具和秋千的创意游乐设施）以及美丽的盖奇公园喷泉。盖奇公园还设有 2015 年建成的自行车泵道。",
    distance: "9 km",
    car: "15 min",
    bus: "56 min",
    bike: "35 min",
    walk: "1h 38 min",
    type: "Park",
  ),
  NearbyPlaceModel(
    image: "assets/places/TiffanyFalls.jpg",
    name: "蒂芙尼瀑布",
    description: "如果您正在寻找一个独特的自然区域来外出游玩，请考虑参观蒂芙尼瀑布保护区！该保护区被指定为自然和科学兴趣区 (ANSI)，拥有独特的地貌和“毛茸茸”的基岩暴露，还有蒂芙尼瀑布和洗衣板瀑布。",
    distance: "4.7 km",
    car: "10 min",
    bus: "25 min",
    bike: "25 min",
    walk: "1h",
    type: "Waterfalls",
  ),
  NearbyPlaceModel(
    image: "assets/places/WaterfrontTrail.jpg",
    name: "湖边小道",
    description: "汉密尔顿海滨步道是一条 7.5 公里的铺砌步道，是五大湖海滨步道“HamBur Loop”的一部分。它从 7 号码头向东延伸，穿过海湾公园，然后沿着海滨继续前行，这里被称为“加丁步道”，因为它穿过加丁运河，有一条与船道平行的浮动走道，终止于公主角。",
    distance: "3.4 km",
    car: "20 min",
    bus: "60 min",
    bike: "60 min",
    walk: "2h 50 min",
    type: "Trail",
  ),
  NearbyPlaceModel(
    image: "assets/places/DevilPunchbowlFalls.jpg",
    name: "德芙瀑布",
    description: "魔鬼酒杯由色彩缤纷的层状岩石组成，被广泛认为是悬崖上最令人难忘的景点之一。该保护区本身由两个独立的瀑布组成，落差为 5.5 米的下 Punchbowl 瀑布和落差 33.8 米的上 Punchbowl 瀑布，使其成为汉密尔顿第三高的瀑布。",
    distance: "22.1 km",
    car: "30 min",
    bus: "1h 20 min",
    bike: "1h 25 min",
    walk: "3h 30 min",
    type: "Waterfalls",
  ),
];

List<String> ChosenTags = [];
List<bool> bookmarkedPlaces = List.generate(nearbyPlaces.length, (_) => false);
