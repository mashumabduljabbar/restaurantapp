import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/models/restaurant.dart';
import 'package:restaurantapp/providers/restaurant_provider.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantDetailScreen({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 6 / 4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        restaurant.pictureId,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: FloatingActionButton(
                      mini: true,
                      backgroundColor: Colors.grey,
                      onPressed: () {
                        restaurantProvider.toggleFavorite(restaurant.id);
                      },
                      child: Icon(
                        restaurantProvider.isFavorite(restaurant.id)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                restaurant.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_pin,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 4),
                  Text(
                    restaurant.city,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  SizedBox(width: 4),
                  Text(
                    restaurant.rating.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                restaurant.description,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 16),
              Text(
                'Menus',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Foods:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: restaurant.menus.foods.map((food) {
                  return Chip(
                    label: Text(
                      food.name,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    backgroundColor: Colors.lightBlueAccent,
                  );
                }).toList(),
              ),
              SizedBox(height: 8),
              Text(
                'Drinks:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: restaurant.menus.drinks.map((drink) {
                  return Chip(
                    label: Text(
                      drink.name,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    backgroundColor: Colors.lightBlueAccent,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
