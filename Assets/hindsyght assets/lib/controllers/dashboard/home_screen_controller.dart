import 'package:micatalogs/controllers/base_controller.dart';

class HomeScreenController extends BaseController {
  int index = 0;
  String filterString = 'Last 7 Days';
  List productsList = [
    {
      'name': 'T-Shirt',
      'image': 'https://i.redd.it/1fr4mzl6h6o41.jpg',
      'view': '1254'
    },
    {
      'name': 'Fit Shirt',
      'image':
          'https://images-na.ssl-images-amazon.com/images/I/410el0B7L6L.jpg',
      'view': '1135'
    },
    {
      'name': 'Men Watch',
      'image': 'https://i.redd.it/1fr4mzl6h6o41.jpg',
      'view': '837'
    },
    {
      'name': 'T-Shirt',
      'image': 'https://i.redd.it/1fr4mzl6h6o41.jpg',
      'view': '822'
    },
    {
      'name': 'Fit Shirt',
      'image':
          'https://images-na.ssl-images-amazon.com/images/I/410el0B7L6L.jpg',
      'view': '689'
    },
    {
      'name': 'Men Watch',
      'image': 'https://i.redd.it/1fr4mzl6h6o41.jpg',
      'view': '543'
    },
    {
      'name': 'T-Shirt',
      'image': 'https://i.redd.it/1fr4mzl6h6o41.jpg',
      'view': '504'
    },
    {
      'name': 'Fit Shirt',
      'image':
          'https://images-na.ssl-images-amazon.com/images/I/410el0B7L6L.jpg',
      'view': '498'
    },
    {
      'name': 'Men Watch',
      'image': 'https://i.redd.it/1fr4mzl6h6o41.jpg',
      'view': '460'
    },
    {
      'name': 'T-Shirt',
      'image': 'https://i.redd.it/1fr4mzl6h6o41.jpg',
      'view': '212'
    }
  ];
}
