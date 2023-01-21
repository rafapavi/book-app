const RoomModel = (sequelize, DataTypes) => {
  return sequelize.define(
    "room",
    {
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      hotelId: {
        type: DataTypes.INTEGER,
      },
      roomDetailId: {
        type: DataTypes.INTEGER,
      },
      price: {
        type: DataTypes.FLOAT,
      },
      status: {
        type: DataTypes.CHAR,
      },
      createdBy: {
        type: DataTypes.INTEGER,
      },
      updatedBy: {
        type: DataTypes.INTEGER,
      },
    },
    {
      tableName: "room",
      timestamps: true,
    }
  );
};

export default RoomModel;
