# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create([
                    {
                        title: 'Books/HQ/Manga',
                        icon: 'fa-book',
                        active: true
                    },
                    {
                        icon: 'fa-film',
                        title: 'Movies',
                        active: true
                    },
                    {
                        icon: 'fa-cc',
                        title: 'TV series/Cartoons/Animes',
                        active: true
                    },
                    {
                        icon: 'fa-youtube-play',
                        title: 'Videos',
                        active: true
                    },
                    {
                        icon: 'fa-music',
                        title: 'Musics',
                        active: true
                    },
                    {
                        icon: 'fa-microphone',
                        title: 'Podcasts',
                        active: true
                    },
                    {
                        icon: 'fa-gamepad',
                        title: 'Games',
                        active: true
                    },
                    {
                        icon: 'fa-mobile',
                        title: 'Apps/Tools',
                        active: true
                    },
                    {
                        icon: 'fa-map-marker',
                        title: 'Places',
                        active: true
                    },
                    {
                        icon: 'fa-university',
                        title: 'Stuff/Brands',
                        active: true
                    },
                    {
                        icon: 'fa-bookmark',
                        title: 'Articles',
                        active: true
                    },
                    {
                        icon: 'fa-beer',
                        title: 'Events',
                        active: true
                    },
                    {
                        icon: 'fa-graduation-cap',
                        title: 'Courses',
                        active: true
                    },
                    {
                        icon: 'fa-motorcycle',
                        title: 'Sports/Activities',
                        active: true
                    },
                    {
                        icon: 'fa-star',
                        title: 'References',
                        active: true

                    },
                    {
                        icon: 'fa-users',
                        title: 'People/Services',
                        active: true
                    }
                ])