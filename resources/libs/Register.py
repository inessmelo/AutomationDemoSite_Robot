from faker import Faker
fake = Faker('pt_BR')

def get_faker_register():
    register = {
        "firstName" : fake.first_name(),
        "lastName" : fake.last_name(),
        "address" : fake.address(),
        "email" : fake.email(),
        "phone" : fake.phone_number(),
        "pass" : "Abs@123",
        "confirmPass" : "Abs@123",
    }
    return register