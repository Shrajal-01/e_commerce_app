// class AppUrl {
//   static const storageBase =
//       'https://firebasestorage.googleapis.com/v0/b/ecommerce-0101.appspot.com/o/';
//   static const categoryImage = '${storageBase}Categories%2FImages%2F';
//   static const productImage = '${storageBase}Products%2FImages%2F';
//   static const alt = '?alt=media';
// }

class AppUrl {
  static const storageBase =
      'https://firebasestorage.googleapis.com/v0/b/ecommerce-4f907.firebasestorage.app/o/';

  // Adjust based on actual folder structure (if "Images" is a subfolder, include it)
  static const categoryImage =
      '${storageBase}Categories%2F'; // or Categories%2FImages%2F if you have that structure
  static const productImage = '${storageBase}Products%2F';

  static const alt = '?alt=media';
}
