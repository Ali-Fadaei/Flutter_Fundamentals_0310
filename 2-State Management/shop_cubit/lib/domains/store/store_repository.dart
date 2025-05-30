import 'dart:ui';
import 'package:shop_cubit/domains/store/models/category.dart';
import 'package:shop_cubit/domains/store/models/product.dart';
import 'package:shop_cubit/domains/store/models/shop_item.dart';

class StoreRepository {
  //

  final _delay = 1000;

  List<Product> _favorites = [];

  List<ShopItem> _shopItems = [];

  Future<List<CategoryData>> getCategories() async {
    await Future.delayed(Duration(milliseconds: _delay));
    return [
      CategoryData(
        title: 'Mobile Phone',
        image: 'assets/imgs/products/Z_Fold_4.png',
        color: const Color.fromARGB(255, 161, 207, 178),
      ),
      CategoryData(
        title: 'Laptop',
        image: 'assets/imgs/products/zenbook_14x.png',
        color: const Color.fromARGB(255, 255, 210, 161),
      ),
      CategoryData(
        title: 'AirBuds',
        image: 'assets/imgs/products/sony_airbuds.png',
        color: const Color.fromARGB(255, 217, 197, 224),
      ),
      CategoryData(
        title: 'Network Devices',
        image: 'assets/imgs/products/asus_rt.png',
        color: const Color.fromARGB(255, 218, 241, 254),
      ),
    ];
  }

  Future<List<Product>> getProducts() async {
    final categories = await getCategories();
    await Future.delayed(Duration(milliseconds: _delay));
    return [
      Product(
        title: 'Galaxy S23 Ultra',
        rating: 4.8,
        price: 1200,
        image: 'assets/imgs/products/s23_ultra.png',
        description:
            'Samsung Galaxy S23 Ultra was introduced as the flagship of the S23 smartphone family with powerful technical specifications. At first glance, in terms of design, the Samsung Galaxy S23 Ultra does not have the changes compared to the previous generation Galaxy S22 Ultra, which means that both phones have almost the same performance. But you should know that the Galaxy S23 Ultra is more powerful than ever in the field of competition compared to the previous generation.',
        categoryData: categories[0],
      ),
      Product(
        title: 'Galaxy Z Fold 4',
        rating: 4,
        price: 1800,
        image: 'assets/imgs/products/Z_Fold_4.png',
        description:
            'Samsung Galaxy Z Fold4 is one of the new flexible smartphones of this company, which has powerful technical specifications and attractive features. It must be admitted that Samsung has been a pioneer in the field of flexible smartphones and has been able to show a very good performance.',
        categoryData: categories[0],
      ),
      Product(
        title: 'Iphone 13 Pro',
        rating: 4.8,
        price: 1200,
        image: 'assets/imgs/products/iphone_13_pro.png',
        description:
            'Apple has always been able to launch powerful and high-quality smartphones on the market, and the flagships of the 13 series were able to perform very brilliantly not only compared to the previous generation, the iPhone 12 family, but also compared to other competing flagships, by using powerful technical specifications. In terms of technical specifications, iPhone 13 Pro is nothing less than the flagship of this series, iPhone 13 Pro Max.',
        categoryData: categories[0],
      ),
      Product(
        title: 'Xiaomi 11 Ultra',
        rating: 4.6,
        price: 1000,
        image: 'assets/imgs/products/mi_11_ultra.png',
        description:
            'Xiaomi Mi 11 Ultra is one of the most powerful smartphones of this company, which has the ability to provide excellent performance in the position of a flagship phone. This phone is equipped with a 6.81-inch AMOLED screen with a resolution of 1440 x 3200 pixels. A very high-quality screen capable of displaying 515 pixels per inch and a refresh rate of 120 Hz.',
        categoryData: categories[0],
      ),
      Product(
        title: 'Apple Macbook Pro 2023',
        rating: 4.2,
        price: 2500,
        image: 'assets/imgs/products/macbook_pro.png',
        description:
            'Apple\'s 2023 MacBook Pro laptop introduced in 2023 is one of the best and most modern Apple laptops. This laptop with a stylish and resistant design and benefiting from advanced Apple technologies is one of the best options for users who are looking for a powerful and efficient device. This laptop has a 14.2-inch Retina screen with a resolution of 3024 x 1964 pixels, offering a spectacular and unique experience to its users.',
        categoryData: categories[1],
      ),
      Product(
        title: 'Microsoft Surface Laptop Studio',
        rating: 4.8,
        price: 2400,
        image: 'assets/imgs/products/surface_studio.png',
        description:
            'Surface Studio laptop is a series of Microsoft laptops. The screen of this laptop is 14.4 inches, the type of panel used in it; PixelSense is. The resolution of the image on this screen will be 2400 x 1600 pixels. The refresh rate on this screen reaches 120 Hz. So if you need a laptop whose screen can provide you with a quality image, this laptop can be suitable for you. On the other hand, this laptop also uses a powerful central processor that can help you in different matters.',
        categoryData: categories[1],
      ),
      Product(
        title: 'Asus Zenbook 14X',
        rating: 4.9,
        price: 1500,
        image: 'assets/imgs/products/zenbook_14x.png',
        description:
            'ASUS ZenBook 14X series laptops are among the extremely beautiful products of this company, which can be a very ideal choice for designers. The ZenBook 14X OLED UX5401ZA-L7036 laptop is one of these products and has interesting hardware specifications. This laptop is equipped with a very powerful Intel Core i7 12700H processor. Also, 16 GB of LPDDR5 RAM along with 1 TB of SSD NVMe PCIe 4.0 memory is considered for this laptop. But it is the display of this laptop that distinguishes it from many similar products. This laptop is equipped with a 14-inch OLED screen with a resolution of 1800 x 2880 or 2.8K.',
        categoryData: categories[1],
      ),
      Product(
        title: 'Sony AirBuds WF-1000XM4',
        rating: 4.8,
        price: 400,
        image: 'assets/imgs/products/sony_airbuds.png',
        description:
            'Sony officially unveiled the WF-1000XM4 earphones. In this truly wireless earphone, for the first time, the new Integrated Processor V1 and the DSEE Extreme audio engine (which was previously used in the WH-1000XM4 over-ear headphones) have been used. The Integrated Processor V1 improves the noise cancellation performance and reduces the power consumption of the headphones. Sony engineers say that this processor has increased the noise cancellation system\'s ability to remove high frequencies by 40%. A new 6mm dynamic driver is also designed for WF-1000XM4 to improve sound quality and especially bass performance.',
        categoryData: categories[2],
      ),
      Product(
        title: 'Apple AirPods Pro 2',
        rating: 4.5,
        price: 350,
        image: 'assets/imgs/products/apple_airpods_pro2.png',
        description:
            'The second generation of Apple AirPods Pro series was introduced with new features. This series of wireless headphones from Apple has always attracted the attention of enthusiasts due to its unique features and in this generation we see the addition of several new features. The Apple AirPods Pro 2nd generation wireless headphones are equipped with Bluetooth 5.3 in addition to its extremely high build quality, so that we can see its very high connection speed. This wireless headphone has the ability to reduce noise twice as much as its previous generation and up to 48,000 times per second.',
        categoryData: categories[2],
      ),
      Product(
        title: 'Huawei FreeBuds 5i',
        rating: 4.6,
        price: 120,
        image: 'assets/imgs/products/huawei_freebuds_5i.png',
        description:
            'The design intended for the charger compartment with appropriate dimensions does not cause any problems in terms of portability, and of course the design of the headphones is in such a way that it fits well in the ear and does not come out of the ear easily, for example, while walking or running. The noise canceling feature of this headphone has caused the noises and sounds in the environment to be removed to a great extent and finally you will see a very high quality sound output. Each of the headphones has the ability to provide a useful life (standby time) of 6 hours for playing music with the noise canceling feature active. When the noise canceling is disabled, you will see a useful life of 7.5 hours per 100% charge for playing music.',
        categoryData: categories[2],
      ),
      Product(
        title: 'Asus RT-AX89X',
        rating: 4.9,
        price: 340,
        image: 'assets/imgs/products/asus_rt.png',
        description:
            'Asus, one of the most successful brands of network equipment manufacturers in the world, has released products that comply with the WiFi 6 standard. To use this new and useful solution, you need routers with 802.11ax standard, which most routers and new ASUS network products support this interface, and in addition to high speed and double security, unique features such as a dedicated gaming network with The use of Adaptive QoS, wtfast, AiMesh and AiProtectio has provided users with a perfect and professional network for the simultaneous use of new compatible devices such as Sony and Microsoft 9th generation consoles. One of the products that has received a lot of news these days is the new generation of gaming consoles such as PlayStation 5 and XBOX Series X, whose network solution includes WiFi 6.',
        categoryData: categories[3],
      ),
      Product(
        title: 'Asus RT-AX89X',
        rating: 4.7,
        price: 240,
        image: 'assets/imgs/products/asus_dsl.png',
        description:
            'Asus, one of the most successful brands of network equipment manufacturers in the world, has released products that comply with the WiFi 6 standard. To use this new and useful solution, you need routers with 802.11ax standard, which most routers and new ASUS network products support this interface, and in addition to high speed and double security, unique features such as a dedicated gaming network with The use of Adaptive QoS, wtfast, AiMesh and AiProtectio has provided users with a perfect and professional network for the simultaneous use of new compatible devices such as Sony and Microsoft 9th generation consoles. One of the products that has received a lot of news these days is the new generation of gaming consoles such as PlayStation 5 and XBOX Series X, whose network solution includes WiFi 6.',
        categoryData: categories[3],
      ),
      Product(
        title: 'Dlink 4G N300 DWR-M921',
        rating: 4.7,
        price: 80,
        image: 'assets/imgs/products/dlink_4g.png',
        description:
            'D-Link wireless router model 4G N300 DWR-M921 is a product of "D-Link" company. This D-Link router has a SIM card slot that you can use from all operators. Next to the SIM card slot, there are four LAN ports that can be used to wirelessly connect devices to a wireless network. Also, this device can be connected to your current internet through a WAN connection. This connection can include a broadband Internet that you receive through wireless point-to-point (P2P) antennas or the same home ADSL connection that you have been using for a long time. Four antennas are considered for this device, two of which are for connecting G/4G3 antennas and the other two are for Wi-Fi network antennas.',
        categoryData: categories[3],
      ),
    ];
  }

  Future<List<Product>> getFavorites() async {
    await Future.delayed(Duration(milliseconds: _delay));
    return _favorites;
  }

  Future<void> updateFavorites(List<Product> favs) async {
    await Future.delayed(Duration(milliseconds: _delay));
    _favorites = favs;
  }

  Future<List<ShopItem>> getShopItems() async {
    await Future.delayed(Duration(milliseconds: _delay));
    return _shopItems;
  }

  Future<void> updateShopItems(List<ShopItem> shopItems) async {
    await Future.delayed(Duration(milliseconds: _delay));
    _shopItems = shopItems;
  }
}
