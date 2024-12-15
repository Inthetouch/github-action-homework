import os

c = get_config()

# Указываем имя администратора из переменной окружения
admin_user = os.getenv("ADMIN_USER", "default_admin")

# Используем PAMAuthenticator
c.JupyterHub.authenticator_class = "jupyterhub.auth.PAMAuthenticator"

# Разрешаем вход только для администратора
c.Authenticator.allowed_users = {admin_user}

# Назначаем администратора
c.Authenticator.admin_users = {admin_user}

c.Spawner.default_url = '/lab'