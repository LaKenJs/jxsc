// 引入express包
const express = require('express')
// 设置app
const app = express()
// 配置bodyParser
const bodyParser = require('body-parser');
const cors = require('cors');
app.use(cors());
app.use(bodyParser.urlencoded({extended: false}));
// 配置路由
app.use(require('./router'));
// 配置cors
app.listen(8982, () => {
    console.log("server is runing: http://127.0.0.1:8982")
})