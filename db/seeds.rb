# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ConfessionQueue.destroy_all

c = ConfessionQueue.new(city: 'Natal',
                        date: Date.today,
                        start_time: DateTime.now + 30.minutes,
                        end_time: DateTime.now + 1.hour + 30.minutes,
                        place: 'Paróquia de Sant\'Ana',
                        street: 'R. Des. José Gomes da Costa',
                        state: 'RN',
                        postcode: '59082-140',
                        notes: 'O atendimento das confissões pode demorar um pouco devido ao terço dos homens, marcado para o mesmo horário, nessa semana excepcionalmente')
c.save!
c = ConfessionQueue.new(city: 'Fortaleza',
                        date: Date.today + 1.day,
                        start_time: DateTime.now + 1.day + 30.minutes,
                        end_time: DateTime.now + 1.day + 2.hours,
                        place: 'Paróquia Nossa Senhora de Nazaré',
                        street: 'R. André Chaves, 165',
                        state: 'CE',
                        postcode: '60416-135',
                        notes: 'Recomendamos que traga seu exame de consciência anotado, para que não hajam omissões por esquecimento')
c.save!
