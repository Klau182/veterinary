# Veterinary App

#### Empezando el proyecto Veterinary

```bash
rails new veterinary -d postgresql
```

#### Creando el scaffold con los siguientes campos

```bash
rails g scaffold pet name specie weight:integer height:integer
```

Luego realizamos la creacion y migracion de la base de
datos con los siguientes comandos

```bash
rails db:create
rails db:migrate
```

#### Agregando la gema devise en el archivo gemfile

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

Realizando la relacion entre tabla pet y usuario para 
generar la clave foranea

```ruby
rails g migration  addUserToPet user:references
```
IMPORTANTE

antes de realizar la migracion en el archivo de migracion debe estar asi:

```ruby
 def change
    add_reference :pets, :user, foreign_key: true
  end
```

#### Generamos las vistas de devise

```bash
rails generate devise:views
```

#### Implementacion icono en la barra de navegacion

descargamos el icono del siguiente link, la descargamos en la carpeta de imagenes

https://icons8.com/icons/set/shell

En el archivo application de la carpeta Layouts en la seccion header anexamos la ruta del icono descargado

<%= favicon_link_tag('nombre_icono.png')%>

#### Validacion campos peso y altura de mascota no sean numeros negativos

En el controlador de mascotas colocamos una condicional, si se ingresan numeros negativos se devolvera a la vista de editar dicha mascota

```ruby
def validate_field_number
  pet_params = params[:pet]
  weight = pet_params[:weight].to_i
  height = pet_params[:height].to_i
        
  if weight < 0 || height < 0
    redirect_to pet_path, alert: "El peso y la altura deben ser mayores o iguales a cero."
  end
end
 ```

 En los before_action llamamos al metodo que creamos para que la estatura y peso no sean numeros negativos


```ruby
 before_action :validate_field_number, only: %i[ create update ]
```

#### validacion del email que contenga un @ y un .com

```ruby
 validates :email, presence: true, uniqueness: true, format: { with: 
    /\A[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}\z/i, message: ": Por favor introduzca un email válido"}
    ```