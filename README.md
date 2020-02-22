# MyWebsite

| Environment |                                                                      CI Status                                                                       |                                                                       Coverage                                                                       |
| :---------: | :--------------------------------------------------------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------------------------------------------------: |
| Production  |  [![pipeline status](https://gitlab.com/altjohndev/my-website/badges/master/pipeline.svg)](https://gitlab.com/altjohndev/my-website/commits/master)  |  [![coverage report](https://gitlab.com/altjohndev/my-website/badges/master/coverage.svg)](https://gitlab.com/altjohndev/my-website/commits/master)  |
| Development | [![pipeline status](https://gitlab.com/altjohndev/my-website/badges/develop/pipeline.svg)](https://gitlab.com/altjohndev/my-website/commits/develop) | [![coverage report](https://gitlab.com/altjohndev/my-website/badges/develop/coverage.svg)](https://gitlab.com/altjohndev/my-website/commits/develop) |

## Production Runtime Environment Variables

### Database

| Name                     | Default      | Pattern | Description                                                 |
| :----------------------- | :----------- | :------ | :---------------------------------------------------------- |
| `APP_DATABASE_NAME`      | `my_website` | String  | The website PostgreSQL database name                        |
| `APP_DATABASE_HOSTNAME`  | `postgres`   | String  | PostgreSQL hostname                                         |
| `APP_DATABASE_SSL`       | `false`      | Boolean | If `true`, website will communicate with database using SSL |
| `APP_DATABASE_PASSWORD`  | `postgres`   | String  | PostgreSQL user password                                    |
| `APP_DATABASE_POOL_SIZE` | `10`         | String  | Maximum amount of concurrent database connections           |
| `APP_DATABASE_USERNAME`  | `postgres`   | String  | PostgreSQL username                                         |

### Endpoint

| Name                   | Default         | Pattern | Description                                                  |
| :--------------------- | :-------------- | :------ | :----------------------------------------------------------- |
| `APP_HOSTNAME`         | Must be defined | String  | The website hostname                                         |
| `APP_ORIGIN_HOSTNAMES` | Must be defined | String  | Hostnames allowed to request pages to website                |
| `APP_PORTS`            | `80`            | Integer | The website port                                             |
| `APP_SECRET_KEY_BASE`  | Must be defined | String  | Base secret key to encrypt data between requester and server |

### Logger

| Name                       | Default                                                    | Pattern                          | Description                                                   |
| :------------------------- | :--------------------------------------------------------- | :------------------------------- | :------------------------------------------------------------ |
| `LOGGER_TRUNCATE`          | `infinity`                                                 | `infinity`, Integer              | Truncate log. Use `infinity` to not truncate at all           |
| `LOGGER_DISCARD_THRESHOLD` | `5000`                                                     | Integer                          | Discard excess log on stack. Decrease to increase performance |
| `LOGGER_LEVEL`             | `info`                                                     | `debug`, `info`, `warn`, `error` | Log verbosity                                                 |
| `LOGGER_FORMAT`            | `__date __time [__level__levelpad] __message __metadata\n` | String                           | Log format                                                    |
| `LOGGER_METADATA`          | `request_id`                                               | String                           | Show metadata values                                          |
