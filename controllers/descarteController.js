const { Descarte, AgenteDeSalud, LoteInterno, Persona } = require("../models/relaciones");
const { createRegistro } = require("./registroController");

// Obtener todos los descartes
const listarDescartes = async (req, res) => {
    try {
        const descartes = await Descarte.findAll({
            include: [
                {
                    model: AgenteDeSalud,
                    attributes: ["DNI"], 
                    include: [
                        {
                            model: Persona,
                            attributes: ["DNI", "nombre", "apellido"],
                        },
                    ],
                },
            ],
        });
        res.render("descarte/viewDescarte", { descartes: descartes });
    } catch (error) {
        res.status(500).json({
            message: "Error al obtener los descartes. " + error.message,
        });
    }
};

const formDescarte = async (req, res) => {
    try {
        const personas = await Persona.findAll();
        const lotesInternos = await LoteInterno.findAll();
        res.render("descarte/formDescarte", {
            personas: personas,
            lotesInternos: lotesInternos,
        });
    } catch (error) {
        res.status(500).json({
            message: "Error al obtener los descartes. " + error.message,
        });
    }
};

// Crear un nuevo descarte
const createDescarte = async (req, res) => {
    try {
        const { DNIAgente, numeroDeSerie, empresaDescartante, motivo, cantidadDeVacunas, fechaDeDescarte } = req.body;

        const descarte = await Descarte.create({
            DNIAgente,
            numeroDeSerie,
            empresaDescartante,
            motivo,
            cantidadDeVacunas,
            fechaDeDescarte,
            activo: 1,
        });

        const loteEncontrado = await LoteInterno.findOne({
            where: { numeroDeSerie: numeroDeSerie },
        });
        if (loteEncontrado) {
            const vacunasTotales = loteEncontrado.cantidadDeVacunasRestantes - cantidadDeVacunas;
            await loteEncontrado.update({
                cantidadDeVacunasRestantes: vacunasTotales,
            });
        }
        await createRegistro(req.user.idUsuario, "Descarte", descarte.dataValues.idDescarte, "Creacion");
        await createRegistro(req.user.idUsuario, "Descarte", descarte.dataValues.idDescarte, "Alta");
        req.flash("success", "Descarte creado exitosamente.");
        res.redirect("/descartes");
    } catch (error) {
        console.error(error);
        req.flash("error", "Error al crear el descarte.");
        res.status(500).json({ message: "Error al crear el descarte." });
    }
};

const detailsDescarte = async (req, res) => {
    try {
        const descarte = await Descarte.findByPk(req.params.id, {
            include: [
                {
                    model: AgenteDeSalud,
                    include: [
                        { model: Persona, attributes: ["nombre", "apellido"] },
                    ],
                },
            ],
        });
        res.render("descarte/detailsDescarte", { descarte: descarte });
    } catch (error) {
        res.status(500).json({
            message: "Error al obtener el descarte. Error: " + error.message,
        });
    }
};

const editDescarte = async (req, res) => {
    try {
        const descarte = await Descarte.findByPk(req.params.id);
        const personas = await Persona.findAll();
        const lotesInternos = await LoteInterno.findAll();
        const empresas = ["Veolia", "Clean Harbors", "Waste Management", "Stericycle"];
        const motivos = ["Vencida", "Rotura", "Cadena Pérdida de Frío", "Contaminación"];
        res.render("descarte/editDescarte", {
            descarte: descarte,
            personas: personas,
            lotesInternos: lotesInternos,
            motivos: motivos,
            empresas: empresas,
        });
    } catch (error) {
        res.status(500).json({
            message: "Error al obtener el descarte. Error: " + error.message,
        });
    }
};

// Actualizar un descarte por su ID
const updateDescarte = async (req, res) => {
    try {
        await Descarte.update(req.body, {
            where: { idDescarte: req.params.id },
        });
        await createRegistro(req.user.idUsuario, "Descarte", req.params.id, "Modificacion");
        req.flash("success", "Descarte de vacunas actualizado exitosamente.");
        res.redirect("/descartes");
    } catch (error) {
        res.status(500).json({
            message: "Error al actualizar el descarte. " + error.message,
        });
    }
};

// Eliminar un descarte por su ID
const deleteDescarte = async (req, res) => {
    try {
        const descarte = await Descarte.findByPk(req.params.id);
        if (descarte) {
            await descarte.destroy();
            await createRegistro(req.user.idUsuario, "Descarte", req.params.id, "Eliminacion");
            req.flash("success", "Descarte de Vacuna eliminada exitosamente.");
            res.json({ success: true });
        } else {
            res.status(404).json({ message: "Descarte no encontrado." });
        }
    } catch (error) {
        res.status(500).json({ message: "Error al eliminar el descarte. " + error.message });
    }
};

module.exports = {
    listarDescartes,
    formDescarte,
    createDescarte,
    detailsDescarte,
    editDescarte,
    updateDescarte,
    deleteDescarte,
};
