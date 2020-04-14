const connection = require('../data')
// 登录
module.exports.login = (req, res) => {
    let params = [req.body.telephone, req.body.password]
    console.log(req.body)
    connection.query('select * from users where telephone =? and password =?', params, (error, result) => {
        if (error) {
            console.log(error)
        } else {
            if (result.length === 1) {
                res.json({
                    ok: 1,
                    token: 'sssd',
                    message: '登陆成功'
                })
            } else {
                res.json({
                    ok: 0,
                    message: '用户名或密码错误'
                })
            }

        }
    })
}
// 用户信息
module.exports.userMessage = (req, res) => {
    console.log(req.query)
    let params = [req.query.tele]
    connection.query('select * from users where telephone =?', params, (error, result) => {
        if (error) {
            console.log(error)
        } else {
            res.json({
                ok: 1,
                data: result
            })
        }
    })
}
// 注册
module, exports.regist = (req, res) => {
    let params = [req.body.telephone, req.body.password]
    connection.query('insert into users(telephone, password) value (?,?)', params, (error, result) => {
        if (error) {
            console.log(error)
        } else {
            res.json({
                ok: 1,
                data: result,
                msg: '注册成功'
            })
        }
    })
}
// 首页轮播图
module.exports.swiper = (req, res) => {
    connection.query('select * from swiper', (error, result) => {
        if (error) {
            console.log(error)
        } else {
            res.json({
                ok: 1,
                data: result
            })
        }
    })
}
// 分类列表
module.exports.cateList = (req, res) => {
    connection.query('select * from cate_table', (error, result) => {
        if (error) {
            console.log(error)
        } else {
            res.json({
                ok: 1,
                data: result
            })
        }
    })
}
// 商品列表
module.exports.goodsList = (req, res) => {
    if (req.query.cate_id) {
        connection.query(`select * from recommend where cate_id =${req.query.cate_id}`, (error, result) => {
            if (error) {
                console.log(error)
            } else {
                res.json({
                    ok: 1,
                    data: result
                })
            }
        })
    } else {

        if (!req.query.query) {
            req.query.query = ''
        }
        connection.query(`select * from recommend where recommend_desc like "%${req.query.query}%"`, (error, result) => {
            if (error) {
                console.log(error)
            } else {
                res.json({
                    ok: 1,
                    data: result
                })
            }
        })
    }

}
// 商品详情
module.exports.goodsdesc = (req, res) => {
    // console.log(req.query)
    connection.query('select * from goods_lunbo where goods_id =?', req.query.id, (error, result) => {
        if (error) {
            console.log(error)
        } else {
            res.json({
                ok: 1,
                data: result
            })
        }
    })
}
// 商品信息图片
module.exports.goodsdescimgs = (req, res) => {
    // console.log(req.query)
    connection.query('select * from goods_descimg where good_id =?', req.query.id, (error, result) => {
        if (error) {
            console.log(error)
        } else {
            res.json({
                ok: 1,
                data: result
            })
        }
    })
}
// 商品信息
module.exports.goodsmesg = (req, res) => {
    connection.query('select * from goods_mesg where good_id =?', req.query.id, (error, result) => {
        if (error) {
            console.log(error)
        } else {
            res.json({
                ok: 1,
                data: result
            })
        }
    })
}
// 分类标签
module.exports.cate_page = (req, res) => {
    connection.query('select * from cate_page', (error, result) => {
        if (error) {
            console.log(error)
        } else {
            res.json({
                ok: 1,
                data: result
            })
        }
    })
}
// 修改用户信息
module.exports.editUser = (req,res) => {
    console.log(req.body)
    connection.query('update users set user_name =?, password =? where telephone =?',[req.body.username,req.body.password,req.body.telephone],(error,result) => {
        if (error) {
            console.log(error)
        } else {
            res.json({
                ok: 1,
                data: result
            })
        }
    })
}
// 加入购物车
module.exports.cartadd = (req, res) => {
    console.log(req.body)
    connection.query('insert into cart (goods_id,goods_attrs,goods_num,goods_ischeck) values (?,?,?,0)',[req.body.id,req.body.attr,req.body.number], (error, result) => {
        if (error) throw error
        res.json({
            ok: 1,
            msg: "添加成功"
        })
    })
}

// 渲染购物车
module.exports.cart = (req,res) => {
    connection.query('select * from cart',(error,result) => {
        if (error) {
            console.log(error)
        } else {
            // res.json(result)
            for(let i = 0; i < result.length; i++) {
                connection.query(`select * from recommend where id = ${result[i].goods_id}`,(error,nResult) => {
                    result[i].goods_name = nResult[0].recommend_desc
                    result[i].goods_price = nResult[0].recommend_price
                    result[i].goods_img = nResult[0].recommend_img
                    if(result[i].goods_ischeck === '0') {
                        result[i].goods_ischeck = false
                    } else {
                        result[i].goods_ischeck = true
                    }
                    if(i >= result.length - 1) {
                        res.json({
                            result
                        })
                    }
                }) 
            }
        }
    })
}
// 改变状态
module.exports.updateCart = (req, res) => {
        let sql =
            `update cart set goods_num = ?,goods_ischeck = ? where id = ?`
        if(req.body.goods_ischeck === false) {
            req.body.goods_ischeck = 0
        }else {
            req.body.goods_ischeck = 1
        }
        let params = [req.body.good_num, req.body.is_ok, req.body.good_id]
        connection.query(sql,params, (error, results) => {
            if (error) throw error;
            res.json({
                ok: 1,
                data: results
            })
        })
}
// 获取购物车数据
module.exports.cartdata = (req,res) => {
    connection.query('select * from cart where goods_ischeck = 1',(error,result) => {
        if (error) {
            console.log(error)
        } else {
            // res.json(result)
            for(let i = 0; i < result.length; i++) {
                connection.query(`select * from recommend where id = ${result[i].goods_id}`,(error,nResult) => {
                    result[i].goods_name = nResult[0].recommend_desc
                    result[i].goods_price = nResult[0].recommend_price
                    result[i].goods_img = nResult[0].recommend_img
                    if(result[i].goods_ischeck === '0') {
                        result[i].goods_ischeck = false
                    } else {
                        result[i].goods_ischeck = true
                    }
                    if(i >= result.length - 1) {
                        res.json({
                            result
                        })
                    }
                }) 
            }
        }
    })
}

// 删除购物车商品
module.exports.delcart = (req,res) => {
    console.log(req.params.id)
    connection.query('delete from cart where id =?',req.params.id,(error,result) => {
        if (error) {
            console.log(error)
        } else {
            res.json({
                ok: 1,
                data: result
            })
        }
    })
}