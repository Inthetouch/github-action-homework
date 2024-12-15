# Устанавливаем базовый образ Jupyter
FROM jupyterhub/jupyterhub:latest
# Устанавливаем jupyter_server
RUN pip install jupyter_server
# Указываем переменную окружения с именем администратора
ARG ADMIN_USER=admin
# Указываем переменную с паролем администратора
ARG ADMIN_PASSWORD=admin
# Указываем имя администратора
ENV ADMIN_USER=${ADMIN_USER}
# Указываем пароль администратора
ENV ADMIN_PASSWORD=${ADMIN_PASSWORD}
# Скопируем конфиг
COPY jupyterhub_config.py /data/jupyterhub/jupyterhub_config.py
# Указываем рабочую директорию
WORKDIR /data/jupyterhub
#Создаем пользователя и задаем пароль
RUN useradd -m ${ADMIN_USER}
RUN echo "${ADMIN_USER}:${ADMIN_PASSWORD}" | chpasswd
# Запускаем JupyterHub
CMD ["jupyterhub"]