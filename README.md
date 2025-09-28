# Sausage Store

![image](https://user-images.githubusercontent.com/9394918/121517767-69db8a80-c9f8-11eb-835a-e98ca07fd995.png)


## Technologies used

* Frontend – TypeScript, Angular.
* Backend  – Java 16, Spring Boot, Spring Data.
* Database – H2.

## Installation guide
### Backend

Install Java 16 and maven and run:

```bash
cd backend
mvn package
cd target
java -jar sausage-store-0.0.1-SNAPSHOT.jar
```

### Frontend

Install NodeJS and npm on your computer and run:

```bash
cd frontend
npm install
npm run build
npm install -g http-server
sudo http-server ./dist/frontend/ -p 80 --proxy http://localhost:8080
```

Then open your browser and go to [http://localhost](http://localhost)

## Чек-лист для проверки
- Для backend, backend-report, frontend описаны корректные Dockerfiles.
- Для бэкенда добавлены миграции БД, миграции выполняются корректно.
- Добавлены манифесты для СУБД PostgreSQL. К базе примонтирована PVC для персистивности данных.
- Есть верхнеуровневый файл Chart.yaml с деплоем «Сосисочной», включающий в себя четыре части: frontend, backend, backend-report и infra со своими Chart.yaml.
- Внесены корректировки в чарт фронтенда: добавлен Chart.yaml и недостающий Service.
- Описаны VPA для бэкенда и HPA для backend-report.
- Описаны LivenessProbe для бэкенда.
- Описаны стратегии деплоя для бэкенда (RollingUpdate) и backend-report (Recreate).
- Для всех необходимых приложений указаны resources.requests и resources.limits по памяти и ЦПУ.
- Все файлы, необходимые для деплоя, сохранены в папке sausage-store-chart.
- Верхнеуровневый каталог Chart содержит values.yaml с набором переменных, которые нужны для всех микросервисов.
- Темплейты микросервисов используют переменные из values.yaml типа replicas: {{ .Values.replicas }}, а также генерируемые chart-переменные: name: sausage-backend-{{ .Release.Name }}, namespace: {{ .Release.Namespace }} и так далее.
- Чарт проходит линтер helm lint ./sausage-store-chart.
- Чарт можно установить в Kubernetes-кластере helm install ..., при вызове команды helm get all/helm list отображается STATUS: deployed.
- В Nexus создан репозиторий типа helm(hosted) с вашим именем с параметром Deployment policy: "Allow redeploy".