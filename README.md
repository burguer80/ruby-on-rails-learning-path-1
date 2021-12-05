# Action Plan

- Add Pokemons Controller `/pokemons`
  - `/pokemons` all records
  - `/pokemons/:id` record details
- Add MyPokemons Controller `/my-pokemons` [Rails Docs](https://guides.rubyonrails.org/association_basics.html#the-has-and-belongs-to-many-association)
  - `/my-pokemons` Add to user favorites
  - Display user favorites records
   ```
  # User.rb
  has_and_belongs_to_many :pokemons
    
  # Pokemon.rb
  has_and_belongs_to_many :users
  ```
