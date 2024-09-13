from flask import Flask, request
from flask_restful import reqparse, abort, Api, Resource

app = Flask(__name__)
api = Api(app)

MENUS = {
"menu": 
[
    {
    "id": 1,
    "categoryId": 14,
    "categoryName": "Frozen Food",
    "sku": "MHZVTK",
    "name": "Chicken Nugget",
    "description": "Delicious chicken nuggets",
    "weight": 500,
    "width": 5,
    "length": 5,
    "height": 5,
    "image": "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b",
    "price": 27000
  },
  {
    "id": 2,
    "categoryId": 14,
    "categoryName": "Frozen Food",
    "sku": "CNSMKR",
    "name": "Fish Fillet",
    "description": "Fresh and frozen fish fillet",
    "weight": 400,
    "width": 4,
    "length": 5,
    "height": 3,
    "image": "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b",
    "price": 32000
  },
  {
    "id": 3,
    "categoryId": 14,
    "categoryName": "Frozen Food",
    "sku": "PLKWNT",
    "name": "French Fries",
    "description": "Crispy frozen french fries",
    "weight": 600,
    "width": 7,
    "length": 6,
    "height": 4,
    "image": "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b",
    "price": 22000
  },
  {
    "id": 4,
    "categoryId": 14,
    "categoryName": "Frozen Food",
    "sku": "KTWNCJ",
    "name": "Beef Patty",
    "description": "Juicy beef patty for burgers",
    "weight": 500,
    "width": 6,
    "length": 6,
    "height": 2,
    "image": "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b",
    "price": 45000
  },
  {
    "id": 5,
    "categoryId": 14,
    "categoryName": "Frozen Food",
    "sku": "FGHJWR",
    "name": "Vegetable Spring Rolls",
    "description": "Frozen vegetable spring rolls",
    "weight": 350,
    "width": 5,
    "length": 5,
    "height": 3,
    "image": "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b",
    "price": 18000
  },
  {
    "id": 6,
    "categoryId": 15,
    "categoryName": "Beverages",
    "sku": "FRSRHD",
    "name": "Coca Cola",
    "description": "Refreshing carbonated drink",
    "weight": 350,
    "width": 3,
    "length": 3,
    "height": 10,
    "image": "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b",
    "price": 6000
  },
  {
    "id": 7,
    "categoryId": 15,
    "categoryName": "Beverages",
    "sku": "LTMHRD",
    "name": "Lemon Tea",
    "description": "Refreshing lemon-flavored tea",
    "weight": 250,
    "width": 3,
    "length": 3,
    "height": 10,
    "image": "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b",
    "price": 8000
  },
  {
    "id": 8,
    "categoryId": 15,
    "categoryName": "Beverages",
    "sku": "MNTRHD",
    "name": "Orange Juice",
    "description": "Freshly squeezed orange juice",
    "weight": 400,
    "width": 4,
    "length": 4,
    "height": 12,
    "image": "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b",
    "price": 12000
  },
  {
    "id": 9,
    "categoryId": 15,
    "categoryName": "Beverages",
    "sku": "WTBHTC",
    "name": "Mineral Water",
    "description": "Clean and pure mineral water",
    "weight": 500,
    "width": 3,
    "length": 3,
    "height": 12,
    "image": "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b",
    "price": 3000
  },
  {
    "id": 10,
    "categoryId": 15,
    "categoryName": "Beverages",
    "sku": "GRNNCT",
    "name": "Green Tea",
    "description": "Soothing green tea",
    "weight": 350,
    "width": 3,
    "length": 3,
    "height": 10,
    "image": "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b",
    "price": 7000
  },
  {
    "id": 11,
    "categoryId": 16,
    "categoryName": "Snacks",
    "sku": "CHPSBR",
    "name": "Potato Chips",
    "description": "Crispy salted potato chips",
    "weight": 100,
    "width": 4,
    "length": 4,
    "height": 12,
    "image": "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b",
    "price": 15000
  },
  {
    "id": 12,
    "categoryId": 16,
    "categoryName": "Snacks",
    "sku": "CHCKCR",
    "name": "Chicken Crackers",
    "description": "Tasty chicken-flavored crackers",
    "weight": 200,
    "width": 4,
    "length": 5,
    "height": 12,
    "image": "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b",
    "price": 12000
  },
  {
    "id": 13,
    "categoryId": 16,
    "categoryName": "Snacks",
    "sku": "PNTBRF",
    "name": "Peanut Butter Cookies",
    "description": "Delicious peanut butter cookies",
    "weight": 250,
    "width": 5,
    "length": 5,
    "height": 10,
    "image": "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b",
    "price": 18000
  },
  {
    "id": 14,
    "categoryId": 16,
    "categoryName": "Snacks",
    "sku": "BTRPPR",
    "name": "Butter Popcorn",
    "description": "Savory butter-flavored popcorn",
    "weight": 300,
    "width": 5,
    "length": 5,
    "height": 10,
    "image": "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b",
    "price": 20000
  },
  {
    "id": 15,
    "categoryId": 16,
    "categoryName": "Snacks",
    "sku": "CHCKFRS",
    "name": "Cheese Fries",
    "description": "Crispy fries with cheese flavor",
    "weight": 150,
    "width": 4,
    "length": 4,
    "height": 10,
    "image": "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b",
    "price": 16000
  },
  {
    "id": 16,
    "categoryId": 17,
    "categoryName": "Dairy Products",
    "sku": "MLKCFD",
    "name": "Full Cream Milk",
    "description": "Rich and creamy full cream milk",
    "weight": 1000,
    "width": 6,
    "length": 6,
    "height": 12,
    "image": "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b",
    "price": 22000
  },
  {
    "id": 17,
    "categoryId": 17,
    "categoryName": "Dairy Products",
    "sku": "CHSMDC",
    "name": "Cheddar Cheese",
    "description": "Soft and creamy cheddar cheese",
    "weight": 200,
    "width": 5,
    "length": 5,
    "height": 4,
    "image": "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b",
    "price": 18000
  },
  {
    "id": 18,
    "categoryId": 17,
    "categoryName": "Dairy Products",
    "sku": "YGRTPD",
    "name": "Yogurt",
    "description": "Delicious probiotic yogurt",
    "weight": 500,
    "width": 4,
    "length": 4,
    "height": 8,
    "image": "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b",
    "price": 14000
  },
  {
    "id": 19,
    "categoryId": 17,
    "categoryName": "Dairy Products",
    "sku": "MLKPWR",
    "name": "Milk Powder",
    "description": "High quality milk powder",
    "weight": 1000,
    "width": 6,
    "length": 6,
    "height": 10,
    "image": "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b",
    "price": 25000
  },
  {
    "id": 20,
    "categoryId": 17,
    "categoryName": "Dairy Products",
    "sku": "CRMBTD",
    "name": "Cream Butter",
    "description": "Rich cream butter for baking",
    "weight": 500,
    "width": 5,
    "length": 5,
    "height": 5,
    "image": "https://cf.shopee.co.id/file/7cb930d1bd183a435f4fb3e5cc4a896b",
    "price": 30000
  }
  ]

}


def abort_if_menu_doesnt_exist(menu_id):
    if menu_id not in MENUS :
        abort(404, message="Menu {} doesn't exist".format(menu_id))

parser = reqparse.RequestParser()
parser.add_argument('task')


# Menu
# shows a single menu item and lets you delete a menu item
class Menu(Resource):
    def get(self, menu_id):
        abort_if_menu_doesnt_exist(menu_id)
        return MENUS[menu_id]

    def delete(self, menu_id):
        abort_if_menu_doesnt_exist(menu_id)
        del MENUS[menu_id]
        return '', 204

    def put(self, menu_id):
        args = parser.parse_args()
        task = {'task': args['task']}
        MENUS[menu_id] = task
        return task, 201


# MenuList
# shows a list of all menus, and lets you POST to add new tasks
class MenuList(Resource):
    def get(self):
        # Get pagination arguments (default page=1, per_page=10)
        page = int(request.args.get('page', 1))
        per_page = int(request.args.get('per_page', 10))

        # Get total menus count
        total_items = len(MENUS['menu'])

        # Calculate start and end index for pagination
        start = (page - 1) * per_page
        end = start + per_page

        # Paginate the menu list
        paginated_menus = MENUS['menu'][start:end]

        # Build response with pagination metadata
        response = {
            'page': page,
            'per_page': per_page,
            'total_items': total_items,
            'total_pages': (total_items + per_page - 1) // per_page,  # To round up the pages
            'data': paginated_menus
        }

        return response

    def post(self):
        # Get the new menu data from the request body
        new_menu = request.json

        # Validate required fields
        required_fields = ["categoryId", "categoryName", "sku", "name", "description", "weight", "width", "length", "height", "image", "price"]
        for field in required_fields:
            if field not in new_menu:
                return {"error": f"{field} is required."}, 400

        # Generate a new unique ID for the menu
        new_id = len(MENUS['menu']) + 1
        new_menu["id"] = new_id

        # Add the new menu item to the MENUS dictionary
        MENUS['menu'].append(new_menu)

        return {"message": "Menu item added successfully", "data": new_menu}, 201


##
## Actually setup the Api resource routing here
##
api.add_resource(MenuList, '/menus')
api.add_resource(Menu, '/menus/<menu_id>')


if __name__ == '__main__':
    app.run(debug=True)
