![](https://img.shields.io/badge/Microverse-blueviolet)

# Final Capstone - Trekker
> This is a Rails back-end for our Final Capstone project.

🔗 **[Link to Front-end React app](https://github.com/dewslyse/trekker-front-end)** 🖼

<!-- ## Screenshot

<img src="./screenshot.png">  -->

## Built With

- Ruby `3.1.2`
- Rails `7.0.3`
- PostgreSQL

## Live site 🚀

🔗 [Heroku](#)

## Getting Started

### Prerequisites

- Ruby

### Setup

To get a local copy up and running follow this simple step:

- Clone repository to your local machine:

```
$ git@github.com:dewslyse/trekker-back-end.git
```

This will create a directory in the name of the project folder.

- Navigate to project folder using 

```
$ cd trekker-back-end
```

### Install

- Install all gems and dependencies for the project by running:

```
$ bundle install
```

### Create database
- In the `config/` directory, create a new file with the name `local_env.yml` and add the following code:

```
DATABASE_USERNAME: 'Your-PostgreSQL-Username'
DATABASE_PASSWORD: 'Your-PostgreSQL-Password'
```
- Create the database by running: 

```
$ rails db:create db:migrate db:seed
```

### Usage

- Run `rails s` to start the server
- Open `http://127.0.0.1:3000/` in your browser to use the app


### Tests
- Run `rspec` to run the tests

## Authors

👤 **Teshome Kurabachew**

- GitHub: [@githubhandle](https://github.com/TesheMaximillan)
- Twitter: [@twitterhandle](https://twitter.com/TesheKura)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/teshome-kurabachew-aa8067180/)

👤 **Kemigabo Catherine**

- GitHub: [@githubhandle](https://github.com/kemigabocatherine)
- Twitter: [@twitterhandle](https://twitter.com/home?lang=en)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/kemigabocatherine/)

👤 **Amina Buhari**

- GitHub: [@githubhandle](https://github.com/AminaBuhari)
- Twitter: [@twitterhandle](https://twitter.com/AminaBuhari)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/amina-buhari/)

👤 **Selase**

- GitHub: [@dewslyse](https://github.com/dewslyse)
- LinkedIn: [Selase](https://github.com/dewslyse)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

Original [design idea](https://www.behance.net/gallery/26425031/Vespa-Responsive-Redesign) by [Murat Korkmaz](https://www.behance.net/muratk).


## 📝 License

This project is [MIT](./LICENSE) licensed.
