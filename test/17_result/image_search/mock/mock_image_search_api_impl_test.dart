import 'package:learn_dart_together/17_result/image_search/dto/photo_result_dto.dart';
import 'package:learn_dart_together/17_result/image_search/exception/network_error.dart';
import 'package:learn_dart_together/17_result/image_search/mapper/photo_mapper.dart';
import 'package:learn_dart_together/17_result/image_search/mock/mock_image_search_api_impl.dart';
import 'package:learn_dart_together/17_result/image_search/mock/mock_network_image_search_api_impl.dart';
import 'package:learn_dart_together/17_result/image_search/repository_impl/photo_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  late MockImageSearchApiImpl mockImageSearchApiImpl;
  late MockNetworkImageSearchApiImpl mockNetworkImageSearchApiImpl;
  late PhotoRepositoryImpl photoRepositoryImpl;
  final dummyData = [
    {
      "id": 7679117,
      "pageURL":
          "https://pixabay.com/photos/flower-stamens-hypericum-macro-7679117/",
      "type": "photo",
      "tags": "flower, nature, stamens",
      "previewURL":
          "https://cdn.pixabay.com/photo/2022/12/26/13/50/flower-7679117_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/g8fc459327ed8188e3c559591da2c40544aa02c6af6c3e65c636acbfdeee4a249fb76fdb11b0ccd9f8db5e518cafe87864bc438148ddc326ffd7cca0893b57a07_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL":
          "https://pixabay.com/get/g803c51dc0180acd1f2b0e8107d94d552921168f5e40d0add6a0cd9306eac04a060ff3ad29c3b8355f9145a8f87d44ded9eff3fa833e10e9a49e85636571d13ce_1280.jpg",
      "imageWidth": 6000,
      "imageHeight": 4000,
      "imageSize": 8137356,
      "views": 21317,
      "downloads": 16142,
      "collections": 47,
      "likes": 111,
      "comments": 19,
      "user_id": 4379051,
      "user": "Alfred_Grupstra",
      "userImageURL":
          "https://cdn.pixabay.com/user/2024/02/08/08-50-03-474_250x250.jpeg"
    },
    {
      "id": 4750726,
      "pageURL":
          "https://pixabay.com/photos/flower-petals-bloom-yellow-yellow-4750726/",
      "type": "photo",
      "tags": "flower, petals, nature",
      "previewURL":
          "https://cdn.pixabay.com/photo/2020/01/08/17/32/flower-4750726_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL":
          "https://pixabay.com/get/ge6c0de396e3ef33a83ce6e1bc3dfe1db3329484451d61019569e05a6a632c077c0ba0fd2abe6420dd201e949f766c8497c00492d1fb5bcf1caf629830065995b_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 425,
      "largeImageURL":
          "https://pixabay.com/get/g70063b78112f1c9b412a0e6226102c55c05082c59cad9526196aee18a47f4c6f34a8ec3ef766d58b701de4d910a6009f56b6921e27359f7ce951b577d75cc951_1280.jpg",
      "imageWidth": 3008,
      "imageHeight": 2000,
      "imageSize": 1453867,
      "views": 6647,
      "downloads": 3902,
      "collections": 60,
      "likes": 55,
      "comments": 23,
      "user_id": 14174246,
      "user": "Zotx",
      "userImageURL":
          "https://cdn.pixabay.com/user/2019/11/20/20-56-12-836_250x250.jpg"
    },
    {
      "id": 6316445,
      "pageURL": "https://pixabay.com/photos/rapeseeds-yellow-flowers-6316445/",
      "type": "photo",
      "tags": "rapeseeds, beautiful flowers, yellow",
      "previewURL":
          "https://cdn.pixabay.com/photo/2021/06/06/21/55/rapeseeds-6316445_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/g8e4edaf1becf993b25439a1d0f6c6aea5aa1193fbc4ed09eda1d31773f08c4879da2b6e716de26dfd927d994e415b4fb915bfed740072ffaf0beb0e401f96db9_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL":
          "https://pixabay.com/get/ge84c2271630eaaa9a51aac5d82ecd87ab2716e307c04b5bb02cf3a8c92cefc43cad396cd9019d66be1596572d725e09ae2000d03d85452a45baa554c4bec07c0_1280.jpg",
      "imageWidth": 6000,
      "imageHeight": 4000,
      "imageSize": 7735260,
      "views": 33451,
      "downloads": 26958,
      "collections": 47,
      "likes": 80,
      "comments": 19,
      "user_id": 11378535,
      "user": "__Tatius__",
      "userImageURL":
          "https://cdn.pixabay.com/user/2020/10/16/11-47-36-873_250x250.jpeg"
    },
    {
      "id": 715540,
      "pageURL":
          "https://pixabay.com/photos/yellow-flower-blossom-bloom-petals-715540/",
      "type": "photo",
      "tags": "yellow, flower, blossom",
      "previewURL":
          "https://cdn.pixabay.com/photo/2015/04/10/00/41/yellow-715540_150.jpg",
      "previewWidth": 150,
      "previewHeight": 84,
      "webformatURL":
          "https://pixabay.com/get/gdd04e6039f449655157cfce5c5ddc14c74f54f2634a7e2be5f8b374783f55931714a51edd66751420c093b734ee1389a_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 360,
      "largeImageURL":
          "https://pixabay.com/get/gccf7c541e735d1462e3a69d91f2e316bdf6ee4184a981882a310b5837d224f8ea0e053ae3427b439f00768842381256a1f61a3f5f70711680ef7372e1ee7489f_1280.jpg",
      "imageWidth": 3020,
      "imageHeight": 1703,
      "imageSize": 974940,
      "views": 175236,
      "downloads": 107337,
      "collections": 477,
      "likes": 405,
      "comments": 54,
      "user_id": 916237,
      "user": "Wow_Pho",
      "userImageURL":
          "https://cdn.pixabay.com/user/2015/04/07/14-10-15-590_250x250.jpg"
    },
    {
      "id": 4384750,
      "pageURL":
          "https://pixabay.com/photos/flower-yellow-flower-plant-macro-4384750/",
      "type": "photo",
      "tags": "flower, yellow flower, plant",
      "previewURL":
          "https://cdn.pixabay.com/photo/2019/08/04/20/48/flower-4384750_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/g9cb83ed08334537c17b45553feeeca3d9afd932569ecfa89c42822bf3c31b403840de31f71536b91ae158f963bd8a6f785517de5dd0ae5113a87bebb65301a90_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL":
          "https://pixabay.com/get/gea0c8f173729ebcc855234240cd3cf24ecbfbd19774e2e5c256fddd28069baa9d81febf588d84a51ba2aec0865d20955d34b4ea68fd5d5fb429d45bae66dc72d_1280.jpg",
      "imageWidth": 5286,
      "imageHeight": 3532,
      "imageSize": 1161871,
      "views": 3292,
      "downloads": 2095,
      "collections": 6,
      "likes": 48,
      "comments": 26,
      "user_id": 7520060,
      "user": "DerWeg",
      "userImageURL":
          "https://cdn.pixabay.com/user/2023/07/09/08-27-31-784_250x250.jpg"
    },
    {
      "id": 6520851,
      "pageURL":
          "https://pixabay.com/photos/flower-yellow-flower-bloom-blossom-6520851/",
      "type": "photo",
      "tags": "flower, yellow flower, bloom",
      "previewURL":
          "https://cdn.pixabay.com/photo/2021/08/04/02/02/flower-6520851_150.jpg",
      "previewWidth": 150,
      "previewHeight": 103,
      "webformatURL":
          "https://pixabay.com/get/g815f04c86ac469d63520e8bcba3aa190f9477590c4a4bc78bcc9bcce9557920b3d21fa547ad7feb44bee6f5a21924336b548584a4cf5b951fea0fdf419741178_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 439,
      "largeImageURL":
          "https://pixabay.com/get/g5face5a58b9142cd217b1d719edc4957e71d6d66f41137bed444b9af7bf7523ec8434004069f521f9f3b901fa02bf4eea295f6613b02e284d88336b111afd55f_1280.jpg",
      "imageWidth": 3910,
      "imageHeight": 2680,
      "imageSize": 3171422,
      "views": 13848,
      "downloads": 6928,
      "collections": 79,
      "likes": 95,
      "comments": 21,
      "user_id": 6246704,
      "user": "fernandozhiminaicela",
      "userImageURL":
          "https://cdn.pixabay.com/user/2019/02/27/14-16-13-192_250x250.jpg"
    },
    {
      "id": 4042853,
      "pageURL": "https://pixabay.com/photos/sulphur-anemone-flowers-4042853/",
      "type": "photo",
      "tags": "sulphur anemone, flowers, yellow flower",
      "previewURL":
          "https://cdn.pixabay.com/photo/2019/03/08/17/43/sulphur-anemone-4042853_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL":
          "https://pixabay.com/get/g2971effc687397c4da3c3c914935f4bf04aa4d481778bdb53c82fa74ba1b0522ee1f638bbf3db49ca5293130d96e296247d0f41cd4a5d0a84d1d5ce416c79d5d_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 426,
      "largeImageURL":
          "https://pixabay.com/get/g9add44a83c86572e84c58240ba2b952557bd84b9ad8c9f3d86d29ea441184c605e57f9346da2c4fe6a71a1c0b7ccad0509061e38498d97aba9e607e145704d23_1280.jpg",
      "imageWidth": 5394,
      "imageHeight": 3593,
      "imageSize": 7268701,
      "views": 19451,
      "downloads": 14174,
      "collections": 44,
      "likes": 86,
      "comments": 20,
      "user_id": 6482,
      "user": "gsibergerin",
      "userImageURL":
          "https://cdn.pixabay.com/user/2019/03/09/16-09-22-778_250x250.jpg"
    },
    {
      "id": 4936511,
      "pageURL":
          "https://pixabay.com/photos/flowers-yellow-flowers-nature-4936511/",
      "type": "photo",
      "tags": "flowers, flower background, flower wallpaper",
      "previewURL":
          "https://cdn.pixabay.com/photo/2020/03/16/10/27/flowers-4936511_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/gb253d1b1b12d16097013b39d6d3ffdd3a4c490a2ee59ffb78483b1d2d2783fa2f3c0ff55258a244dcf779464256a7f357ca67fd350c6057b86ff3cd37140e2ac_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL":
          "https://pixabay.com/get/g975edabfba9ad29f8c0bcc80fb6c4a569fcd29e309909dc7deaaad6f792b3ca6e75c6f40fd63fcd2e76d17054fdb744ff41515c5401a4127eb784d623be12cc3_1280.jpg",
      "imageWidth": 5000,
      "imageHeight": 3333,
      "imageSize": 2156782,
      "views": 32882,
      "downloads": 20512,
      "collections": 128,
      "likes": 119,
      "comments": 21,
      "user_id": 3603324,
      "user": "phtorxp",
      "userImageURL":
          "https://cdn.pixabay.com/user/2022/11/27/11-56-03-466_250x250.jpg"
    },
    {
      "id": 113735,
      "pageURL":
          "https://pixabay.com/photos/flower-rose-garden-yellow-rose-113735/",
      "type": "photo",
      "tags": "flower, rose, garden",
      "previewURL":
          "https://cdn.pixabay.com/photo/2013/05/26/12/14/flower-113735_150.jpg",
      "previewWidth": 150,
      "previewHeight": 83,
      "webformatURL":
          "https://pixabay.com/get/gee3250ae2e8c1697bf44bf9a7f629f1f5f5259fab49b46b42a2485423e15a110de4fbc4b37b1ea17c3135b8aa2283da4_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 355,
      "largeImageURL":
          "https://pixabay.com/get/g19dbcc8d6afce2b9e6d8cdbf255f305ae51ee9d77fddf5f9c9b2ca2c3998dbc2d9c03d940910eae1352cb30768da720515c67436637333b427bd340253a5d303_1280.jpg",
      "imageWidth": 2410,
      "imageHeight": 1337,
      "imageSize": 299425,
      "views": 174290,
      "downloads": 66963,
      "collections": 353,
      "likes": 341,
      "comments": 52,
      "user_id": 817,
      "user": "blizniak",
      "userImageURL":
          "https://cdn.pixabay.com/user/2013/06/28/17-07-05-714_250x250.jpg"
    },
    {
      "id": 273391,
      "pageURL":
          "https://pixabay.com/photos/flower-yellow-petals-yellow-flower-273391/",
      "type": "photo",
      "tags": "flower, yellow petals, yellow flower",
      "previewURL":
          "https://cdn.pixabay.com/photo/2014/02/24/05/11/flower-273391_150.jpg",
      "previewWidth": 150,
      "previewHeight": 112,
      "webformatURL":
          "https://pixabay.com/get/g387910d3a2393db07d96843ea43e9fa8749dbfcf1faefb970b451c4cd04eb4ef20ce9a5e78b1f766368d09293d540432_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 480,
      "largeImageURL":
          "https://pixabay.com/get/g2ee035b35b61425734faa2389820e2d73865e046a4b76f3e9a52afa6824e9f235d3427477f9c13173582e34c62f4193de359a38aabb7dc4f67c3373bcf8e8f0c_1280.jpg",
      "imageWidth": 2607,
      "imageHeight": 1956,
      "imageSize": 890318,
      "views": 23513,
      "downloads": 7542,
      "collections": 91,
      "likes": 81,
      "comments": 13,
      "user_id": 152861,
      "user": "angelac72",
      "userImageURL":
          "https://cdn.pixabay.com/user/2014/02/10/02-47-32-118_250x250.jpg"
    },
    {
      "id": 6558487,
      "pageURL":
          "https://pixabay.com/photos/flowers-coast-sea-yellow-flowers-6558487/",
      "type": "photo",
      "tags": "flowers, coast, sea",
      "previewURL":
          "https://cdn.pixabay.com/photo/2021/08/19/16/31/flowers-6558487_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/g8ac48d942b8f0d914743a7a4da442552fa23eea34a332290476a7fbd63d535e8acf7b5010d6133a606ac73b4a72db9960722534b36167c310d96f2e4e012327e_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 426,
      "largeImageURL":
          "https://pixabay.com/get/g081354ce9158104d8f5a8afdb64f3494fb5d25bf06e8885b190d9c51e3b609923aafd2604ee0293b0da851d8bf7db1f62d393b7dd8320e0e0b6318c827016f4a_1280.jpg",
      "imageWidth": 4256,
      "imageHeight": 2832,
      "imageSize": 4587665,
      "views": 172062,
      "downloads": 145889,
      "collections": 238,
      "likes": 321,
      "comments": 40,
      "user_id": 21633244,
      "user": "lillolillolillo",
      "userImageURL":
          "https://cdn.pixabay.com/user/2021/06/09/06-56-51-212_250x250.jpg"
    },
    {
      "id": 6162613,
      "pageURL":
          "https://pixabay.com/photos/yellow-rose-rose-flower-cereal-6162613/",
      "type": "photo",
      "tags": "yellow rose, rose, flower",
      "previewURL":
          "https://cdn.pixabay.com/photo/2021/04/08/18/59/yellow-rose-6162613_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/g221ebab14db0fefa2948c2f7e519f67e6728d8bd789c86019b19c1c7e48c93e5461a28dcfa62629e25fd15efdf7874b0b69c8561a25f05631e6c499aeab9c6ae_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL":
          "https://pixabay.com/get/g0fc4e325c13121d41d01af17391067bce48d28b61ad54789c87b187a1469d45ab3d3b8f4d82987b3c47fbd7f207843ffa93a54819173c6500bbfdefc332c81fa_1280.jpg",
      "imageWidth": 4240,
      "imageHeight": 2832,
      "imageSize": 2389361,
      "views": 52216,
      "downloads": 39327,
      "collections": 114,
      "likes": 264,
      "comments": 199,
      "user_id": 9363663,
      "user": "Nowaja",
      "userImageURL":
          "https://cdn.pixabay.com/user/2020/09/15/15-16-12-52_250x250.jpg"
    },
    {
      "id": 7193390,
      "pageURL":
          "https://pixabay.com/photos/flower-ranunculus-petals-dark-7193390/",
      "type": "photo",
      "tags": "flower, ranunculus, petals",
      "previewURL":
          "https://cdn.pixabay.com/photo/2022/05/13/10/35/flower-7193390_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/g434245976f447a5dc761b3b5ab9b9ff470b23443188fde2bef40cdb440ba047a531f54ddb9a567df548fca7a3cd1235f8961d19d4f1adcc94f5e9403c96d197d_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL":
          "https://pixabay.com/get/g6606920b56043e37d526876ae5ea513c0080bc8f4b09e6f1a944f467ce7ae404ce3be006f8bfe009f0b1cba9c79b38b3a9798e07ca65b2517f5d0f53c8982d2c_1280.jpg",
      "imageWidth": 5472,
      "imageHeight": 3648,
      "imageSize": 2311191,
      "views": 11158,
      "downloads": 7636,
      "collections": 77,
      "likes": 99,
      "comments": 11,
      "user_id": 25590070,
      "user": "nohopuku_photography",
      "userImageURL":
          "https://cdn.pixabay.com/user/2023/10/17/09-33-11-665_250x250.jpg"
    },
    {
      "id": 1972411,
      "pageURL":
          "https://pixabay.com/photos/drip-yellow-petals-globules-water-1972411/",
      "type": "photo",
      "tags": "drip, yellow, beautiful flowers",
      "previewURL":
          "https://cdn.pixabay.com/photo/2017/01/11/17/27/drip-1972411_150.jpg",
      "previewWidth": 150,
      "previewHeight": 87,
      "webformatURL":
          "https://pixabay.com/get/ge4a13096b02134f5c7d05b5b46371c7a9aae937235e29327abd2d2717b903a586f9d4c3cd463358c517d635a330bb17fdad6e21700683b0ff36664a608a75f7f_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 372,
      "largeImageURL":
          "https://pixabay.com/get/g3de3a4d9a62c174c881cefd1dc067382031bf00c880f8fff17d372981f4511f04230589d85038d012770c18f1ff362231c54eabb514ddf21ceccac11cb015099_1280.jpg",
      "imageWidth": 4288,
      "imageHeight": 2499,
      "imageSize": 1510459,
      "views": 175760,
      "downloads": 146797,
      "collections": 449,
      "likes": 471,
      "comments": 63,
      "user_id": 1777190,
      "user": "susannp4",
      "userImageURL":
          "https://cdn.pixabay.com/user/2015/12/16/17-56-55-832_250x250.jpg"
    },
    {
      "id": 4270247,
      "pageURL":
          "https://pixabay.com/photos/plantain-leaved-leopards-bane-4270247/",
      "type": "photo",
      "tags": "plantain-leaved leopard's-bane, flowers, garden",
      "previewURL":
          "https://cdn.pixabay.com/photo/2019/06/12/21/09/plantain-leaved-leopards-bane-4270247_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/g228cca62670357602e5db740a4351606e06f268e498f4b5526668ae42684ae89abea5c99a049dc58a9630d57b83a8bf077d27875b5184bc0cb0fbd71303906a2_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL":
          "https://pixabay.com/get/g47b9a0cebdf5fa80bc4e70629b8ca42411f8f20088037e307fea57b13702f0448514235fd6e5be4e3ad20bcb5dbb41dbc40dcce700d87b299fd86df640718b5b_1280.jpg",
      "imageWidth": 4900,
      "imageHeight": 3271,
      "imageSize": 3332332,
      "views": 43273,
      "downloads": 33909,
      "collections": 129,
      "likes": 164,
      "comments": 65,
      "user_id": 1377835,
      "user": "MabelAmber",
      "userImageURL":
          "https://cdn.pixabay.com/user/2023/04/19/11-42-04-154_250x250.jpg"
    },
    {
      "id": 4989694,
      "pageURL":
          "https://pixabay.com/photos/rananculus-flowers-plant-nature-4989694/",
      "type": "photo",
      "tags": "rananculus, flowers, plant",
      "previewURL":
          "https://cdn.pixabay.com/photo/2020/04/01/01/13/rananculus-4989694_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/g01415da9327ee602a77bc4393e3d98f813e49207d4bda622857b5763e95b6b36b3c3f20b84f464ce1801c9f226214b2c4a7fdfaaed46212c39e4311acc957aa2_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL":
          "https://pixabay.com/get/g371adfbec06183547b647c8420a57d70188dec212ebef93fac90b1e5bb9a7c7ef6ce865c19acca9f91eb7c88ed69441521d184cfafaf239b8beda5250a2dcb6c_1280.jpg",
      "imageWidth": 4752,
      "imageHeight": 3168,
      "imageSize": 1475741,
      "views": 11239,
      "downloads": 8237,
      "collections": 78,
      "likes": 74,
      "comments": 10,
      "user_id": 13405528,
      "user": "tayphuong388",
      "userImageURL":
          "https://cdn.pixabay.com/user/2020/04/06/08-25-05-747_250x250.jpg"
    },
    {
      "id": 208299,
      "pageURL": "https://pixabay.com/photos/rapeseeds-flowers-field-208299/",
      "type": "photo",
      "tags": "rapeseeds, flowers, field",
      "previewURL":
          "https://cdn.pixabay.com/photo/2013/11/10/14/47/rapeseeds-208299_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/g5c76ec84efc554b9ab685a7ef3954115c64e013772480c10f1e3ea7b98df41f3a7fff3303636019f00845f2547664630_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 428,
      "largeImageURL":
          "https://pixabay.com/get/g8e47e1ab8eb3e7a528004be2d8f8b6de374a23b61545144f628a0dcfdadd1011f265f0e0891dbecde9f28df3f6dd8da171ed55c977aae626f006bd4fb0ee82a8_1280.jpg",
      "imageWidth": 1936,
      "imageHeight": 1296,
      "imageSize": 991014,
      "views": 38428,
      "downloads": 17522,
      "collections": 146,
      "likes": 125,
      "comments": 20,
      "user_id": 83702,
      "user": "Tihomir",
      "userImageURL":
          "https://cdn.pixabay.com/user/2013/11/05/19-31-44-620_250x250.jpg"
    },
    {
      "id": 8287698,
      "pageURL":
          "https://pixabay.com/photos/rose-yellow-rose-yellow-flower-8287698/",
      "type": "photo",
      "tags": "rose, yellow rose, yellow flower",
      "previewURL":
          "https://cdn.pixabay.com/photo/2023/10/01/16/01/rose-8287698_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/g27cd9da9bff0c6ae7aea6c56a6ba06fd5c2106ef46901318db19dae00eb3e9e145247b87874a7c587c657cb63629462e8ffab0421bd9b9e816913c2cc79dfe58_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL":
          "https://pixabay.com/get/g1774deb5b99494fe0c1037a953476ffa2d6ed6d1072acea0b9ff1dcc9635a556b711176efd264b88529cb1f9095b196d53a3463cd79d14b2abc936180c1a47e5_1280.jpg",
      "imageWidth": 5184,
      "imageHeight": 3456,
      "imageSize": 5447146,
      "views": 10134,
      "downloads": 7655,
      "collections": 37,
      "likes": 116,
      "comments": 24,
      "user_id": 258037,
      "user": "glacika56",
      "userImageURL":
          "https://cdn.pixabay.com/user/2023/11/01/09-53-06-80_250x250.jpg"
    },
    {
      "id": 2107024,
      "pageURL":
          "https://pixabay.com/photos/crocus-flowers-yellow-bloom-2107024/",
      "type": "photo",
      "tags": "crocus, flowers, yellow",
      "previewURL":
          "https://cdn.pixabay.com/photo/2017/02/28/22/37/crocus-2107024_150.jpg",
      "previewWidth": 150,
      "previewHeight": 99,
      "webformatURL":
          "https://pixabay.com/get/g6ec406c57a54d58129332af0c1226a49a9b9e055332e75d3e5bc03b5705fde45308555846ae18756287de27de20fbabf279d6dc770e83d393d5de120c5d393ec_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 426,
      "largeImageURL":
          "https://pixabay.com/get/g0b623f488b5d9ae711faf959058a81f169f280c892697a23bd29f0d10577cfd439438dd14cb1cac3c8ba28036a7f88b701673781f819279897f3526cdc6bd0d6_1280.jpg",
      "imageWidth": 4896,
      "imageHeight": 3264,
      "imageSize": 2596169,
      "views": 109151,
      "downloads": 70029,
      "collections": 209,
      "likes": 302,
      "comments": 51,
      "user_id": 1195798,
      "user": "Couleur",
      "userImageURL":
          "https://cdn.pixabay.com/user/2024/03/25/12-37-22-819_250x250.png"
    },
    {
      "id": 7019264,
      "pageURL":
          "https://pixabay.com/photos/flower-petal-wet-macro-tulip-7019264/",
      "type": "photo",
      "tags": "flower, petal, wet",
      "previewURL":
          "https://cdn.pixabay.com/photo/2022/02/17/18/22/flower-7019264_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL":
          "https://pixabay.com/get/g84e23a7bba45cf744a3ecb26134461c8359fb2bd0072ee627c5cefbb9c10e90cf46026f808fcad93cd3f1742714ae9219c75d954617fb3607bc7f767fcf59220_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL":
          "https://pixabay.com/get/g6d03b1351837dcb98496e2d2b7070a74cef3beb89734f5df871eec8cb1341dbcd0e7ce6d202453fcd4d459fe780d4eab7a208e92b5b41e4dc51874e465afc0e1_1280.jpg",
      "imageWidth": 6001,
      "imageHeight": 4000,
      "imageSize": 3386198,
      "views": 26958,
      "downloads": 22443,
      "collections": 71,
      "likes": 143,
      "comments": 24,
      "user_id": 19662978,
      "user": "angelicavaihel",
      "userImageURL":
          "https://cdn.pixabay.com/user/2021/03/15/08-35-41-698_250x250.png"
    }
  ];

  test('정상 생성 확인', () async {
    mockImageSearchApiImpl = MockImageSearchApiImpl();
    photoRepositoryImpl = PhotoRepositoryImpl(mockImageSearchApiImpl);

    final getPhotoDtoResult = await photoRepositoryImpl.getPhotos('query');
    final fakeData =
        dummyData.map((json) => PhotoDto.fromJson(json).toPhoto()).toList();

    getPhotoDtoResult.when(
      success: (photos) {
        expect(photos, fakeData);
      },
      error: (error) {
        fail(ErrorList.unknown.name);
      },
    );
  });

  test('네트워크 에러', () async {
    mockNetworkImageSearchApiImpl = MockNetworkImageSearchApiImpl();
    photoRepositoryImpl = PhotoRepositoryImpl(mockNetworkImageSearchApiImpl);

    final getPhotoDtoResult = await photoRepositoryImpl.getPhotos('query');
    getPhotoDtoResult.when(
      success: (photos) {
        fail(ErrorList.unknown.name);
      },
      error: (error) {
        expect(error, ErrorList.unknown);
      },
    );
  });

  test('비속어 테스트', () async {
    mockImageSearchApiImpl = MockImageSearchApiImpl();
    photoRepositoryImpl = PhotoRepositoryImpl(mockImageSearchApiImpl);

    final getPhotoDtoResult = await photoRepositoryImpl.getPhotos('바보');
    getPhotoDtoResult.when(
      success: (photos) {
        fail(ErrorList.unknown.name);
      },
      error: (error) {
        expect(error, ErrorList.cantUseSlang);
      },
    );
  });
}
