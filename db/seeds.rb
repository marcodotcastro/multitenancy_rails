Author.create(slug: "marco", name: "Marco")
Author.create(slug: "castro", name: "Castro")

FactoryBot.create(:user,
                  name: 'user',
                  email: 'admin@email.com',
                  password: 'foobar123',
                  password_confirmation: 'foobar123',
                  admin: true
)