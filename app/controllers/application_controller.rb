class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # add routes
  get'/bakeries' do
    "Hello World"
    # get all the bakeries from the database 
    bakeries = Bakery.all
    # send them back as a JSON array 
    bakeries.to_json
  end

  get '/bakeries/:id' do
 # look up the bakery in the database using its ID
    bakery = Bakery.find(params[:id])
    # return as JSON arr w baked goods nested arr
    # include baked goods as a nested arr

    bakery.to_json(include: :baked_goods)
  end


  get '/baked_goods/by_price' do
    # get baked goods, sort by price
    baked_goods = BakedGood.all.order(:price).reverse
    # return as JSON arr 
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    # get baked goods, sort by price, get most expensive baked good
    most_expensive_baked_good = BakedGood.all.order(:price).last
    # return as JSON arr 
    most_expensive_baked_good.to_json
  end

end
