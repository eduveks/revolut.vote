module.exports = {
    entry: [ './src/index.js', './src/style/main.scss' ],
    devtool: "source-map",
    output: {
        path: __dirname +'/..',
        filename: 'main.js'
    },
    module: {
        rules: [
            {
                test: /\.js$/,
                exclude: /node_modules/,
                use: {
                    loader: "babel-loader"
                }
            },
            {
                test: /\.scss$/,
                use: [
                    {
                        loader: "style-loader"
                    },
                    {
                        loader: "css-loader"
                    },
                    {
                        loader: "sass-loader"
                    }
                ]
            },
            {
                test: /\.css$/,
                loaders: ["style-loader", "css-loader"]
            }
        ]
    }
};
