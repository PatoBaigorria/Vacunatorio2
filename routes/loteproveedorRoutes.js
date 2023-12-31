const express = require("express");
const router = express.Router();
const controllers = require("../controllers/indexController");

// Importación del controlador
router.get("/", controllers.loteProveedorController.listarLotesProveedores);
router.get("/alta", controllers.loteProveedorController.altaLoteProveedor);
router.post("/", controllers.loteProveedorController.createLoteProveedor);
router.get("/:id", controllers.loteProveedorController.editLoteProveedor);
router.put("/:id", controllers.loteProveedorController.updateLoteProveedor);
router.delete("/:id", controllers.loteProveedorController.deleteLoteProveedor);

module.exports = router;