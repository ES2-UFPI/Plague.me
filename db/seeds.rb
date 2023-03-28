# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(email: "admin@admin.com", password: "pladmin.me", password_confirmation: "pladmin.me", nickname: "admin", admin: true)
User.create!(email: "thiago@brito.com", password: "senhasenha", password_confirmation: "senhasenha", nickname: "thiago", admin: false)  