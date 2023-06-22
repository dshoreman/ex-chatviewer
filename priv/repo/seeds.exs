alias ChatViewer.{Accounts, Chats, Messages, Repo}

IO.puts("Running this seeder will remove ALL data!")
Task.async(fn -> IO.gets "Press enter to conitnue, or wait 5 seconds to abort." end)
|> Task.await()

Repo.query("TRUNCATE users_tokens", [])
Repo.query("TRUNCATE messages", [])
# Not sure why TRUNCATE doesn't work for people+users...
Repo.delete_all(Chats.Participant)
Repo.delete_all(Accounts.User)

Faker.start()
IO.puts("\n\nDatabase cleaning complete!\n\n")

IO.puts("Generating user...")
{:ok, user} = Accounts.register_user(%{email: "user@localhost.me", password: "password1234"})

IO.puts("Generating contacts...")
for _ <- 1..5 do
  {:ok, _} = Chats.create_participant(%{
    name: Faker.Person.name(),
    user_id: user.id,
    facebook_name: Faker.Person.name(),
    facebook_id: to_string(Faker.random_between(100000000, 199999999)),
    facebook_slug: Faker.Internet.user_name(),
    discord_name: Faker.Internet.user_name(),
    discord_id: to_string(Faker.random_between(100000000, 199999999)),
    discord_avatar: Faker.Internet.image_url()
  })
end

IO.puts("Generating messages...")
for _ <- 1..20 do
  date = Faker.DateTime.backward(365)
  {:ok, _} = Messages.create_message(%{
    sender_id: Faker.Util.pick(1..5),
    content: Faker.Lorem.paragraph(1..7),
    sent_at: date,
    edited_at: date,
    reactions: %{},
  })
end

IO.puts("Done!")
