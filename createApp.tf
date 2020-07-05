provider "heroku" {
  version = "~> 2.0"
  email   = var.email
  api_key = var.api_key
}
resource "heroku_app" "mypizza" {
  name   = "my-pizza-mostelacamargo"
  region = "us"

  config_vars = {
    NOMENEGOCIO    = "Pizzaria do Joao"
    DATABASE_ID    = "1c0fb0bd-5f0d-4274-b411-1e7e0e1e8e91"
    DATABASE_TOKEN = "3804359e-6fe9-4831-834a-a3ec271fa170"
  }
}

# Build code & release to the app

resource "heroku_build" "mypizza" {
  app = heroku_app.mypizza.id
  source = {
    path = "./src"
  }
}

output "mypizza_app_url" {
  value = "https://heroku_app.mypizza.name.herokuapp.com/produto"
}

output "saida_do_git" {
  value = "git clone heroku_app.mypizza.git_url"
}