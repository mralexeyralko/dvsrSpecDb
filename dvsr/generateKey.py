import random
import string

def generate_secret_key(length=50):
    characters = string.ascii_letters + string.digits + string.punctuation
    return ''.join(random.choice(characters) for _ in range(length))

print(generate_secret_key())

UGrFJ-5XH5=j6@w/Up1wtJO5znrxz?g:gm62+{5z0{Y);t9x?s