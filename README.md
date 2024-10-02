# Project Overview: E-commerce Platform

## Descripcion del proyecto

Este proyecto fue desarrollado como parte de una prueba técnica para la empresa Linktic, y consiste en una aplicación de ecommerce que permite a los usuarios y administradores interactuar con productos y órdenes de manera eficiente.

En el lado administrativo, el administrador tiene acceso a un panel de control donde puede crear, editar, listar y desactivar productos del catálogo. Además, el administrador puede visualizar todas las órdenes realizadas por los usuarios, lo que le permite tener un control completo sobre el inventario y las ventas.

Para los usuarios, la plataforma ofrece la posibilidad de registrarse o iniciar sesión, permitiéndoles navegar por el catálogo de productos. Los usuarios pueden buscar productos utilizando diferentes criterios, como nombre o categoría, o aplicar ambos filtros simultáneamente. La funcionalidad de carrito de compras permite agregar productos y proceder con sus compras de manera sencilla. Además, cada usuario cuenta con un perfil personal donde puede ver las órdenes que ha realizado, brindando una experiencia completa y personalizada en su historial de compras.


## 1. Arquitectura

Se propuso la nube AWS y sus diferentes servicios para tener una aplicacion facil de escalar y de alta disponibilidad.

![DIAGRAMA INFRA](https://github.com/user-attachments/assets/556d8abb-24a9-4701-8bc5-7d400477ccc7)

## 2. Levantar localmente

  Para levantar el entorno local decidi que docker era la mejor manera. En el DockerFile se especifican los puertos, las variables de entornos y el iniciador de la base de datos.

```sh
git clone --recurse-submodules https://github.com/leopacheco18/linktic-test.git
```
```sh
cd linktic-test
```
```sh
docker-compose up --build
```

## 3. Tecnologias utilizadas

- Frontend: React
- Backend: Nest.js
- Base de datos: Postgres
- Docker
- Cloud: S3 (Guardar las imagenes de los productos y desplegar el frontend)
- Github y Github Actions

## 4. CI/CD con Github Actions

Se integro un pipeline con Github Actions que detecta los cambios de la rama Main del frontend. Los pasos del pipeline son los siguientes

- Primero hace un check del codigo con actions/checkout
- Hace el setup de la version lts de node
- Instala las dependencias con npm install
- Compila el proyecto con npm run build
- Hace el release de la aplicacion con npx semantic-release donde genera un changeLog y lleva el versionado de la app.
- Despliega en s3 el frontend con jakejarvis/s3-sync-action@master

## 5. Instrucciones para el aplicativo

La app ya cuenta con dos usuarios pre-cargados uno con el rol de admin y otro con el rol de comprador.

| Usuario | Rol | Clave|
| ------ | ------ | ------ |
| admin@linktic.com | Admin | password123 |
| buyer@linktic.com | Comprador | password123 |

## 6. Imagenes de la app

### Administrador

![Captura de pantalla 2024-10-01 a la(s) 11 42 24 p  m](https://github.com/user-attachments/assets/be659167-9a1f-4df4-a6ff-b3813f6cf61c)

![Captura de pantalla 2024-10-01 a la(s) 11 43 13 p  m](https://github.com/user-attachments/assets/ca9bae43-86c1-4586-b1b9-4c1e446537a7)

### Login / Registro

![Captura de pantalla 2024-10-01 a la(s) 11 43 59 p  m](https://github.com/user-attachments/assets/42b4db8c-14ac-4150-8b9f-e0a93cb8c2bf)

![Captura de pantalla 2024-10-01 a la(s) 11 43 50 p  m](https://github.com/user-attachments/assets/dbfcb9e7-9346-4d6a-ab1a-4ba93163cd2e)

### Productos y Carrito de compras

![Captura de pantalla 2024-10-01 a la(s) 11 44 48 p  m](https://github.com/user-attachments/assets/dd4b5471-e5eb-41c7-8ae6-def3c98ee7ad)

![Captura de pantalla 2024-10-01 a la(s) 11 45 40 p  m](https://github.com/user-attachments/assets/73d8fe49-8e1b-470d-8458-9451e2a37556)





