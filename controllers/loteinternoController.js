const {
	Laboratorio,
	LoteProveedor,
	LoteInterno,
	DepositoNacional,
	DepositoProvincial,
	CentroDeVacunacion,
} = require("../models/relaciones");

// Obtener todos los lotes internos
const listarLotesInternos = async (req, res) => {
	try {
		const lotesInternos = await LoteInterno.findAll(
			{
				include: [{ model: LoteProveedor, attributes: ['numeroDeLote'] },
				{ model: Laboratorio, attributes: ['nombreLaboratorio'] }]
			});
		res.render("loteinterno/viewLoteInterno", {
			lotesInternos: lotesInternos,
		});
	} catch (error) {
		req.flash('error', 'Error al obtener los lotes internos. ' + error.message)
		res.redirect('/lotesinternos')
	}
};

const altaLoteInterno = async (req, res) => {
	try {
		const lotesInternos = await LoteInterno.findAll();
		const lotesProveedores = await LoteProveedor.findAll();
		const laboratorios = await Laboratorio.findAll();
		const depositosNacionales = await DepositoNacional.findAll();
		const depositosProvinciales = await DepositoProvincial.findAll();
		const centrosDeVacunaciones = await CentroDeVacunacion.findAll();
		res.render("loteinterno/formLoteInterno", {
			lotesInternos: lotesInternos,
			lotesProveedores: lotesProveedores,
			laboratorios: laboratorios,
			depositosNacionales: depositosNacionales,
			depositosProvinciales: depositosProvinciales,
			centrosDeVacunaciones: centrosDeVacunaciones,
		});
	} catch (error) {
		res.status(500).json({
			message: "Error al crear el lote interno."
		});
	}
};

// Crear un nuevo lote interno
const createLoteInterno = async (req, res) => {
	try {
		let { numeroDeSerie, numeroDeLote, idLaboratorio, cantidadDeVacunas, fechaDeLlegadaDepositoNacional, idDepositoNacional, fechaDeSalidaDepositoNacional, fechaDeLlegadaDepositoProvincial, idDepositoProvincial, fechaDeSalidaDepositoProvincial, fechaDeLlegadaCentroDeVacunacion, idCentroDeVacunacion } = req.body;
		if (idDepositoNacional == '') {
			idDepositoNacional = null;
		}
		if (idDepositoProvincial == '') {
			idDepositoProvincial = null;
		}
		if (idCentroDeVacunacion == '') {
			idCentroDeVacunacion = null;
		}
		if (fechaDeLlegadaDepositoNacional === '') {
			fechaDeLlegadaDepositoNacional = null;
		}
		if (fechaDeSalidaDepositoNacional === '') {
			fechaDeSalidaDepositoNacional = null;
		}
		if (fechaDeLlegadaDepositoProvincial === '') {
			fechaDeLlegadaDepositoProvincial = null;
		}
		if (fechaDeSalidaDepositoProvincial === '') {
			fechaDeSalidaDepositoProvincial = null;
		}
		if (fechaDeLlegadaCentroDeVacunacion === '') {
			fechaDeLlegadaCentroDeVacunacion = null;
		}
		await LoteInterno.create({
			numeroDeSerie,
			numeroDeLote,
			idLaboratorio,
			cantidadDeVacunasTotales: cantidadDeVacunas,
			cantidadDeVacunasRestantes: cantidadDeVacunas,
			fechaDeLlegadaDepositoNacional,
			idDepositoNacional,
			fechaDeSalidaDepositoNacional,
			fechaDeLlegadaDepositoProvincial,
			idDepositoProvincial,
			fechaDeSalidaDepositoProvincial,
			fechaDeLlegadaCentroDeVacunacion,
			idCentroDeVacunacion
		});
		req.flash('success', 'Lote Interno creado exitosamente.');
		res.redirect("/lotesinternos");
	} catch (error) {
		req.flash('error', 'Error al crear el lote interno.');
		res.status(500).json({
			message: "Error al crear el lote interno. " + error.message
		});
	}
};

const editLoteInterno = async (req, res) => {
	try {
		const loteInterno = await LoteInterno.findByPk(req.params.id);
		const lotesProveedores = await LoteProveedor.findAll();
		const laboratorios = await Laboratorio.findAll();
		const depositosNacionales = await DepositoNacional.findAll();
		const depositosProvinciales = await DepositoProvincial.findAll();
		const centrosDeVacunaciones = await CentroDeVacunacion.findAll();
		res.render("loteinterno/editLoteInterno", {
			loteInterno: loteInterno,
			lotesProveedores: lotesProveedores,
			laboratorios: laboratorios,
			depositosNacionales: depositosNacionales,
			depositosProvinciales: depositosProvinciales,
			centrosDeVacunaciones: centrosDeVacunaciones,
		});
	} catch (error) {
		res.status(500).json({
			message: "Error al obtener el lote interno.",
		});
	}
};

// Actualizar un lote interno por su ID
const updateLoteInterno = async (req, res) => {
	try {
		let { numeroDeSerie, numeroDeLote, idLaboratorio, cantidadDeVacunas, fechaDeLlegadaDepositoNacional, idDepositoNacional, fechaDeSalidaDepositoNacional, fechaDeLlegadaDepositoProvincial, idDepositoProvincial, fechaDeSalidaDepositoProvincial, fechaDeLlegadaCentroDeVacunacion, idCentroDeVacunacion } = req.body;
		if (idDepositoNacional == '') {
			idDepositoNacional = null;
		}
		if (idDepositoProvincial == '') {
			idDepositoProvincial = null;
		}
		if (idCentroDeVacunacion == '') {
			idCentroDeVacunacion = null;
		}
		if (fechaDeLlegadaDepositoNacional === '') {
			fechaDeLlegadaDepositoNacional = null;
		}
		if (fechaDeSalidaDepositoNacional === '') {
			fechaDeSalidaDepositoNacional = null;
		}
		if (fechaDeLlegadaDepositoProvincial === '') {
			fechaDeLlegadaDepositoProvincial = null;
		}
		if (fechaDeSalidaDepositoProvincial === '') {
			fechaDeSalidaDepositoProvincial = null;
		}
		if (fechaDeLlegadaCentroDeVacunacion === '') {
			fechaDeLlegadaCentroDeVacunacion = null;
		}
		await LoteInterno.update({
			numeroDeSerie,
			numeroDeLote,
			idLaboratorio,
			cantidadDeVacunasTotales: cantidadDeVacunas,
			cantidadDeVacunasRestantes: cantidadDeVacunas,
			fechaDeLlegadaDepositoNacional,
			idDepositoNacional,
			fechaDeSalidaDepositoNacional,
			fechaDeLlegadaDepositoProvincial,
			idDepositoProvincial,
			fechaDeSalidaDepositoProvincial,
			fechaDeLlegadaCentroDeVacunacion,
			idCentroDeVacunacion
		}, {
			where: {
				numeroDeSerie: req.params.id
			},
		});
		req.flash('success', 'Lote Interno actualizado exitosamente.');
		res.redirect("/lotesinternos");
	} catch (error) {
		res.status(500).json({
			message: "Error al actualizar el lote interno. " + error.message
		});
	}
};

// Eliminar un lote interno por su ID
const deleteLoteInterno = async (req, res) => {
	try {
		await LoteInterno.destroy({
			where: {
				numeroDeSerie: req.params.id
			},
		});
		req.flash('success', 'Lote Interno eliminado exitosamente.');
		res.json({ success: true });
	} catch (error) {
		res.status(500).json({ message: "Error al eliminar el lote interno." });
	}
};

module.exports = {
	listarLotesInternos,
	altaLoteInterno,
	createLoteInterno,
	editLoteInterno,
	updateLoteInterno,
	deleteLoteInterno,
};