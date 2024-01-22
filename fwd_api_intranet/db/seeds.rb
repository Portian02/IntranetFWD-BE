# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).


# User.create(identification: "604360071", username: "AdminSu", number: "87690098", email: "admin@gmail.com", borndate:"02/08/1992", password:"123456", password_confirmation:"123456",type_user_id:"3", role: "admin" )

justifications =[
{name: "late unjustified", description: "this is a late unjustified"},
{name: "late justified", description: "this is a late justified"},
{name: "absence unjustified", description: "this is a absence unjustified"},
{name: "absence justified", description: "this is a absence justified"},
{name: "early departure unjustified", description: "this is a early departure unjustified"},
{name: "early departure justified", description: "this is a early departure justified"},

]

JustificationType.create(justifications)
