## run server: 'php artisan serve'

- Ex: PS C:\xampp\htdocs\CD_CNPM\api.pat.com> php artisan serve
- #### Domain: http://127.0.0.1:8000/


# Mô tả API

1. User

- List user (include pagination)
  - URI: api/v1/user
  - Method: GET
  - Request: {domain}/api/v1/user?limit=2&page=2&column=userID&sort=desc
  - Response:
    ```

     {
            "status": true,
            "code": 200,
            "data": [
                {
                    "userID": 11,
                    "userName": "Nguyễn Văn An",
                    "userPhone": "0987191143",
                    "userPass": "42050e34e1a0f6bd5f65196022751667",
                    "userEmail": "akjzakj@gmail.com",
                    "userAvatar": "avatar0.jpg",
                    "userRole": 0
                },
                {
                    "userID": 10,
                    "userName": "Nguyễn Văn An",
                    "userPhone": "0987191100",
                    "userPass": "an123",
                    "userEmail": "akjzakj@gmail.com",
                    "userAvatar": "avatar.png",
                    "userRole": 0
                }
            ],
            "meta": {
                "total": 11,
                "perPage": "2",
                "currentPage": 2
            }
        }
    ```
---

- Create user
  - URI: api/v1/user
  - Method: POST
  - Request:
  
  
    {
        "userName": "Nguyễn Văn An",
        "userPhone": "0987191143",
        "userPass": "an123",
        "userEmail": "akjzakj@gmail.com",
        "userAvatar": "avatar0.jpg"
    }
- Response:
  
  
    {
        "status": true,
        "code": 200
    }
---

- Update user
  - URI: api/v1/user/{user}
  - Method: PUT
  - Request:
  - Response:

---

- Login user
  - URI: api/v1/user/login/{user}
  - Method: GET
  - Request:
  - Response:

---

- CheckSignIn user
  - URI: api/v1/user/signIn/{user}
  - Method: GET
  - Request:
  - Response:

---

- UploadAvatar user
  - URI: api/v1/user/avatar/{user}
  - Method: POST
  - Request:
  - Response:
