const express = require("express");
const router = express.Router();
const trasladoController = require("../controllers/trasladoController");
const authorize = require("../middleware/authorize");

router.get("/",	authorize(["Super Admin", "Operador de logistica", "Agente de salud"]),	trasladoController.listarTraslados);
router.get("/crear", authorize(["Super Admin", "Operador de logistica", "Agente de salud"]), trasladoController.altaTraslado);
router.put("/:id/alta",	authorize(["Super Admin", "Operador de logistica", "Agente de salud"]),	trasladoController.altaLogicaTraslado);
router.put("/:id/baja", authorize(["Super Admin", "Operador de logistica", "Agente de salud"]), trasladoController.bajaTraslado);
router.post("/", authorize(["Super Admin", "Operador de logistica", "Agente de salud"]), trasladoController.createTraslados);
router.get("/:id", authorize(["Super Admin", "Operador de logistica", "Agente de salud"]), trasladoController.editTraslado);
router.put("/:id", authorize(["Super Admin", "Operador de logistica", "Agente de salud"]), trasladoController.updateTraslado);
router.delete("/:id", authorize(["Super Admin", "Operador de logistica", "Agente de salud"]), trasladoController.deleteTrasladoFisica);


module.exports = router;
