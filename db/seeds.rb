# frozen_string_literal: true

Dish.destroy_all
Category.destroy_all
Menu.destroy_all
DishMenu.destroy_all
PriceType.destroy_all
User.destroy_all

User.create(email: 'admin@cafe.mx', password: 'admin666', role: 1)

categories = Category.create!([{ name: 'Pizza' },
                               { name: 'Salad' },
                               { name: 'Soup' }])

price_types = PriceType.create([{ measurement: 'Item', portion: 1.0 },
                                { measurement: 'Weigh', portion: 0.100 }])

peperoni = Dish.create(
  name: 'Peperoni1',
  price: 99,
  category_id: categories.first.id,
  price_type_id: price_types.first.id
)

margarita = Dish.create(
  name: 'Margarita1',
  price: 959,
  category_id: categories.first.id,
  price_type_id: price_types.first.id
)

Menu.create(date: '10-10-2010',
            dish_menus_attributes: [
              { dish_id: margarita.id,
                included: 1,
                price: 111 },
              { dish_id: peperoni.id,
                included: 1,
                price: 222 }
            ])
