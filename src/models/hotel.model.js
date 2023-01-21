const HotelModel = (sequelize, DataTypes) => {
  return sequelize.define(
    "hotel",
    {
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      name: {
        type: DataTypes.STRING,
      },
      address: {
        type: DataTypes.STRING,
      },
      rating: {
        type: DataTypes.STRING,
      },
      checkInTime: {
        type: DataTypes.STRING,
      },
      checkOutTime: {
        type: DataTypes.STRING,
      },
      amenities: {
        type: DataTypes.STRING,
      },
      createdBy: {
        type: DataTypes.INTEGER,
      },
      updatedBy: {
        type: DataTypes.INTEGER,
      },
    },
    {
      tableName: "hotel",
      timestamps: true,
    }
  );
};

export default HotelModel;
