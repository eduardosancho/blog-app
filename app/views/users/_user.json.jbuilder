json.call(user, :id, :email, :name, :bio, :photo)
json.token user.generate_jwt
