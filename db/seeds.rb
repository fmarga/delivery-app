admin = Admin.create!(email: 'admin@sistemadefrete.com.br', password: 'password')

# Entregas Já
entregas_ja = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')

PriceSetting.create!(min_volume: 1, max_volume: 5, min_weight: 1, max_weight: 10, distance_value: 50, shipping_company: entregas_ja)
PriceSetting.create!(min_volume: 1, max_volume: 5, min_weight: 10, max_weight: 50, distance_value: 80, shipping_company: entregas_ja)
PriceSetting.create!(min_volume: 6, max_volume: 10, min_weight: 11, max_weight: 30, distance_value: 80, shipping_company: entregas_ja)

DeliveryTime.create!(min_distance: 1, max_distance: 100, time_delivery: 2, shipping_company: entregas_ja)
DeliveryTime.create!(min_distance: 101, max_distance: 500, time_delivery: 4, shipping_company: entregas_ja)
DeliveryTime.create!(min_distance: 1, max_distance: 200, time_delivery: 3, shipping_company: entregas_ja)

Vehicle.create!(license_plate: 'LSN4I49', brand: 'Renault', model: 'Kangoo', fabrication_year: 2018, capacity: 700_000, shipping_company: entregas_ja)
Vehicle.create!(license_plate: 'BDB1B52', brand: 'Mercedes-Benz', model: 'Sprinter Street', fabrication_year: 2021, capacity: 1_825_000, shipping_company: entregas_ja)

# Entregas Now!
entregas_now = ShippingCompany.create!(corporate_name: 'Serviços de Entregas LTDA', brand_name: 'Entregas Now!', registration_number: '13053544000163', email_domain: 'entregasnow.com.br', address: 'Av do Transporte, 20', city: 'Porto Alegre', state: 'RS', postal_code: '96493-570')

PriceSetting.create!(min_volume: 1, max_volume: 5, min_weight: 1, max_weight: 10, distance_value: 80, shipping_company: entregas_now)
PriceSetting.create!(min_volume: 1, max_volume: 15, min_weight: 1, max_weight: 20, distance_value: 100, shipping_company: entregas_now)
PriceSetting.create!(min_volume: 6, max_volume: 15, min_weight: 11, max_weight: 20, distance_value: 100, shipping_company: entregas_now)

DeliveryTime.create!(min_distance: 1, max_distance: 200, time_delivery: 3, shipping_company: entregas_now)
DeliveryTime.create!(min_distance: 201, max_distance: 400, time_delivery: 6, shipping_company: entregas_now)

Vehicle.create!(license_plate: 'LUN4I49', brand: 'Renault', model: 'Kangoo', fabrication_year: 2015, capacity: 700_000, shipping_company: entregas_now)
Vehicle.create!(license_plate: 'BOB1B52', brand: 'Mercedes-Benz', model: 'Sprinter Street', fabrication_year: 2018, capacity: 1_825_000, shipping_company: entregas_now)


# Entregas OnFire!
on_fire = ShippingCompany.create!(corporate_name: 'Serviços de Outras Entregas LTDA', brand_name: 'Entregas onFire!', registration_number: '13053544000863', email_domain: 'entregasonfire.com.br', address: 'Av do Transporte, 700', city: 'Porto Alegre', state: 'RS', postal_code: '96983-570')

PriceSetting.create!(min_volume: 1, max_volume: 5, min_weight: 1, max_weight: 10, distance_value: 50, shipping_company: on_fire)
PriceSetting.create!(min_volume: 6, max_volume: 15, min_weight: 11, max_weight: 20, distance_value: 80, shipping_company: on_fire)

DeliveryTime.create!(min_distance: 1, max_distance: 100, time_delivery: 2, shipping_company: on_fire)
DeliveryTime.create!(min_distance: 101, max_distance: 400, time_delivery: 6, shipping_company: on_fire)

Vehicle.create!(license_plate: 'LUN8I49', brand: 'Renault', model: 'Kangoo', fabrication_year: 2015, capacity: 700_000, shipping_company: on_fire)
Vehicle.create!(license_plate: 'BOB1C52', brand: 'Mercedes-Benz', model: 'Sprinter Street', fabrication_year: 2018, capacity: 1_825_000, shipping_company: on_fire)

# Usuário da transportadora Entregas Já
user = User.create!(email: 'user@entregasja.com.br', password: 'password')