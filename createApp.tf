provider "heroku" {
  version = "~> 2.0"
  email   = "joao-mostela@hotmail.com"
  api_key = "ca1d2283-6668-463f-aa25-093df3fa9f40"
}
# USADO PARA SABER SE EXISTE UMA APLICAÇAO COM O MESMO NOME
#data "heroku_app" "default" {
#  name   = "my-pizza-mostelacamargo"
#}
resource "heroku_app" "mypizza" {
  name   = "my-pizza-mostelacamargo"
  region = "us"

  config_vars = {
    NOMENEGOCIO= "Pizzaria do Joao"
    DATABASE_ID="85cab10f-aff1-4da2-b6fb-c787aee1b563"
    DATABASE_TOKEN="c02bde16-38d0-42e8-9f11-706c8675359c"
  }
}

# Build code & release to the app

resource "heroku_build" "mypizza" {
  app = "{heroku_app.mypizza.id}"
  source = {
    path = "./"
  }
}

output "mypizza_app_url" {
  value = "https://${heroku_app.mypizza.name}.herokuapp.com/produto"
}

output "saida_do_git"{
  value = "git clone ${heroku_app.mypizza.git_url}"
}