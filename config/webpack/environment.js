const { environment } = require('@rails/webpacker')

const webpack = requie('webpack')

environment.plugins.append("Provide", new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js','default']
}))

module.exports = environment
