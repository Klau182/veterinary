# Veterinary

Empezando el proyecto Veterinary

```bash
rails new veterinary -d postgresql
```

Creando el scaffold con los siguientes campos

```bash
rails g scaffold pet name specie weight:integer height:integer
```

Luego realizamos la creacion y migracion de la base de
datos con los siguientes comandos

```bash
rails db:create
rails db:migrate
```

Agregando la gema devise en el archivo gemfile

```ruby
# Gem authentication devise
gem "devise"
```
```ruby
rails g devise:install
```
```bash
rails g devise user 
```

realizando la relacion entre tabla pet y usuario para 
generar la clave foranea

```ruby
rails g migration  addUserToPet user:references
```
""IMPORTANTE

antes de realizar la migracion en el archivo de migracion debe estar asi:

```ruby
 def change
    add_reference :pets, :user, foreign_key: true
  end
```


