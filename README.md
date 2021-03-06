## Bit-Bizarre

<a href="APP LINK IF APPLICABLE" target="#"><APP LINK NAME></a>

By
- Ian MacDonald (<a href="https://github.com/matchbookmac" target="#">GitHub</a>)
- Alec Arme (<a href="https://github.com/ginkko" target="#">Github</a>)
- Adam McFadden (<a href="https://github.com/adammcfadden" target="#">Github</a>)
- Toby Alden (<a href="https://github.com/tobyalden" target="#">Github</a>)

@ Epicodus Programming School, Portland, OR

GNU General Public License, version 3 (see below). Copyright (c) 2015 CasualWare LLC.

### Description

**Bit-Bizarre**

Bit-Bizarre is a storefront for digital goods and uploads.

### Author(s)

Ian MacDonald, Alec Arme, Adam McFadden, Toby Alden

### Setup

This app was written in `Rails '4.2.3'`.

Clone this repo with
```console
> git clone https://github.com/adammcfadden/bit-bizarre.git
```

Install gems:

```console
> bundle install
```

Create database
```console
> rake db:create
> rake db:migrate
> rake db:test:prepare
```

Start App:
```console
> rails s
```
Navigate to localhost:3000 in your browser.

Seeding Test Data:
```console
> rake db:seed
```

Seeding includes dynamically generated items and users for those items.

Be warned: seeding the database creates 100 items, each with an avatar, so the
seeding process can take some time.

Users generated for testing login are:

The admin user is:
- Email: dave@dave.com
- Password: asdfghjkl

The standard user is:
- Email: sam@sam.com
- Password: asdfghjkl

In order to test Stripe, you will need a .env file with
PUBLISHABLE_KEY
SECRET_KEY
set to test keys on an active stripe account

### License ###
Copyright  (C)  2015  CasualWare LLC

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
