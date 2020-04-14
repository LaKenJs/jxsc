const express = require('express');
const controller = require('../controller');
const router = express.Router();
const bodyParser = require('body-parser');
router.post('/api/v1/login',bodyParser.json(),controller.login)
router.post('/api/v1/regist',bodyParser.json(),controller.regist)
router.get('/api/v1/swiper',controller.swiper)
router.get('/api/v1/cateList',controller.cateList)
router.get('/api/v1/userMessage',controller.userMessage)
// router.get('/api/v1/advList',controller.advList)
router.get('/api/v1/goodsList',controller.goodsList)
router.get('/api/v1/goodsdesc',controller.goodsdesc)
router.get('/api/v1/goodsdescimgs',controller.goodsdescimgs)
router.get('/api/v1/goodsmesg',controller.goodsmesg)
router.get('/api/v1/cate_page',controller.cate_page)
router.put('/api/v1/editUser',bodyParser.json(), controller.editUser)
router.post('/api/v1/cartadd',bodyParser.json(),controller.cartadd)
router.get('/api/v1/cart',controller.cart)
router.post('/api/v1/updateCart',bodyParser.json(),controller.updateCart)
router.get('/api/v1/cartdata',controller.cartdata)
router.delete('/api/v1/delcart/:id',controller.delcart)





module.exports = router