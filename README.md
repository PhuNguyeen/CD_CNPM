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
                "userName": "Nguyễn Văn B",
                "userPhone": "0987654321",
                "userPass": "a123",
                "userEmail": "a@gmail.com",
                "userAvatar": "avatar11.jpg",
                "userRole": 0
            },
            {
                "userID": 10,
                "userName": "Nguyễn Văn A",
                "userPhone": "0987191100",
                "userPass": "b123",
                "userEmail": "b@gmail.com",
                "userAvatar": "avatar10.png",
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

    ```
    {
        "userName": "Nguyễn Văn A",
        "userPhone": "0987654322",
        "userPass": "a123",
        "userEmail": "a@gmail.com"
    }
    ```

  - Response:

    ```
    {
        "status": true,
        "code": 200
    }
    ```

---

- Login user
  - URI: api/v1/user/login/{userPhone}
  - Method: GET
  - Request: userPass
  - Response:
  ```
  {
		"status": true,
		"code": 200,
		"data": [
			{
				"userID": 0,
				"userName": "Nguyễn Văn An",
				"userPhone": "84987191143",
				"userEmail": "akjzakj@gmail.com",
				"userAvatar": "avatar0.png",
				"userRole": 1
			}
		]
}```

---

- CheckSignUp user
  - URI: api/v1/user/signUp/{userPhone}
  - Method: GET
  - Request:
  - Response:
  ```
  {
		"status": true,
		"code": 200,
		"message": "User exists"
}```

---

- UploadAvatar user
  - URI: api/v1/user/avatar/{userPhone}
  - Method: POST
  - Request: key=>'file'
  - Response:
  ```
  {
		"status": true,
		"code": 200,
		"message": "Successful."
}```
---
2. Product

- List product (include pagination)
  - URI: api/v1/user/avatar/{userPhone}
  - Method: POST
  - Request: 
  - Response: