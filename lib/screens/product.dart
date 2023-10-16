import 'package:jayzapp/screens/cart.dart';
import 'package:jayzapp/screens/wishlist.dart';

class Product {
  final int productId;
  final int price;
  final String category;
  final String name;
  final String image;
  final String tagLine;
  final String description;
  bool isFavourite;

  Product({
    required this.productId,
    required this.price,
    required this.category,
    required this.name,
    required this.image,
    required this.tagLine,
    required this.description,
    this.isFavourite=false,
  });

  void addToCart(int Quantity) {
    // Check if the product already exists in the cart
    int existingIndex = cartItems.indexWhere((item) => item.productId == productId);
    if (existingIndex != -1) {
      // Update the quantity of the existing product in the cart
      cartItems[existingIndex] = CartItem(
        productId: productId,
        quantity: cartItems[existingIndex].quantity + Quantity,
      );
    } else {
      // Add the product as a new item to the cart
      cartItems.add(CartItem(
        productId: productId,
        quantity: Quantity,
      ));
    }
  }
  void addToWishList() {
    // Check if the product already exists in the Wishlist
    int existingIndex = wishList.indexWhere((item) => item.productId == productId);
    if (existingIndex != -1) {
      print("ALready in wishList");
    } else {
      // Add the product as a new item to the cart
      wishList.add(WishList(
        productId: productId,
      ));
    }
  }
}
List<Product> pizza= [
  Product(
    productId: 1,
    price: 100,
    category: 'Pizzas',
    name: 'Pepperoni',
    image: 'images/pizza1.png',
    tagLine: 'Always our best pizza!',
    description: 'Pepperoni pizza is an American pizza variety which includes one of the country most beloved toppings',
  ),
  Product(
    productId: 2,
    price: 100,
    category: 'Pizzas',
    name: 'Supreme Feast',
    image: 'images/pizza2.png',
    tagLine: 'Indulge in Pizza Perfection!',
    description: 'Treat yourself to the ultimate pizza experience with our Supreme Feast. This crowd-pleasing pizza features a symphony of flavors,'
        'including pepperoni, sausage, mushrooms, bell peppers, onions, and black olives, all crowned with melted cheese.',
  ),
  Product(
    productId: 3,
    price: 100,
    category: 'Pizzas',
    name: 'Classic Margherita',
    image: 'images/pizza3.png',
    tagLine: 'Timeless Perfection!',
    description: ' Indulge in the simplicity of our Classic Margherita pizza. Topped with fresh tomatoes, mozzarella cheese, and basil leaves,'
        ' its a delightful harmony of flavors that never goes out of style.',
  ),
  Product(
    productId: 4,
    price: 100,
    category: 'Pizzas',
    name: 'Chicken Supreme',
    image: 'images/pizza4.png',
    tagLine: 'Savor the Smoky Sensation',
    description: 'Experience a smoky sensation with our BBQ Chicken Supreme pizza. Tender chicken marinated in tangy barbecue sauce, accompanied by red onions, cilantro, and melted cheese, '
        'creates a harmonious blend of flavors that will leave you craving more.',
  ),
  Product(
    productId: 5,
    price: 100,
    category: 'Pizzas',
    name: 'Four Cheese Bliss',
    image: 'images/pizza5.png',
    tagLine: 'Melting Pot of Cheese!',
    description: 'Immerse yourself in the gooey goodness of our Four Cheese Bliss pizza. Crafted with a delectable combination of mozzarella, '
        'cheddar, Parmesan, and Gorgonzola cheeses, this pizza delivers a heavenly cheesy experience with every bite.',
  ),
  Product(
    productId: 6,
    price: 100,
    category: 'Pizzas',
    name: 'Spicy Diablo',
    image: 'images/pizza6.png',
    tagLine: 'Ignite Your Taste Buds!',
    description: 'Brace yourself for a fiery adventure with our Spicy Diablo pizza. Packed with spicy pepperoni, jalapeños, '
        'hot sauce, and a blend of cheeses, this pizza delivers a tantalizing kick that will awaken your taste buds.',
  ),
  Product(
    productId: 7,
    price: 100,
    category: 'Pizzas',
    name: 'Mediteraean',
    image: 'images/pizza7.png',
    tagLine: 'A Taste of Mediterranean!',
    description: 'Transport yourself to the sunny shores of the Mediterranean with our Mediterranean Delight pizza. Topped with flavorful olives, feta cheese,'
        ' sun-dried tomatoes, spinach, and a drizzle of olive oil, its a mouthwatering experience you wont forget.',
  ),
  Product(
    productId: 8,
    price: 100,
    category: 'Pizzas',
    name: 'Veggie Delight',
    image: 'images/pizza8.png',
    tagLine: 'Natures Bounty in Every Slice!',
    description: 'Savor the goodness of nature with our Veggie Delight pizza. Bursting with colorful bell peppers,'
        ' fresh mushrooms, juicy tomatoes, onions, and a medley of garden-fresh vegetables, its a vegetarians dream come true.',
  ),
  Product(
    productId: 9,
    price: 100,
    category: 'Pizzas',
    name: 'Savory Delight',
    image: 'images/pizza9.png',
    tagLine: 'The Perfect Harmony!',
    description: 'Discover the perfect harmony of flavors with our Sweet and Savory Delight pizza. It combines the richness of caramelized onions, smoky bacon,'
        ' tangy barbecue sauce, and a touch of sweetness from pineapple, offering a unique and satisfying taste experience.',
  ),
  Product(
    productId: 10,
    price: 100,
    category: 'Pizzas',
    name: 'Mexican Fiesta',
    image: 'images/pizza10.png',
    tagLine: 'A Fiesta of Flavors!',
    description: 'Spice up your pizza game with our Mexican Fiesta. Loaded with seasoned ground beef, zesty salsa, jalapeños, black olives, '
        'and a generous amount of melted cheese, this pizza brings the vibrant and bold flavors of Mexican cuisine to your plate.',
  ),
  Product(
    productId: 11,
    price: 100,
    category: 'Pizzas',
    name: 'Truffle Mushroom',
    image: 'images/pizza11.png',
    tagLine: 'An Epicurean Adventure!',
    description: 'Indulge in the exquisite flavors of our Gourmet Truffle Mushroom pizza. Featuring a velvety truffle-infused cream sauce, a medley of sautéed mushrooms,'
        ' caramelized onions, and a sprinkle of fresh thyme, its a gourmet experience that will tantalize your taste buds.',
  ),
  Product(
    productId: 12,
    price: 100,
    category: 'Pizzas',
    name: 'Pesto Primavera',
    image: 'images/pizza12.png',
    tagLine: 'A Fresh Burst of Flavor!',
    description: 'Taste the freshness of spring with our Pesto Primavera pizza. Generously spread with vibrant basil pesto, '
        'and topped with a medley of seasonal vegetables like zucchini, mushrooms, artichokes, and roasted red peppers, its a garden-inspired delight.',
  )
];
List<Product> burger= [
  Product(
    productId: 13,
    price: 100,
    category: 'Burgers',
    name: 'Classic American',
    image: 'images/burger1.png',
    tagLine: 'A Taste of Tradition!',
    description: 'Sink your teeth into our Classic American burger. Made with a juicy beef patty, fresh lettuce, ripe tomatoes, onions, pickles, '
        'and a dollop of tangy ketchup and mustard, its a timeless favorite that captures the essence of American comfort food.',
  ),
  Product(
    productId: 14,
    price: 150,
    category: 'Burgers',
    name: 'Bacon Bliss',
    image: 'images/burger2.png',
    tagLine: 'Grilled Goodness with Twist!',
    description: 'Experience a burst of smoky flavors with our BBQ Bacon Bliss burger. '
        'Grilled to perfection, this burger is topped with crispy bacon, melted cheese, tangy barbecue sauce, and a hint of caramelized onions, creating a mouthwatering symphony of taste.',
  ),
  Product(
    productId: 15,
    price: 75,
    category: 'Burgers',
    name: 'Hawaiian Paradise',
    image: 'images/burger3.png',
    tagLine: 'Tropical Escape on a Bun!',
    description: 'Take a bite of paradise with our Hawaiian Paradise burger. Combining juicy grilled chicken or beef patty with sweet pineapple slices, '
        'crispy bacon, melted cheese, and a drizzle of tangy teriyaki sauce, its a tropical getaway in every bite.',
  ),
  Product(
    productId: 16,
    price: 220,
    category: 'Burgers',
    name: 'The Juicy Classic',
    image: 'images/burger4.png',
    tagLine: 'A Timeless Beef Experience!',
    description: 'Sink your teeth into The Juicy Classic, a burger that embodies the essence of beefy perfection. Grilled to juicy perfection, it features a flavorful beef patty, fresh lettuce, '
        'ripe tomatoes, onions, pickles, and a touch of savory sauce, offering a timeless and satisfying burger experience.',
  ),
  Product(
    productId: 17,
    price: 250,
    category: 'Burgers',
    name: 'The Bistro Burger',
    image: 'images/burger5.png',
    tagLine: 'Savor the Elegance!',
    description: 'Delight in the refined flavors of The Bistro Burger. Made with a tender beef patty, melted Gruyère cheese, caramelized onions, baby spinach, '
        'and a truffle aioli, this burger brings a touch of elegance and sophistication to your dining experience.',
  ),
  Product(
    productId: 18,
    price: 175,
    category: 'Burgers',
    name: 'The Fiery Diablo',
    image: 'images/burger6.png',
    tagLine: 'For Adventurous Heat Seekers!',
    description: 'Brace yourself for a fiery experience with The Fiery Diablo burger. Spiced with a fiery chipotle seasoning, this burger boasts a flame-grilled beef patty, '
        'melted Pepper Jack cheese, jalapeños, crispy bacon, and a smoky chipotle mayo that brings the heat to another level.',
  ),
  Product(
    productId: 19,
    price: 150,
    category: 'Burgers',
    name: 'The Bold Texan',
    image: 'images/burger7.png',
    tagLine: 'Bold Flavors of Wild West!',
    description: 'Take a journey to the Wild West with The Bold Texan burger. Featuring a robust beef patty, tangy barbecue sauce,'
        ' melted Pepper Jack cheese, crispy onion rings, and a kick of jalapeños, its a bold and spicy adventure for the taste buds.',
  ),
  Product(
    productId: 20,
    price: 300,
    category: 'Burgers',
    name: 'The Ultimate Umami',
    image: 'images/burger8.png',
    tagLine: 'Unleash the Fifth Taste!',
    description: 'Discover the umami explosion of The Ultimate Umami burger. Featuring a savory beef patty, umami-rich mushrooms, melted Swiss cheese, '
        'roasted garlic aioli, and a sprinkle of umami seasoning, this burger is a flavor sensation that satisfies the deepest cravings.',
  ),
  Product(
    productId: 21,
    price: 175,
    category: 'Burgers',
    name: 'The Smoke Deluxe',
    image: 'images/burger9.png',
    tagLine: 'Smoky Symphony of Flavors!',
    description: 'Experience the allure of smoky flavors with The Smokehouse Deluxe burger. This masterpiece features a perfectly grilled beef patty, smoky bacon,'
        ' melted smoked Gouda cheese, caramelized onions, and a hickory-smoked barbecue sauce that will transport your taste buds to barbecue bliss.',
  ),
  Product(
    productId: 22,
    price: 300,
    category: 'Burgers',
    name: 'The Truffle Burger',
    image: 'images/burger10.png',
    tagLine: 'An Extravaganza Beef!',
    description: 'Elevate your burger experience with The Gourmet Truffle Burger. Crafted with a prime beef patty,'
        ' a drizzle of truffle oil, creamy Brie cheese, caramelized onions, and arugula, its a luxurious and indulgent combination that will leave you craving more.',
  ),
  Product(
    productId: 23,
    price: 50,
    category: 'Burgers',
    name: 'The Shack Burger',
    image: 'images/burger11.png',
    tagLine: 'An Ultimate Burger!',
    description: 'Experience the allure of smoky flavors with The Smokehouse Deluxe burger. This masterpiece features a perfectly grilled beef patty, '
        'smoky bacon, melted smoked Gouda cheese, caramelized onions, and a hickory-smoked barbecue sauce that will transport your taste buds to barbecue bliss.',
  )
];
List<Product> dessert= [
  Product(
    productId: 24,
    price: 60,
    category: 'Desserts',
    name: 'Caramel Sundae',
    image: 'images/dessert1.png',
    tagLine: 'The Ultimate Indulgence!',
    description: 'Treat yourself to the ultimate indulgence with our Salted Caramel Brownie Sundae. Rich and fudgy brownies are topped with a generous scoop of creamy vanilla ice cream, '
        'drizzled with luscious salted caramel sauce, and sprinkled with a pinch of sea salt for a perfect balance of flavors.',
  ),
  Product(
    productId: 25,
    price: 120,
    category: 'Desserts',
    name: 'Blueberry Cheese',
    image: 'images/dessert2.png',
    tagLine: 'Mouthwatering cheese Cake!',
    description: 'Indulge in the richness of our Raspberry Chocolate Truffle dessert. '
        'Silky smooth chocolate ganache is infused with tangy raspberry puree, enveloped in a thin chocolate shell, creating a decadent and irresistible truffle experience.',
  ),
  Product(
    productId: 26,
    price: 100,
    category: 'Desserts',
    name: 'Strawberry Pastry',
    image: 'images/dessert3.png',
    tagLine: 'Best Pastry!',
    description: 'Delight in the bright and refreshing flavors of our Citrus Sunshine Tart. With a buttery crust, tangy lemon or orange curd filling, '
        'and a dusting of powdered sugar, this tart brings a burst of sunshine to your taste buds.',
  ),
  Product(
    productId: 27,
    price: 150,
    category: 'Desserts',
    name: 'Heavenly Chocolate',
    image: 'images/dessert4.png',
    tagLine: 'Indulge in Chocolate Bliss!',
    description: 'Experience a slice of chocolate heaven with our Heavenly Chocolate Delight. This decadent dessert features layers of rich chocolate cake, '
        'velvety chocolate mousse, and a glossy chocolate ganache, creating a truly divine and indulgent treat.',
  ),
  Product(productId: 28,
    price: 200,
    category: 'Desserts',
    name: 'Strawberry Cake',
    image: 'images/dessert5.png',
    tagLine: 'A Symphony Strawberry Delight!',
    description: 'Immerse yourself in the sweet and luscious symphony of our Strawberry Cake. '
        'Layers of moist vanilla cake are generously filled with fresh strawberry compote and frosted with velvety strawberry buttercream.',
  ),
  Product(productId: 29,
    price: 175,
    category: 'Desserts',
    name: 'Ice-cream Shake',
    image: 'images/dessert6.png',
    tagLine: 'Vanilla Shake!',
    description: 'Experience pure bliss with our Vanilla Bean Dream dessert. A creamy vanilla bean custard is nestled in a delicate pastry shell, '
        'topped with a sprinkle of vanilla bean seeds, delivering a luxurious and comforting treat for vanilla enthusiasts.',
  ),
  Product(productId: 30,
    price: 200,
    category: 'Desserts',
    name: 'Donuts',
    image: 'images/dessert7.png',
    tagLine: 'Different Donuts!',
    description: 'Different flavour donuts with cream',
  )
];
List<Product> breakFast= [
  Product(productId: 31,
    price: 70,
    category: 'BreakFast',
    name: 'Classic Benedict',
    image: 'images/breakfast1.png',
    tagLine: 'The Epitome of Breakfast!',
    description: 'Indulge in breakfast elegance with our Classic Eggs Benedict. A perfectly poached egg sits atop a toasted English muffin, layered with savory Canadian bacon and drizzled with creamy hollandaise sauce.'
        ' This timeless brunch favorite offers a harmonious blend',
  ),
  Product(productId: 32,
    price: 150,
    category: 'BreakFast',
    name: 'Sunrise Scramble',
    image: 'images/breakfast2.png',
    tagLine: 'Start Flavorful Twist!',
    description: 'DRise and shine with our Sunrise Scramble! This hearty breakfast dish features fluffy scrambled eggs cooked to perfection, '
        'accompanied by a delightful combination of sautéed vegetables, crispy bacon, melted cheese, and a sprinkle of fresh herbs. Its a delicious and energizing way to kick-start your morning.',
  ),
  Product(productId: 33,
    price: 100,
    category: 'BreakFast',
    name: 'French Delight',
    image: 'images/breakfast3.png',
    tagLine: 'A Decadent Morning Treat!',
    description: 'Treat yourself to the indulgent flavors of our French Toast Delight. Thick slices of brioche bread are dipped in a rich custard mixture, then cooked to golden perfection. Served with a dusting of powdered sugar, a side of fresh berries, and a drizzle of maple syrup, '
        'its a breakfast delight that combines the warmth of cinnamon, the sweetness of syrup, and the buttery goodness of French toast.',
  ),
  Product(productId: 34,
    price: 60,
    category: 'BreakFast',
    name: 'Best Fruits',
    image: 'images/breakfast4.png',
    tagLine: 'Collection of fruits!',
    description: 'Delight in the refreshing flavors of our Berry Bliss Parfait. Layers of creamy Greek yogurt are alternated with a medley of fresh berries, topped with crunchy granola and a drizzle of honey. '
        'Its a healthy and satisfying breakfast option that combines the sweetness of berries with the creaminess of yogurt for a blissful start to your day.',
  ),
  Product(productId: 35,
    price: 70,
    category: 'BreakFast',
    name: 'Energizing Bowl',
    image: 'images/breakfast5.png',
    tagLine: 'A Burst of Superfood Goodness!',
    description: 'Power up your morning with our Energizing Acai Bowl. A base of antioxidant-rich acai puree is topped with a colorful array of sliced fruits, crunchy granola, and a drizzle of honey. '
        'This vibrant and nourishing bowl not only tastes amazing but also provides a burst of energy to fuel your day.',
  )
];
List<Product> premiumBurger= [
  Product(productId: 36,
    price: 500,
    category: 'Premium Burgers',
    name: 'Prime Gourmet',
    image: 'images/premium_burger1.png',
    tagLine: 'Elevate Your Experience!',
    description: ' Indulge in the epitome of burger excellence with The Prime Gourmet. This premium burger features a succulent, '
        'handcrafted prime beef patty, aged cheddar cheese, caramelized onions, crispy bacon, and a tangy aioli sauce.',
  ),
  Product(productId: 37,
    price: 400,
    category: 'Premium Burgers',
    name: 'The Wagyu Legend',
    image: 'images/premium_burger2.png',
    tagLine: 'The Epitome of Burger Luxury!',
    description: 'Experience the pinnacle of burger luxury with The Wagyu Legend. Crafted with a mouthwatering Wagyu beef patty, adorned with melted blue cheese,'
        'caramelized onions, arugula, and a black truffle mayo, this burger is a true legend in its own right',
  ),
  Product(productId: 38,
    price: 550,
    category: 'Premium Burgers',
    name: 'The Angus Supreme',
    image: 'images/premium_burger3.png',
    tagLine: 'Quality Flavors!',
    description: 'Savor the uncompromising quality and flavor of The Black Angus Supreme. Made with a premium Black Angus beef patty, topped with aged Gouda cheese, caramelized onions, crispy bacon, and a smoky barbecue sauce, '
        'this burger offers a robust and hearty experience that showcases the finest ingredients and craftsmanship.',
  ),
  Product(productId: 39,
    price: 150,
    category: 'Premium Burgers',
    name: 'The Artisan',
    image: 'images/premium_burger4.png',
    tagLine: 'A Masterpiece of Flavors!',
    description: 'Delight in the artistry of flavors with The Artisan Blue burger. Featuring a perfectly seasoned beef patty, melted blue cheese, caramelized figs, baby arugula, and a balsamic glaze, '
        'this burger is a masterpiece that harmonizes savory, tangy, and sweet notes for a truly exquisite dining experience.',
  ),
  Product(productId: 40,
    price: 300,
    category: 'Premium Burgers',
    name: 'The Smoked BBQ',
    image: 'images/premium_burger5.png',
    tagLine: 'A Infused Sensation!',
    description: 'Immerse yourself in the smoky allure of The Smoked Bourbon BBQ burger. Featuring a grilled',
  ),
  Product(productId: 41,
    price: 350,
    category: 'Premium Burgers',
    name: 'The Foie Elegance',
    image: 'images/premium_burger6.png',
    tagLine: 'An Extravagant Delight!',
    description: 'Indulge in a gastronomic delight with The Foie Gras Elegance. This luxurious burger showcases a succulent beef patty topped with seared foie gras, caramelized shallots, baby spinach, and a blackberry compote, all nestled between a toasted brioche bun. '
        'Its a symphony of flavors that combines the richness of foie gras with the savory satisfaction of a premium beef burger.',
  ),
  Product(productId: 42,
    price: 600,
    category: 'Premium Burgers',
    name: 'The Delight Burger',
    image: 'images/premium_burger7.png',
    tagLine: 'A Burger Fit for Royalty!',
    description: 'Treat yourself like royalty with The Lobster Delight. This gourmet burger features a combination of succulent lobster meat and juicy beef, '
        'enhanced with a delicate lemon herb butter, fresh avocado slices, and a tangy citrus aioli',
  )
];
List<Product> salad= [
  Product(productId: 43,
    price: 60,
    category: 'Salads',
    name: 'Garden Salad',
    image: 'images/salad1.png',
    tagLine: 'Fresh from Garden!',
    description: 'Immerse yourself in the abundance of nature with our Garden Harvest Salad. Crisp mixed greens are tossed with an assortment of colorful vegetables, including cherry tomatoes, cucumbers, bell peppers, carrots, and radishes. Topped with your choice of protein and a zesty vinaigrette dressing, '
        'its a refreshing and nutritious salad that celebrates the bountiful flavors of the garden.',
  ),
  Product(productId: 44,
    price: 120,
    category: 'Salads',
    name: 'Medley Salad',
    image: 'images/salad1.png',
    tagLine: 'A Symphony of Flavors!',
    description: 'Take a culinary journey to the Mediterranean with our Mediterranean Medley Salad. Vibrant greens are adorned with tangy Kalamata olives, juicy cherry tomatoes, cucumber slices, red onions, crumbled feta cheese, and a sprinkle of oregano. Drizzled with a lemon-herb dressing, '
        'its a harmonious fusion of flavors that transports you to sun-drenched shores.',
  ),
  Product(productId:45,
    price: 180,
    category: 'Salads',
    name: 'Caesar Supreme Salad',
    image: 'images/salad3.png',
    tagLine: 'Indulge in a Classic!',
    description: 'Experience the timeless elegance of our Caesar Supreme Salad. Crisp romaine lettuce is tossed with traditional Caesar dressing, then topped with grilled chicken or shrimp, shaved Parmesan cheese, and homemade croutons. '
        'This salad delivers a perfect balance of creamy, tangy, and crunchy elements, making it a favorite among salad enthusiasts.',
  ),
  Product( productId: 46,
    price: 150,
    category: 'Salads',
    name: 'Asian Sesame Salad',
    image: 'images/salad4.png',
    tagLine: 'A Fusion of Asian Flavors!',
    description: 'Embark on a flavor-packed journey with our Asian Sesame Chicken Salad. Tender grilled chicken is paired with a colorful assortment of vegetables, such as shredded cabbage, carrots, bell peppers, and edamame. Tossed in a tangy sesame dressing and garnished with crunchy sesame seeds, '
        'this salad offers a delightful combination of textures and Asian-inspired flavors.',
  ),
  Product( productId: 47,
    price: 50,
    category: 'Salads',
    name: 'SouthFiesta Salad',
    image: 'images/salad5.png',
    tagLine: 'Spice up Your Salad!',
    description: 'Spice up your taste buds with our Southwest Fiesta Salad. A bed of crisp lettuce is topped with seasoned grilled chicken, black beans, corn, diced tomatoes, avocado slices, shredded cheese, and a tangy cilantro-lime dressing. '
        'Bursting with vibrant colors and bold flavors, this salad brings a taste of the Southwest to your plate.',
  ),
  Product( productId: 48,
    price: 80,
    category: 'Salads',
    name: 'Quinoa Power Salad',
    image: 'images/salad6.png',
    tagLine: 'Fuel Your Body Goodness!',
    description: 'Fuel your day with our Quinoa Power Salad. Nutrient-rich quinoa is mixed with an assortment of superfoods, such as kale, roasted sweet potatoes, chickpeas, dried cranberries, and toasted almonds. Tossed in a zesty citrus dressing, '
        'this salad not only satisfies your taste buds but also provides a hearty dose of energy and essential nutrients.',
  ),
  Product( productId: 49,
    price: 60,
    category: 'Salads',
    name: 'Caprese Salad',
    image: 'images/salad7.png',
    tagLine: 'A Taste of Elegance!',
    description: 'Indulge in the simplicity and elegance of our Caprese Bliss Salad. Ripe tomatoes, fresh mozzarella cheese, '
        'and fragrant basil leaves are layered together, drizzled with extra virgin olive oil, and finished with a sprinkle',
  ),
  Product( productId: 50,
    price: 60,
    category: 'Salads',
    name: 'Bliss Salad',
    image: 'images/salad8.png',
    tagLine: 'A Symphony of Sweet!',
    description: 'Delight in the refreshing and vibrant flavors of our Berry Bliss Salad. Mixed greens are combined with juicy strawberries, tangy blueberries, creamy goat cheese crumbles, candied pecans, and a drizzle of balsamic vinaigrette. This salad strikes a perfect balance between the sweetness of the berries, '
        'the creaminess of the cheese, and the crunch of the nuts, creating a harmonious and satisfying experience.',
  )
];
List<Product> shake= [
  Product(productId: 51,
    price: 50,
    category: 'Shakes',
    name: 'Choco Dream',
    image: 'images/shake2.png',
    tagLine: 'Indulge in Chocolate Bliss!',
    description: 'Dive into a world of chocolate bliss with our Choco Lovers Dream shake. '
        'Made with rich and creamy chocolate ice cream, drizzled with chocolate syrup, and topped with a mountain of whipped cream and chocolate shavings, its a dream come true for chocolate enthusiasts.',
  ),
  Product( productId: 52,
    price: 70,
    category: 'Shakes',
    name: 'Mango Blast',
    image: 'images/shake1.png',
    tagLine: 'Burst of Fruity Refreshment!',
    description: 'Experience a refreshing burst of fruity goodness with our Mango Blast shake. '
        'Blended with a medley of fresh berries, creamy vanilla ice cream, and a splash of berry syrup, this shake is a delightful and vibrant treat for your taste buds.',
  ),
  Product( productId: 53,
    price: 80,
    category: 'Shakes',
    name: 'Strawberry Shake',
    image: 'images/shake3.png',
    tagLine: 'An Irresistible Sensation!',
    description: ' Indulge in the sweet allure of our Delight shake. Featuring velvety caramel swirls, '
        'smooth vanilla ice cream, a drizzle of caramel sauce, and a crown of whipped cream, its a caramel lovers ultimate delight.',
  ),
  Product( productId: 54,
    price: 100,
    category: 'Shakes',
    name: 'Fruit Shake',
    image: 'images/shake4.png',
    tagLine: 'Best shake of Town!',
    description: 'Experience a refreshing burst of fruity goodness with our Berry Blast shake. Blended with a medley of fresh berries, '
        'creamy vanilla ice cream, and a splash of berry syrup, this shake is a delightful and vibrant treat for your taste buds.',
  ),
  Product( productId: 55,
    price: 60,
    category: 'Shakes',
    name: 'Avocado',
    image: 'images/shake5.png',
    tagLine: 'Best Avocado Shake',
    description: 'Experience a burst of cool and refreshing elation with our Minty Fresh shake. Combining creamy mint ice cream, decadent chocolate chips,'
        ' and a hint of mint syrup, its a revitalizing and indulgent treat that will leave you feeling refreshed.',
  ),
  Product( productId: 56,
    price: 70,
    category: 'Shakes',
    name: 'Green Shake',
    image: 'images/shake6.png',
    tagLine: 'Mint green shake!',
    description: 'Experience a refreshing burst of fruity goodness with our Berry Blast shake. Blended with a medley of fresh berries, creamy vanilla ice cream,'
        ' and a splash of berry syrup, this shake is a delightful and vibrant treat for your taste buds.',
  ),
];
List<Product> wrap=[
  Product(productId: 57,
    price: 100,
    category: 'Wraps',
    name: 'Garden Fresh Wrap',
    image: 'images/wrap1.png',
    tagLine: 'Bite of Nature!',
    description: 'Dive into the freshness of our Garden Fresh Veggie Wrap. Packed with a vibrant medley of crisp vegetables, including lettuce, tomatoes, cucumbers, bell peppers, and carrots, this wrap offers a burst of flavors and textures. Finished with a zesty herb dressing and wrapped in a soft tortilla, '
        'its the perfect choice for those seeking a nutritious and satisfying meal.',
  ),
  Product( productId: 58,
    price: 110,
    category: 'Wraps',
    name: 'South Fiesta Wrap',
    image: 'images/wrap2.png',
    tagLine: 'A Spicy Taste Buds!',
    description: 'Spice up your day with our Southwest Fiesta Wrap. This flavor-packed wrap combines tender grilled chicken, black beans, corn, avocado, salsa, and a touch of chipotle mayo for a zesty kick. '
        'Wrapped in a warm tortilla, its a fiesta of flavors that will transport you to the heart of Southwest cuisine.',
  ),
  Product( productId: 59,
    price: 150,
    category: 'Wraps',
    name: 'Delight Wrap',
    image: 'images/wrap3.png',
    tagLine: 'A Journey to the Flavors!',
    description: 'Embark on a culinary journey with our Mediterranean Delight Wrap. Bursting with the flavors of the Mediterranean, this wrap features grilled chicken or falafel, fresh greens, cherry tomatoes, cucumbers, feta cheese, olives, and a tangy tzatziki sauce. '
        'Experience the vibrant and aromatic tastes of this wrap that will transport you to sun-drenched shores.',
  ),
  Product( productId: 60,
    price: 200,
    category: 'Wraps',
    name: 'BBQ Chicken Wrap',
    image: 'images/wrap4.png',
    tagLine: 'Satisfy Your Tangy Twist!',
    description: 'Indulge in the smoky and tangy goodness of our BBQ Ranch Chicken Wrap. Tender grilled chicken is tossed in a rich barbecue sauce, paired with crispy bacon, cheddar cheese, lettuce, and a creamy ranch dressing. '
        'Wrapped in a soft tortilla, its a flavor-packed combination that will satisfy your cravings with every bite.',
  ),
  Product( productId: 61,
    price: 75,
    category: 'Wraps',
    name: 'Thai Tofu Wrap',
    image: 'images/wrap5.png',
    tagLine: 'A Fusion of Exotic Flavors!',
    description: 'Experience the tantalizing flavors of Thailand with our Thai Peanut Tofu Wrap. Marinated tofu is stir-fried with colorful vegetables, then drizzled with a creamy and aromatic Thai peanut sauce. Topped with fresh herbs and wrapped in a tortilla, '
        'its a fusion of sweet, spicy, and nutty flavors that will transport your taste buds to Southeast Asia.',
  ),
  Product( productId: 62,
    price: 175,
    category: 'Wraps',
    name: 'Chicken Wrap',
    image: 'images/wrap6.png',
    tagLine: 'A Tangy and Spicy Flavor!',
    description: 'Heat up your taste buds with our Buffalo Chicken Wrap. Tender chicken breast coated in tangy buffalo sauce is paired with crisp lettuce, tomatoes, red onions, and a cooling ranch dressing. '
        'This wrap delivers a perfect balance of spicy and creamy flavors, making it an irresistible choice for buffalo wing enthusiasts.',
  ),
  Product( productId: 63,
    price: 60,
    category: 'Wraps',
    name: 'Caesar Grilled Wrap',
    image: 'images/wrap7.png',
    tagLine: 'A Twist on a Favorite!',
    description: 'Elevate your taste buds with our Caesar Grilled Shrimp Wrap. Grilled shrimp are tossed in a creamy Caesar dressing, combined with crunchy romaine lettuce, Parmesan cheese, and croutons, all wrapped in a soft tortilla. '
        'This wrap offers a delightful twist on the classic Caesar salad, delivering a satisfying and flavorful experience.',
  ),
  Product( productId: 64,
    price: 125,
    category: 'Wraps',
    name: 'California Wrap',
    image: 'images/wrap8.png',
    tagLine: 'A Taste of West Coast!',
    description: 'Take a culinary trip to the West Coast with our California Turkey Wrap. Sliced turkey breast is layered with creamy avocado, crisp bacon, lettuce, tomatoes, and a zesty herb mayo. Wrapped in a tortilla, '
        'its a refreshing and satisfying choice that captures the essence of Californias vibrant and healthy cuisine.',
  ),
  Product( productId: 65,
    price: 100,
    category: 'Wraps',
    name: 'Greek Chicken Wrap',
    image: 'images/wrap9.png',
    tagLine: 'The Iconic Taste!',
    description: 'Immerse yourself in the iconic flavors of the Mediterranean with our Greek Chicken Gyro Wrap. Grilled chicken strips are seasoned with traditional Greek spices, topped with fresh tomatoes, cucumbers, red onions, feta cheese, '
        'and a tangy tzatziki sauce. Encased in a warm pita bread, its a wrap that brings the taste of Greece to your fingertips.',
  ),
];
List<Product> deal= [
  Product(productId: 66,
    price: 150,
    category: 'Deals',
    name: 'Summer Deal',
    image: 'images/deal1.png',
    tagLine: 'A deal for three!',
    description: 'A perfect deal for food lover',
  ),
  Product( productId: 67,
    price: 200,
    category: 'Deals',
    name: 'Family Deal',
    image: 'images/deal2.png',
    tagLine: 'A deal for family!',
    description: 'Best deal for family',
  ),
  Product( productId: 68,
    price: 150,
    category: 'Deals',
    name: 'Solo Deal',
    image: 'images/deal3.png',
    tagLine: 'A deal for one!',
    description: ' Need a satisfying meal during your busy workday? Look no further than our Lunch Express deal. Designed for those seeking a delicious and efficient dining option, this deal offers a selection of flavorful and well-balanced meals that can be enjoyed quickly without compromising on taste. With a range of options to choose from, '
        'our Lunch Express deal ensures you get a delicious and satisfying lunch without sacrificing precious time.',
  ),
  Product( productId: 69,
    price: 200,
    category: 'Deals',
    name: 'Date Night Delight',
    image: 'images/deal4.png',
    tagLine: 'Create Lasting Memories Together!',
    description: 'Ignite the romance with our Date Night Delight deal. '
        'Whether its a special anniversary or just a night dedicated to spending quality time with your significant other, this package offers a curated selection of gourmet dishes, decadent desserts, and a bottle of fine wine or champagne. Indulge in an unforgettable culinary experience, creating cherished memories that will last a lifetime.',
  ),
  Product( productId: 70,
    price: 250,
    category: 'Deals',
    name: 'Pizza Summer Deal',
    image: 'images/deal5.png',
    tagLine: 'A best deal for three!',
    description: 'Unwind and embrace the joy of our Happy Hour Happiness deal. Join us during our designated happy hours to enjoy specially crafted cocktails, discounted drinks, and a delectable selection of appetizers that perfectly complement your favorite libations. '
        'Relax, socialize, and let the good times roll with our Happy Hour Happiness deal.',
  ),
  Product( productId: 71,
    price: 200,
    category: 'Deals',
    name: 'Dinner for Two',
    image: 'images/deal6.png',
    tagLine: 'An Intimate Experience!',
    description: 'Share an intimate culinary experience with our Dinner for Two deal. '
        'Indulge in a specially curated menu that features delectable appetizers, mouthwater',
  ),
  Product( productId: 72,
    price: 150,
    category: 'Deals',
    name: 'Early Bird Breakfast',
    image: 'images/deal7.png',
    tagLine: 'Rise with Hearty Start!',
    description: 'Start your day on a high note with our Early Bird Breakfast deal. Designed for early risers and breakfast lovers, this deal offers a scrumptious selection of classic breakfast favorites, from fluffy omelettes to crispy bacon, accompanied by freshly squeezed juices and aromatic coffee.'
        'Embrace the morning with a hearty breakfast that fuels your day ahead.',
  ),
  Product( productId: 73,
    price: 150,
    category: 'Deals',
    name: 'Solo Deal 2',
    image: 'images/deal8.png',
    tagLine: 'A best deal for dinner!',
    description: 'Attention, students! Our Student Special deal is designed with you in mind. '
        'Enjoy a discounted meal that combines delicious flavors and nourishing options to keep you fueled during your study sessions. ',
  ),
  Product( productId: 74,
    price: 500,
    category: 'Deals',
    name: 'Family Feast',
    image: 'images/deal9.png',
    tagLine: 'Satisfy the Whole Family!',
    description: 'Enjoy quality time with your loved ones while indulging in our Family Feast deal. This mouthwatering package includes a variety of our most popular dishes, such as flavorful entrees, sides, and desserts, all carefully curated to please every member of the family.'
        'Whether youre hosting a special occasion or simply want to treat your loved ones to a delicious meal, our Family Feast is the perfect choice for a memorable dining experience.',
  ),
];

//ID 1-12 pizza                 |Total: 12
//ID 13-23 burger               |Total: 11
//ID 24-30 dessert              |Total: 7
//ID 31-35 breakfast            |Total: 5
//ID 36-42 premiumBurger       |Total: 7
//ID 43-50 salad                |Total: 8
//ID 51-56 shake                |Total: 6
//ID 57-65 wrap                 |Total: 9
//ID 66-74 deals                |Total: 9

Product categoryBurger= Product(
  productId: 75,
  price: 80,
  category: 'Burgers',
  name: 'Burgers',
  image: 'images/burger8.png',
  tagLine: 'Dummy Tagline!',
  description: 'Dummy Description .............................'
      '.............................................................. Dummy',
);
Product categoryPizza= Product(
  price: 80,
  category: 'Pizzas',
  productId: 76,
  name: 'Pizzas',
  image: 'images/pizza4.png',
  tagLine: 'Dummy Tagline!',
  description: 'Dummy Description .............................'
      '.............................................................. Dummy',
);
Product categoryDeals= Product(
  price: 150,
  category: 'Deals',
  productId: 77,
  name: 'Deals',
  image: 'images/deal2.png',
  tagLine: 'Dummy Tagline!',
  description: 'Dummy Description .............................'
      '.............................................................. Dummy',
);
Product categoryDessert= Product(
  price: 80,
  category: 'Desserts',
  productId: 78,
  name: 'Desserts',
  image: 'images/dessert1.png',
  tagLine: 'Dummy Tagline!',
  description: 'Dummy Description .............................'
      '.............................................................. Dummy',
);
Product categoryBreakFast= Product(
  productId: 79,
  price: 80,
  category: 'BreakFast',
  name: 'BreakFast',
  image: 'images/breakfast3.png',
  tagLine: 'Dummy Tagline!',
  description: 'Dummy Description .............................'
      '.............................................................. Dummy',
);
Product categoryPremiumBurgers= Product(
  productId: 80,
  price: 80,
  category: 'Premium Burgers',
  name: 'Premium Burgers',
  image: 'images/premium_burger1.png',
  tagLine: 'Dummy Tagline!',
  description: 'Dummy Description .............................'
      '.............................................................. Dummy',
);
Product categorySalads= Product(
  productId: 81,
  price: 80,
  category: 'Salads',
  name: 'Salads',
  image: 'images/salad1.png',
  tagLine: 'Dummy Tagline!',
  description: 'Dummy Description .............................'
      '.............................................................. Dummy',
);
Product categoryShakes= Product(
  productId: 82,
  price: 80,
  category: 'Shakes',
  name: 'Shakes',
  image: 'images/shake4.png',
  tagLine: 'Dummy Tagline!',
  description: 'Dummy Description .............................'
      '.............................................................. Dummy',
);
Product categoryWraps= Product(
  productId: 83,
  price: 80,
  category: 'Wraps',
  name: 'Wraps',
  image: 'images/wrap8.png',
  tagLine: 'Dummy Tagline!',
  description: 'Dummy Description .............................'
      '.............................................................. Dummy',
);
