"use strict";
const { Model, DataTypes } = require("sequelize");
const sequelize = require("../database/db");
class Agentedesalud extends Model {}

const agentedesalud = Agentedesalud.init(
	{
		DNI: {
			type: DataTypes.INTEGER,
			primaryKey: true,
			foreignKey: true,
		},
		matricula: {
			allowNull: true,
			type: DataTypes.INTEGER,
			unique: true,
		},
	},
	{
		sequelize,
		freezeTableName: true,
		timestamps: false,
		modelName: "Agentedesalud",
		tableName: "agentedesalud",
	}
);
module.exports = agentedesalud;
