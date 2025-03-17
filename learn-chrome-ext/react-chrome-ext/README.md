## How to setup

### Do the usual to create the react app.

```
npx create-react-app react-chrome-ext
cd react-chrome-ext
yarn add --dev flow-bin
yarn run flow init
```

Add flow setting to package.json. Edit `package.json` as follows:

```
{
	"scripts": {
		...
		"flow": "flow"
	}
}
```

### Edit `public/manifest.json` to look like it does.

### Add global chrome
Create a new file `src/chrome.js` and make it look like it does. Do not forget to add the comment. Otherwise `yarn build` will not work. Because javascript.

### Edit `src/App.jsx` to look like it does.

### Edit `build` step of `src/package.json` to look like it does.

## Install in Chrome

  1. Open the Extension Management by navigating to `chrome://extensions`.
  2. Enable Developer Mode by clicking the toggle switch.
  3. Click the **Load unpacked** button and select the `build` directory.
