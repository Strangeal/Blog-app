<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
   - [Run Test](#run-tests)
  - [Run Linters](#run-tests)
  - [Run Endpoints](#Api-Endpoint-Testing)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 [Blog App] <a name="about-project"></a>

> The Blog app is a classic blog design website. ln which we can create, show the list of posts and empower readers to interact with them by adding comments and liking posts.

**[Blog App]** is a ruby blog website.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

> Blog App is backend project

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

> We can do CRUD operations on following things:

- **Posts**
- **Comments**
- **Likes**
- **Users**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO -->

## 🚀 Live Demo <a name="live-demo"></a>

> Add a link to your deployed project.

- [Comming Soon 🎈]()

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

> In order to start with this project do as follows :

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

`gem install rails`


### Setup

Clone this repository to your desired folder:

`git clone git@github.com:Strangeal/Blog-app.git`

then

`cd Blog-app`

### Install

Install this project with:

`bundle install`

### Usage

`rails s`

### Run Test
To run app test. run the following commad:

`rspec`

### Run Linters

To run tests, run the following command:

`rubocop`

OR

`rubocop -a` 

**it will automatically correct the errors**


### Api-Endpoint-Testing

- Add user to database using(postman) on this path
`http://localhost:3000/api/v1/register`
```first_user = User.create(
  name: "Tom",
  photo: "https://res.cloudinary.com/dxsom7jmx/image/upload/v1674721420/Meta%20tags/girl-2696947_1280_2_ct8ivd.jpg",
  bio: "Teacher from Mexico.",
  email: "tom@apple.com",
  password: "mysecret@12",
  password_confirmation: "mysecret@12",
  role: "admin",
  jti: "sdhfsh64y4" )
  ```

  - Check your teminal for comfirmation link to verify account
  - Check out terminal after verification to copy the jti key generated dusring sign up
  - Add the copied jti key in this directory `config/devise.rb` on line `312` after the sacret
  - Open postman and navigate to this routes `http://localhost:3000/api/v1/login`
  add your login details as body and make a POST request to log in
  - Click on `headers` and copy the authentication key
  - Make a GET request to this path `http://localhost:3000/api/v1/users/`
  and add the authentication key you copied as a bearer token to get access to database


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👨‍💻 **Justice Bajeri**
- GitHub: [Link to Github Profile](https://github.com/Strangeal)
- Twitter: [Link to Twitter Profile](https://twitter.com/Str_angeal)
- LinkedIn: [Link to LinkedIn Profile](https://www.linkedin.com/in/justice-bajeri-0b7211243/)

👤 **Temitope Ogunleye**

- GitHub: [@topeogunleye](https://github.com/topeogunleye)
- Twitter: [@tope_leye](https://twitter.com/tope_leye)
- LinkedIn: [ogunleye](https://linkedin.com/in/ogunleye)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

> In upcoming weeks I will add some features as mentioned below

- [ ] **Authentication and Authorization**
- [ ] **API & Documentation**
- [ ] **High UI**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project then please give a ⭐️ and also share your feedback using github_issues.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

❤️ [RoR Documentation](https://guides.rubyonrails.org)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>