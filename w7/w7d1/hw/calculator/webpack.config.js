module.exports = {
  context: __dirname,
  entry: "./frontend/app.jsx",
  output: {
    path: "./",
    filename: "bundle.js"
  },
  module: {
    loaders: [
      {
        test: [/\.jsx$/, /\.js?$/],
        exclude: /(node_modules)/,
        loader: "babel",
        query: {
          presets: ['es2015', 'react']
        }
      }
    ]
  },
  devtool: 'source-maps',
  resolve: {
    extensions: ["", ".js", ".jsx"]
  }
};
