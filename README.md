## Frontend applications for cool startup

## :floppy_disk: Setup - Frontend

* Change to `/client` directory
* Install dependencies using `npm i`. (I have not tried this method and cannot be sure it will work)
* Alternatively - and better - bootstrap a new React project using `npx create-react-app my-app`
* Run `npm start`. Frontend will open at `http://localhost:3000/`

## :computer: Code Examples - Frontend

* method to add a city

```javascript
// fetch an object that has a city property
  // after getting city list clear input field
  handleAddCity = () => {
    fetch('/api/cities', {
      method: 'post',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ city: this.state.newCityName })
    })
    .then(res => res.json())
    .then(res => {
      this.getCityList();
      this.setState({ newCityName: '' });
    });
  };
```