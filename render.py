import subprocess

def install_requirements():
    try:
        subprocess.run(["pip", "install", "-r", "requirements.txt"], check=True)
        print("Requirements installed successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Error occurred: {e}")

if __name__ == "__main__":
    install_requirements()

python manage.py collectstatic --noinput
python manage.py migrate