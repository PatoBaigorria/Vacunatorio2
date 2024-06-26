const {
	Traslado,
	LoteInterno,
	CentroDeVacunacion,
} = require("../models/relaciones");
const { createRegistro } = require("./registroController");

// Obtener todos los traslados
const listarTraslados = async (req, res) => {
	try {
		const traslados = await Traslado.findAll({
			raw: true,
		});
		const lotesInternos = await LoteInterno.findAll({
			raw: true,
		});
		const centrosDeVacunacion = await CentroDeVacunacion.findAll({
			raw: true,
		});
		res.render("traslado/viewTraslado", {
			traslados: traslados,
			lotesInternos: lotesInternos,
			centrosDeVacunacion: centrosDeVacunacion,
		});
	} catch (error) {
		res.status(500).json({
			message: "Error al obtener los traslados.",
		});
	}
};

// Muestra formulario de creacion de Traslado
const altaLogicaTraslado = async (req, res) => {
	try {
		await Traslado.update(
			{
				activo: 1,
			},
			{
				where: {
					idTraslado: req.params.id,
				},
			}
		);
		await createRegistro(
			req.user.idUsuario,
			"Traslado",
			req.params.id,
			"Alta"
		);
		req.flash("success", "Traslado dado de alta exitosamente.");
		res.json({ success: true });
	} catch (error) {
		console.error("Error al dar de alta el traslado:", error);
		req.flash("error", "Error al dar de alta el traslado.");
		res.status(500).json({ success: false, message: error.message });
	}
};

// Muestra formulario de creacion de Traslado
const altaTraslado = async (req, res) => {
	try {
		const lotesInternos = await LoteInterno.findAll();
		const centrosDeVacunacion = await CentroDeVacunacion.findAll();
		res.render("traslado/formTraslado", {
			lotesInternos: lotesInternos,
			centrosDeVacunacion: centrosDeVacunacion,
		});
	} catch (error) {
		res.status(500).json({
			message: "Error al crear el traslado.",
		});
	}
};


const createTraslados = async (req, res) => {
    try {
        const { numeroDeSerie, idCentroDeVacunacion, fechaDeSalida } = req.body;

        // Verificación adicional
        if (!numeroDeSerie || !idCentroDeVacunacion || !fechaDeSalida) {
            req.flash('error', 'Todos los campos son obligatorios.');
            return res.redirect('/traslados/crear');
        }

        let fechaDeLlegada = req.body.fechaDeLlegada;
        if (req.body.fechaDeLlegada == "") {
            fechaDeLlegada = null;
        } else {
            fechaDeLlegada = req.body.fechaDeLlegada;
        }

        const traslado = await Traslado.create({
            numeroDeSerie,
            idCentroDeVacunacion,
            fechaDeSalida,
            fechaDeLlegada,
            activo: 1,
        });

        if (fechaDeLlegada != null) {
            const loteEncontrado = await LoteInterno.findOne({
                where: { numeroDeSerie: numeroDeSerie },
            });
            if (loteEncontrado) {
                await loteEncontrado.update({
                    idCentroDeVacunacion: idCentroDeVacunacion,
                });
            }
        }

        await createRegistro(
            req.user.idUsuario,
            "Traslado",
            traslado.dataValues.idTraslado,
            "Creacion"
        );
        await createRegistro(
            req.user.idUsuario,
            "Traslado",
            traslado.dataValues.idTraslado,
            "Alta"
        );
        req.flash("success", "Traslado creado exitosamente");
        res.redirect("/traslados");
    } catch (error) {
        res.status(500).json({
            message: "Error al crear el traslado: " + error.message,
        });
    }
};

// Editar Traslado por ID
const editTraslado = async (req, res) => {
    try {
        const traslado = await Traslado.findByPk(req.params.id);
        const lotesInternos = await LoteInterno.findAll();
        const centrosDeVacunacion = await CentroDeVacunacion.findAll();

        if (!traslado) {
            req.flash('error', 'Traslado no encontrado.');
            return res.redirect('/traslados');
        }

        res.render("traslado/editTraslado", {
            traslado: traslado,
            lotesInternos: lotesInternos,
            centrosDeVacunacion: centrosDeVacunacion,
        });
    } catch (error) {
        res.status(500).json({
            message: "Error al obtener el Traslado: " + error.message,
        });
    }
};



// Actualizar un traslado por su ID
const updateTraslado = async (req, res) => {
	try {
		await Traslado.update(req.body, {
			where: {
				idTraslado: req.params.id,
			},
		});
		await createRegistro(
			req.user.idUsuario,
			"Traslado",
			req.params.id,
			"Modificacion"
		);
		req.flash("success", "Traslado de Vacuna actualizado exitosamente.");
		res.redirect("/traslados");
	} catch (error) {
		res.status(500).json({
			message: "Error al actualizar el traslado." + error.message,
		});
	}
};

// Eliminar un traslado por su ID
const deleteTrasladoFisica = async (req, res) => {
	try {
		await Traslado.destroy({
			where: {
				idTraslado: req.params.id,
			},
		});
		req.flash("success", "Traslado eliminado exitosamente.");
		res.json({ success: true });
	} catch (error) {
		res.status(500).json({
			message: "Error al eliminar el traslado." + error.message,
		});
	}
};

const bajaTraslado = async (req, res) => {
	try {
		await Traslado.update(
			{
				activo: 0,
			},
			{
				where: {
					idTraslado: req.params.id,
				},
			}
		);
		await createRegistro(
			req.user.idUsuario,
			"Traslado",
			req.params.id,
			"Baja"
		);
		req.flash("success", "Traslado dado de baja exitosamente.");
		res.json({ success: true });
	} catch (error) {
		res.status(500).json({ message: "Error al dar de baja el traslado." });
	}
};

module.exports = {
	listarTraslados,
	altaLogicaTraslado,
	altaTraslado,
	createTraslados,
	editTraslado,
	updateTraslado,
	deleteTrasladoFisica,
	bajaTraslado,
};
