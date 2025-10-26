<div align="center">

![Truck Signs](./screenshots/Truck_Signs_logo.png)

# Signs for Trucks

![Python version](https://img.shields.io/badge/Pythn-3.8-4c566a?logo=python&&longCache=true&logoColor=white&colorB=pink&style=flat-square&colorA=4c566a) ![Django version](https://img.shields.io/badge/Django-2.2.8-4c566a?logo=django&&longCache=truelogoColor=white&colorB=pink&style=flat-square&colorA=4c566a) ![Django-RestFramework](https://img.shields.io/badge/Django_Rest_Framework-3.12.4-red.svg?longCache=true&style=flat-square&logo=django&logoColor=white&colorA=4c566a&colorB=pink)


</div>

## Table of Contents
1 [Description](#description)
2.[Prerequisites](#Prerequisites)
3.[Installation](#installation)
4.[Screenshots of the Django Backend Admin Panel](#screenshots)
5.[Useful Links](#useful_links)



## Description

__Signs for Trucks__ is an online store to buy pre-designed vinyls with custom lines of letters (often call truck letterings). The store also allows clients to upload their own designs and to customize them on the website as well. Aside from the vinyls that are the main product of the store, clients can also purchase simple lettering vinyls with no truck logo, a fire extinguisher vinyl, and/or a vinyl with only the truck unit number (or another number selected by the client).

### PREREQUISITIES

- Python 3.8
- Django 2.2.8
- Django 3.12.4

## Quickstart
1. Clone the following Github Repository on your VServer.
    ```
    git clone git@github.com:SuperUsta/truck_signs_api.git
    ```
### Build-Dockerimage 

1. Be sure to add your ip at truck_signs_api\truck_signs_designs\settings\test_docker.py
    ```
    ALLOWED_HOSTS = ["localhost", "127.0.0.1",<your-server-ip>, "[::1]"]
    ```
2. Add a volume(once)
    ```
    docker volume create trucksigns_db_data
    ```

3.  Build your Docker Image
    ```
    docker build -t truck_sign_api -f Dockerfile .  
    ```

4.  Run your Docker image at background
    ```
    --detach --name web --network trucksign-net --env-file "<path>\truck-sign-api\truck_signs_api\truck_signs_designs\settings\.env" -v trucksign_data:/app --publish 8000:8000 truck_sign_api
    ```
5. Run your Docker databanse at background
    ```
    --detach --name db --network trucksign-net --env-file "<path>\truck-sign-api\truck_signs_api\truck_signs_designs\settings\.env" -v trucksigns_db_data:/var/lib/postgresql/data --restart unless-stopped postgres:13 --restart unless-stopped
    ```
6. optional you can check your container and database works
    ```
    docker ps
    ```
7. stop running container and running database
    ```
    docker stop web
    docker stop db
    ```
8. delete container and database
    ```
    docker rm web
    docker rm db
    ```
## Usage

### Creating-Superuser
1. Navigate in your truck_signs_api folder 
    ```
    TRUCK-SIGN-API/truck_signs_api
    ```
2. Create a new Superuser for Django Admin Panel: 
    ```
    docker exec -it web python /app/manage.py createsuperuser
    ```


1. (Optional step) To create a super user run:
    ```bash
    exec django python manage.py createsuperuser
    ```
Added a username and a safty password and safe.

3. Navigate to Django Admin Panel and log in with your created superuser account. 
    ```
    <localhost>/admin
    ```


__NOTE:__ To create Truck vinyls with Truck logos in them, first create the __Category__ Truck Sign, and then the __Product__ (can have any name). This is to make sure the frontend retrieves the Truck vinyls for display in the Product Grid as it only fetches the products of the category Truck Sign.

---

<a name="screenshots"></a>

## Screenshots of the Django Backend Admin Panel

### Mobile View

<div align="center">

![alt text](./screenshots/Admin_Panel_View_Mobile.png)  ![alt text](./screenshots/Admin_Panel_View_Mobile_2.png) ![alt text](./screenshots/Admin_Panel_View_Mobile_3.png)

</div>
---

### Desktop View

![alt text](./screenshots/Admin_Panel_View.png)

---

![alt text](./screenshots/Admin_Panel_View_2.png)

---

![alt text](./screenshots/Admin_Panel_View_3.png)



<a name="useful_links"></a>
## Useful Links

### Postgresql Database
- Setup Database: [Digital Ocean Link for Django Deployment on VPS](https://www.digitalocean.com/community/tutorials/how-to-set-up-django-with-postgres-nginx-and-gunicorn-on-ubuntu-16-04)

### Docker
- [Docker Oficial Documentation](https://docs.docker.com/)
- Dockerizing Django, PostgreSQL, guinicorn, and Nginx:
    - Github repo of sunilale0: [Link](https://github.com/sunilale0/django-postgresql-gunicorn-nginx-dockerized/blob/master/README.md#nginx)
    - Michael Herman article on testdriven.io: [Link](https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/)

### Django and DRF
- [Django Official Documentation](https://docs.djangoproject.com/en/4.0/)
- Generate a new secret key: [Stackoverflow Link](https://stackoverflow.com/questions/41298963/is-there-a-function-for-generating-settings-secret-key-in-django)
- Modify the Django Admin:
    - Small modifications (add searching, columns, ...): [Link](https://realpython.com/customize-django-admin-python/)
    - Modify Templates and css: [Link from Medium](https://medium.com/@brianmayrose/django-step-9-180d04a4152c)
- [Django Rest Framework Official Documentation](https://www.django-rest-framework.org/)
- More about Nested Serializers: [Stackoverflow Link](https://stackoverflow.com/questions/51182823/django-rest-framework-nested-serializers)
- More about GenericViews: [Testdriver.io Link](https://testdriven.io/blog/drf-views-part-2/)

### Miscellaneous
- Create Virual Environment with Virtualenv and Virtualenvwrapper: [Link](https://docs.python-guide.org/dev/virtualenvs/)
- [Configure CORS](https://www.stackhawk.com/blog/django-cors-guide/)
- [Setup Django with Cloudinary](https://cloudinary.com/documentation/django_integration)

