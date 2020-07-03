const express = require('express');
const router = express.Router();
const db = require("../database/easydb")
/* PUT produtos. */
router.post('/', async (req, res) => {

  let produto = {nome, codigo,preco, descricao, categoria} = req.body;

  const icmsPorcentagem = 0.18

  produto.map((prod) => {
    prod.estabecimento = process.env.NOMENEGOCIO || "mercadinho";
    prod.imposto = prod.preco * icmsPorcentagem
    prod.preco = prod.preco + prod.imposto
    prod.icms = icmsPorcentagem
  })
  try{
    db.put('produtos',
        {produto},
        err => {
          if(err === null){
            res.status(201).json({
              "status": true,
              "produto": produto
            })
          }else{
            res.status(500).json({
              "status": false,
              "erro": err
            })
          }
        })
  }catch (e) {
    res.status(500).json({
      "status": false,
      "erro": e
    })
  }
});
/* GET Produtos */
router.get("/", async (req, res) => {
  res.json(await db.get("produtos"))
})

module.exports = router;
