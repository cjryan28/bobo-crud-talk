a = User.create(username: "admin", email: "control@usa.gov", hugger_type: "bear", description: "I like giving bear hugs. I enjoy my hugger to be a smaller person than me", password: "passwordusa", password_confirmation: "passwordusa")
b = User.create(username: "needy", email: "iluvit@gmail.com", hugger_type: "hug activist", description: "Hugs make the world a better place", password: "passwordusa", password_confirmation: "passwordusa")
Hug.create(receiver: a, giver: b)