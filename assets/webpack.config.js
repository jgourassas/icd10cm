const path = require('path');
const glob = require('glob');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const TerserPlugin = require('terser-webpack-plugin');
const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');
const paths = {
  static: path.join(__dirname, '../priv/static'),
  build: path.join(__dirname, '../priv/static/fonts'),
  build: path.join(__dirname, '../priv/static/images'),
  node_modules: path.join(__dirname, '../node_modules'),
  src: path.join(__dirname, './'),
};


module.exports = (env, options) => {
  const devMode = options.mode !== 'production';

  return {
    optimization: {
      namedChunks: true,
  
      minimizer: [
        new TerserPlugin({ cache: true, parallel: true, sourceMap: devMode }),
        new OptimizeCSSAssetsPlugin({})
      ]
    },
    entry: {
      app: ['./js/app.js'].concat(glob.sync('./vendor/**/*.js')),
      //'app': glob.sync('./vendor/**/*.js').concat(['./js/app.js']),
      draw_external: './js/external_injuries/draw_external.js',
      icd10cm_tree: './js/icd10cm_tree/icd10cm_tree.js',
    },
    output: {
      filename: '[name].js',
      path: path.resolve(__dirname, '../priv/static/js'),
      publicPath: '/js/'
    },
    devtool: devMode ? 'source-map' : undefined,
    module: {
      rules: [
        {
          test: /\.js$/,
          exclude: /node_modules/,
          use: {
            loader: 'babel-loader'
          }
        },
        {
          test: /\.[s]?css$/,
          use: [
            MiniCssExtractPlugin.loader,
            'css-loader',
            'sass-loader',
          ],
        },
        {
          test: /\.(woff(2)?|ttf|eot|svg)(\?v=\d+\.\d+\.\d+)?$/,
          use: [
            {
              loader: 'file-loader',
              options: {
                 name: '[name].[ext]',
                outputPath: '../fonts',
              },
            },
          ],
        },
   
      ]
    },
    plugins: [
      new MiniCssExtractPlugin({ filename: '../css/app.css' }),
      new CopyWebpackPlugin([{ from: 'static/', to: '../' }])
    ]
  }
};
